//  NSDate+CBHDateKit.m
//  CBHDateKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, February 2013.
//  Copyright (c) 2013 Christian Huxtable. All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#import "NSDate+CBHDateKit.h"

@import Foundation;

#define TIME_COMPONENTS (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond)
#define DATE_COMPONENTS (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)

#define D_MINUTE	(NSInteger)60
#define D_HOUR		(NSInteger)3600
#define D_DAY		(NSInteger)86400
#define D_WEEK		(NSInteger)604800
#define D_YEAR		(NSInteger)31556926


@implementation NSDate (CBHDateKit)

#pragma mark - Shared Calendar

+ (NSCalendar *)sharedCalendar
{
	static NSCalendar *sharedCalendar = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
	});
	return sharedCalendar;
}


#pragma mark - Relative Dates

+ (instancetype)dateTomorrow
{
	return [NSDate dateWithDaysFromNow:1];
}

+ (instancetype)dateYesterday
{
	return [NSDate dateWithDaysBeforeNow:1];
}


+ (instancetype)dateWithMinutesFromNow:(NSInteger)minutes
{
	return [[NSDate date] dateByAddingMinutes:minutes];
}

+ (instancetype)dateWithMinutesBeforeNow:(NSInteger)minutes
{
	return [[NSDate date] dateBySubtractingMinutes:minutes];
}


+ (instancetype)dateWithHoursFromNow:(NSInteger)hours
{
	return [[NSDate date] dateByAddingHours:hours];
}

+ (instancetype)dateWithHoursBeforeNow:(NSInteger)hours
{
	return [[NSDate date] dateBySubtractingHours:hours];
}


+ (instancetype)dateWithDaysFromNow:(NSInteger)days
{
	return [[NSDate date] dateByAddingDays:days];
}

+ (instancetype)dateWithDaysBeforeNow:(NSInteger)days
{
	return [[NSDate date] dateBySubtractingDays:days];
}


#pragma mark - Comparing Dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date
{
	NSCalendar *calendar = [NSDate sharedCalendar];
	NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
	NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];

	return ((components1.year == components2.year) && (components1.month == components2.month) && (components1.day == components2.day));
}

- (BOOL)isEqualToDateIgnoringNanoSeconds:(NSDate *)date
{
	NSCalendar *calendar = [NSDate sharedCalendar];
	NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:self];
	NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:date];

	return ((components1.year == components2.year) && (components1.month == components2.month) && (components1.day == components2.day) && (components1.hour == components2.hour) && (components1.minute == components2.minute) && (components1.second == components2.second));
}


- (BOOL)isSameDayAsDate:(NSDate *)date
{
	return [self isEqualToDateIgnoringTime:date];
}

- (BOOL)isToday
{
	return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow
{
	return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL)isYesterday
{
	return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]];
}

- (BOOL)isSameWeekAsDate:(NSDate *)date
{
	if ([self weekOfYear] != [date weekOfYear]) { return NO; }

	/// Must have a time interval under 1 week. Thanks @aclark
	return (labs((NSInteger)[self timeIntervalSinceDate:date]) < D_WEEK);
}

- (BOOL)isThisWeek
{
	return [self isSameWeekAsDate:[NSDate date]];
}

- (BOOL)isNextWeek
{
	const NSTimeInterval interval = [NSDate timeIntervalSinceReferenceDate] + D_WEEK;
	return [self isSameWeekAsDate:[NSDate dateWithTimeIntervalSinceReferenceDate:interval]];
}

- (BOOL)isLastWeek
{
	const NSTimeInterval interval = [NSDate timeIntervalSinceReferenceDate] - D_WEEK;
	return [self isSameWeekAsDate:[NSDate dateWithTimeIntervalSinceReferenceDate:interval]];
}

- (BOOL)isSameMonthAsDate:(NSDate *)date
{
	NSCalendar *calendar = [NSDate sharedCalendar];
	NSDateComponents *components1 = [calendar components:(NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:self];
	NSDateComponents *components2 = [calendar components:(NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];

	return ((components1.month == components2.month) && (components1.year == components2.year));
}

- (BOOL)isThisMonth
{
	return [self isSameMonthAsDate:[NSDate date]];
}

- (BOOL)isSameYearAsDate:(NSDate *)date
{
	return ([self year] == [date year]);
}

- (BOOL)isThisYear
{
	return [self isSameYearAsDate:[NSDate date]];
}

- (BOOL)isNextYear
{
	return ([self year] == ([[NSDate date] year] + 1));
}

- (BOOL)isLastYear
{
	return ([self year] == ([[NSDate date] year] - 1));
}

- (BOOL)isEarlierThanDate:(NSDate *)date
{
	return ([self compare:date] == NSOrderedAscending);
}

- (BOOL)isLaterThanDate:(NSDate *)date
{
	return ([self compare:date] == NSOrderedDescending);
}


- (BOOL)isInTheFuture
{
	return [self isLaterThanDate:[NSDate date]];
}

- (BOOL)isInThePast
{
	return [self isEarlierThanDate:[NSDate date]];
}


#pragma mark - Roles

- (BOOL)isWorkday
{
	return ![self isWeekend];
}

- (BOOL)isWeekend
{
	const NSInteger weekday = [self weekday];
	return ((weekday == 1) || (weekday == 7));
}


#pragma mark - Adjusting Dates

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes
{
	const NSTimeInterval interval = [self timeIntervalSinceReferenceDate] + (D_MINUTE * minutes);
	return [NSDate dateWithTimeIntervalSinceReferenceDate:interval];
}

- (NSDate *)dateBySubtractingMinutes:(NSInteger)minutes
{
	return [self dateByAddingMinutes:-minutes];
}


- (NSDate *)dateByAddingHours:(NSInteger)hours
{
	const NSTimeInterval interval = [self timeIntervalSinceReferenceDate] + (D_HOUR * hours);
	return [NSDate dateWithTimeIntervalSinceReferenceDate:interval];
}

- (NSDate *)dateBySubtractingHours:(NSInteger)hours
{
	return [self dateByAddingHours:-hours];
}


- (NSDate *)dateByAddingDays:(NSInteger)days
{
	const NSTimeInterval interval = [self timeIntervalSinceReferenceDate] + (D_DAY * days);
	return [NSDate dateWithTimeIntervalSinceReferenceDate:interval];
}

- (NSDate *)dateBySubtractingDays:(NSInteger)days
{
	return [self dateByAddingDays:-days];
}


- (NSDate *)dateAtStartOfDay
{
	NSDateComponents *components = [self dateAndTimeComponents];
	components.hour = 0;
	components.minute = 0;
	components.second = 0;

	return [[NSDate sharedCalendar] dateFromComponents:components];
}


#pragma mark - Retrieving Intervals

- (NSInteger)secondsAfterDate:(NSDate *)date
{
	return (NSInteger)[self timeIntervalSinceDate:date];
}

- (NSInteger)secondsBeforeDate:(NSDate *)date
{
	return (NSInteger)[date timeIntervalSinceDate:self];
}

- (NSInteger)minutesAfterDate:(NSDate *)date
{
	return (NSInteger)([self timeIntervalSinceDate:date] / D_MINUTE);
}

- (NSInteger)minutesBeforeDate:(NSDate *)date
{
	return (NSInteger)([date timeIntervalSinceDate:self] / D_MINUTE);
}

- (NSInteger)hoursAfterDate:(NSDate *)date
{
	return (NSInteger)([self timeIntervalSinceDate:date] / D_HOUR);
}

- (NSInteger)hoursBeforeDate:(NSDate *)date
{
	return (NSInteger)([date timeIntervalSinceDate:self] / D_HOUR);
}

- (NSInteger)daysAfterDate:(NSDate *)date
{
	return (NSInteger)([self timeIntervalSinceDate:date] / D_DAY);
}

- (NSInteger)daysBeforeDate:(NSDate *)date
{
	return (NSInteger)([date timeIntervalSinceDate:self] / D_DAY);
}

- (NSInteger)yearsAfterDate:(NSDate *)date
{
	return (NSInteger)([self timeIntervalSinceDate:date] / D_YEAR);
}

- (NSInteger)yearsBeforeDate:(NSDate *)date
{
	return (NSInteger)([date timeIntervalSinceDate:self] / D_YEAR);
}


#pragma mark - Decomposing Dates

- (NSDateComponents *)components:(NSCalendarUnit)unitFlags
{
	return [[NSDate sharedCalendar] components:unitFlags fromDate:self];
}


- (NSDateComponents *)componentsSpanningDates:(NSDate *)date
{
	return [self components:DATE_COMPONENTS spanningDates:date];
}

- (NSDateComponents *)components:(NSCalendarUnit)unitFlags spanningDates:(NSDate *)date
{
	return [[NSDate sharedCalendar] components:unitFlags fromDate:self toDate:date options:0];
}


- (NSDateComponents *)dateAndTimeComponents
{
	return [[NSDate sharedCalendar] components:DATE_COMPONENTS fromDate:self];
}

- (NSDateComponents *)timeComponents
{
	return [[NSDate sharedCalendar] components:TIME_COMPONENTS fromDate:self];
}


- (NSInteger)nearestHour
{
	const NSTimeInterval interval = [self timeIntervalSinceReferenceDate] + (D_MINUTE * 30);
	return [[NSDate dateWithTimeIntervalSinceReferenceDate:interval] hour];
}

- (NSInteger)hour
{
	return [[self components:NSCalendarUnitHour] hour];
}

- (NSInteger)minute
{
	return [[self components:NSCalendarUnitMinute] minute];
}

- (NSInteger)second
{
	return [[self components:NSCalendarUnitSecond] second];
}

- (NSInteger)nanosecond
{
	return [[self components:NSCalendarUnitNanosecond] nanosecond];
}


- (NSInteger)day
{
	return [[self components:NSCalendarUnitDay] day];
}

- (NSInteger)weekday
{
	return [[self components:NSCalendarUnitWeekday] weekday];
}

- (NSInteger)nthWeekday
{
	return [[self components:NSCalendarUnitWeekdayOrdinal] weekdayOrdinal];
}

- (NSInteger)weekOfYear
{
	return [[self components:NSCalendarUnitWeekOfYear] weekOfYear];
}

- (NSInteger)month
{
	return [[self components:NSCalendarUnitMonth] month];
}

- (NSInteger)year
{
	return [[self components:NSCalendarUnitYear] year];
}

@end

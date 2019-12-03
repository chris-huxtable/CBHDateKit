//  NSDate+CBHDateKit.h
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

@import Foundation.NSDate;
@import Foundation.NSCalendar;


NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CBHDateKit)

#pragma mark - Shared Calendar

+ (NSCalendar *)sharedCalendar;


#pragma mark - Relative Dates

+ (instancetype)dateTomorrow;
+ (instancetype)dateYesterday;

+ (instancetype)dateWithMinutesFromNow:(NSInteger)minutes;
+ (instancetype)dateWithMinutesBeforeNow:(NSInteger)minutes;

+ (instancetype)dateWithHoursFromNow:(NSInteger)hours;
+ (instancetype)dateWithHoursBeforeNow:(NSInteger)hours;

+ (instancetype)dateWithDaysFromNow:(NSInteger)days;
+ (instancetype)dateWithDaysBeforeNow:(NSInteger)days;


#pragma mark - Comparing Dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;
- (BOOL)isEqualToDateIgnoringNanoSeconds:(NSDate *)date;

- (BOOL)isSameDayAsDate:(NSDate *)date;
@property (nonatomic, readonly) BOOL isToday;
@property (nonatomic, readonly) BOOL isTomorrow;
@property (nonatomic, readonly) BOOL isYesterday;

- (BOOL)isSameWeekAsDate:(NSDate *)date;
@property (nonatomic, readonly) BOOL isThisWeek;
@property (nonatomic, readonly) BOOL isNextWeek;
@property (nonatomic, readonly) BOOL isLastWeek;

- (BOOL)isSameMonthAsDate:(NSDate *)date;
@property (nonatomic, readonly) BOOL isThisMonth;

- (BOOL)isSameYearAsDate:(NSDate *)date;
@property (nonatomic, readonly) BOOL isThisYear;
@property (nonatomic, readonly) BOOL isNextYear;
@property (nonatomic, readonly) BOOL isLastYear;

- (BOOL)isEarlierThanDate:(NSDate *)date;
- (BOOL)isLaterThanDate:(NSDate *)date;

@property (nonatomic, readonly) BOOL isInTheFuture;
@property (nonatomic, readonly) BOOL isInThePast;


#pragma mark - Date Roles

@property (nonatomic, readonly) BOOL isWorkday;
@property (nonatomic, readonly) BOOL isWeekend;


#pragma mark - Adjusting Dates

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateBySubtractingMinutes:(NSInteger)minutes;

- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateBySubtractingHours:(NSInteger)hours;

- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateBySubtractingDays:(NSInteger)days;

@property (nonatomic, readonly) NSDate *dateAtStartOfDay;


#pragma mark - Intervals

- (NSInteger)secondsAfterDate:(NSDate *)date;
- (NSInteger)secondsBeforeDate:(NSDate *)date;

- (NSInteger)minutesAfterDate:(NSDate *)date;
- (NSInteger)minutesBeforeDate:(NSDate *)date;

- (NSInteger)hoursAfterDate:(NSDate *)date;
- (NSInteger)hoursBeforeDate:(NSDate *)date;

- (NSInteger)daysAfterDate:(NSDate *)date;
- (NSInteger)daysBeforeDate:(NSDate *)date;

- (NSInteger)yearsAfterDate:(NSDate *)date;
- (NSInteger)yearsBeforeDate:(NSDate *)date;


#pragma mark - Decomposing Dates

- (NSDateComponents *)components:(NSCalendarUnit)unitFlags;

- (NSDateComponents *)componentsSpanningDates:(NSDate *)date;
- (NSDateComponents *)components:(NSCalendarUnit)unitFlags spanningDates:(NSDate *)date;

@property (nonatomic, readonly) NSDateComponents *dateAndTimeComponents;
@property (nonatomic, readonly) NSDateComponents *timeComponents;

@property (nonatomic, readonly) NSInteger nearestHour;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger nanosecond;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger weekday;
@property (nonatomic, readonly) NSInteger nthWeekday;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger year;

@end

NS_ASSUME_NONNULL_END

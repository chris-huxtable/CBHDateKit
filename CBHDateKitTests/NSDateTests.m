//  CBHDateKitTests.m
//  CBHDateKitTests
//
//  Created by Christian Huxtable <chris@huxtable.ca>, November 2019.
//  Copyright (c) 2019 Christian Huxtable. All rights reserved.
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

@import XCTest;
@import CBHDateKit;


NS_ASSUME_NONNULL_BEGIN

static NSDateFormatter *kFormatter;

static NSDate *kDate;

static NSDate *kDateSameMinuteEarlier;
static NSDate *kDateSameMinuteLater;

static NSDate *kDateSameHourEarlier;
static NSDate *kDateSameHourLater;

static NSDate *kDateSameDayLater;
static NSDate *kDateSameDayEarlier;

static NSDate *kDateSameWeek;

static NSDate *kDateSameMonthEarlier;
static NSDate *kDateSameMonthLater;

static NSDate *kDateSameYearEarlier;
static NSDate *kDateSameYearLater;

static NSDate *kDateDiffDayEarlier;
static NSDate *kDateDiffDayLater;

static NSDate *kDateDiffYearEarlier;
static NSDate *kDateDiffYearLater;


@interface CBHDateKitTests : XCTestCase
@end

NS_ASSUME_NONNULL_END


@implementation CBHDateKitTests

+ (void)setUp
{
	kFormatter = [NSDateFormatter rfc3339];

	kDate                  = [kFormatter dateFromString:@"1988-07-24T18:30:30-04:00"]; /// July 24th, 1988 @18:30:30 EDT

	kDateSameMinuteEarlier = [kFormatter dateFromString:@"1988-07-24T18:30:01-04:00"]; /// July 24th, 1988 @18:30:01 EDT
	kDateSameMinuteLater   = [kFormatter dateFromString:@"1988-07-24T18:30:59-04:00"]; /// July 24th, 1988 @18:30:59 EDT

	kDateSameHourEarlier   = [kFormatter dateFromString:@"1988-07-24T18:00:01-04:00"]; /// July 24th, 1988 @18:00:01 EDT
	kDateSameHourLater     = [kFormatter dateFromString:@"1988-07-24T18:59:59-04:00"]; /// July 24th, 1988 @18:59:59 EDT

	kDateSameDayEarlier    = [kFormatter dateFromString:@"1988-07-24T00:00:01-04:00"]; /// July 24th, 1988 @00:00:01 EDT
	kDateSameDayLater      = [kFormatter dateFromString:@"1988-07-24T23:59:59-04:00"]; /// July 24th, 1988 @23:59:59 EDT

	kDateSameWeek          = [kFormatter dateFromString:@"1988-07-18T00:00:01-04:00"]; /// July 18th, 1988 @00:00:01 EDT

	kDateSameMonthEarlier  = [kFormatter dateFromString:@"1988-07-01T00:00:01-04:00"]; /// July  1st, 1988 @00:00:01 EDT
	kDateSameMonthLater    = [kFormatter dateFromString:@"1988-07-31T23:59:59-04:00"]; /// July 31st, 1988 @23:59:59 EDT

	kDateSameYearEarlier   = [kFormatter dateFromString:@"1988-01-01T00:00:01-04:00"]; /// January   1st, 1988 @00:00:01 EDT
	kDateSameYearLater     = [kFormatter dateFromString:@"1988-12-31T23:59:59-04:00"]; /// December 31st, 1988 @23:59:59 EDT

	kDateDiffDayEarlier    = [kFormatter dateFromString:@"1988-07-23T23:59:59-04:00"]; /// July 23th, 1988 @23:59:59 EDT
	kDateDiffDayLater      = [kFormatter dateFromString:@"1988-07-25T00:00:01-04:00"]; /// July 25th, 1988 @00:00:01 EDT

	kDateDiffYearEarlier   = [kFormatter dateFromString:@"1986-12-31T23:59:59-04:00"]; /// December 31st, 1986 @23:59:59 EDT
	kDateDiffYearLater     = [kFormatter dateFromString:@"1990-01-01T00:00:01-04:00"]; /// January   1st, 1990 @00:00:01 EDT
}

- (void)setUp
{

}


#pragma mark - Shared Calendar

- (void)testSharedCalendar
{
	NSCalendar *calendar = [NSDate sharedCalendar];
	XCTAssertNotNil(calendar, @"Shared calendar should not be nil.");

	NSCalendar *sameCalendar = [NSDate sharedCalendar];
	XCTAssertEqual(calendar, sameCalendar, @"Shared calendar should be the same.");
}


#pragma mark - Relative Dates

- (void)testDateTomorrow
{
	NSDate *date = [NSDate dateTomorrow];
	NSDate *expected = [NSDate dateWithDaysFromNow:1];

	XCTAssertTrue([date isEqualToDateIgnoringTime:expected], @"Dates should be the same.");
	XCTAssertTrue([date isTomorrow], @"Date should be tomorrow.");
	XCTAssertTrue([date isLaterThanDate:[NSDate date]], @"Tomorrow should be after today.");
	XCTAssertTrue([date isInTheFuture], @"Tomorrow should be in the future.");

	XCTAssertFalse([date isToday], @"Date should not be today.");
	XCTAssertFalse([date isInThePast], @"Tomorrow should not be in the past.");
}

- (void)testDateYesterday
{
	NSDate *date = [NSDate dateYesterday];
	NSDate *expected = [NSDate dateWithDaysBeforeNow:1];

	XCTAssertTrue([date isEqualToDateIgnoringTime:expected], @"Dates should be the same.");
	XCTAssertTrue([date isYesterday], @"Date should be yesterday.");
	XCTAssertTrue([date isEarlierThanDate:[NSDate date]], @"Yesterday should be before today.");
	XCTAssertTrue([date isInThePast], @"Yesterday should be in the past.");

	XCTAssertFalse([date isToday], @"Date should not be today.");
	XCTAssertFalse([date isInTheFuture], @"Yesterday should not be in the past.");
}

- (void)testDateWithDaysFromNow
{
	NSDate *today = [NSDate date];
	NSDate *tomorrow = [NSDate dateWithDaysFromNow:1];

	NSDate *nextWeek = [NSDate dateWithDaysFromNow:7];
	NSDate *lastWeek = [NSDate dateWithDaysBeforeNow:7];

	NSDate *nextYear = [NSDate dateWithDaysFromNow:365];
	NSDate *lastYear = [NSDate dateWithDaysBeforeNow:365];

	XCTAssertTrue([today isToday], @"Date should not be today.");
	XCTAssertTrue([tomorrow isTomorrow], @"Date should be tomorrow.");

	XCTAssertTrue([nextWeek isNextWeek], @"Date should be next week.");
	XCTAssertTrue([lastWeek isLastWeek], @"Date should be last week.");

	XCTAssertTrue([today isSameWeekAsDate:[today dateAtStartOfDay]], @"Date should be in the same week.");
	XCTAssertFalse([today isSameWeekAsDate:nextYear], @"Dates should not be in the same week.");
	XCTAssertFalse([[NSDate dateWithDaysFromNow:128] isNextWeek], @"Date should not be next week.");

	XCTAssertTrue([nextYear isNextYear], @"Date should be next year.");
	XCTAssertTrue([lastYear isLastYear], @"Date should be last year.");
}

- (void)testDateWithHoursFromNow
{
	NSDate *tomorrow = [NSDate dateWithHoursFromNow:24];
	NSDate *yesterday = [NSDate dateWithHoursBeforeNow:24];

	XCTAssertTrue([tomorrow isTomorrow],   @"Date should be tomorrow.");
	XCTAssertTrue([yesterday isYesterday], @"Date should be yesterday.");
}

- (void)testDateWithMinutesFromNow
{
	NSDate *hourFromNow = [NSDate dateWithMinutesFromNow:60];
	NSDate *hourFromNowHour = [NSDate dateWithHoursFromNow:1];
	NSDate *hourBeforeNow = [NSDate dateWithMinutesBeforeNow:60];
	NSDate *hourBeforeNowHour = [NSDate dateWithHoursBeforeNow:1];

	XCTAssertNotNil(hourFromNow, @"Date should not be nil.");
	XCTAssertNotNil(hourBeforeNow, @"Date should not be nil.");

	XCTAssertTrue([hourFromNow isEqualToDateIgnoringNanoSeconds:hourFromNowHour],  @"Dates should be equal.");
	XCTAssertTrue([hourBeforeNow isEqualToDateIgnoringNanoSeconds:hourBeforeNowHour],  @"Dates should be equal.");
}

- (void)testWeekdaysAndWeekends
{
	XCTAssertTrue([kDate isWeekend], @"Date should be on the weekend (Sunday).");
	XCTAssertTrue([kDateDiffDayEarlier isWeekend], @"Date should be on the weekend (Saturday).");
	XCTAssertFalse([kDate isWorkday], @"Date should not be on a workday (Sunday).");
}

- (void)testStartOfDay
{
	NSDate *today = [NSDate date];
	NSDate *startOfToday = [today dateAtStartOfDay];

	XCTAssertTrue([startOfToday isToday],    @"Date should be today.");
	XCTAssertTrue([startOfToday isThisWeek], @"Date should be this week.");
}

- (void)testToday
{
	NSDate *today = [NSDate date];

	XCTAssertTrue([today isToday],     @"Date should be today.");
	XCTAssertTrue([today isThisWeek],  @"Date should be this week.");
	XCTAssertTrue([today isThisMonth], @"Date should be this month.");
	XCTAssertTrue([today isThisYear],  @"Date should be this year.");
}

#pragma mark - Equality

- (void)testEquality_ignoringTime
{
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameMinuteEarlier], @"Dates should be the same ignoring time.");
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameMinuteLater],   @"Dates should be the same ignoring time.");
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameHourEarlier],   @"Dates should be the same ignoring time.");
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameHourLater],     @"Dates should be the same ignoring time.");
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameDayEarlier],    @"Dates should be the same ignoring time.");
	XCTAssertTrue([kDate isEqualToDateIgnoringTime:kDateSameDayLater],      @"Dates should be the same ignoring time.");

	XCTAssertFalse([kDate isEqualToDateIgnoringTime:kDateDiffDayEarlier], @"Dates should not be the same ignoring time.");
	XCTAssertFalse([kDate isEqualToDateIgnoringTime:kDateDiffDayLater], @"Dates should not be the same ignoring time.");
}


#pragma mark - Days

- (void)testDay_same
{
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameMinuteEarlier], @"Dates should be the same day.");
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameMinuteLater],   @"Dates should be the same day.");
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameHourEarlier],   @"Dates should be the same day.");
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameHourLater],     @"Dates should be the same day.");
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameDayEarlier],    @"Dates should be the same day.");
	XCTAssertTrue([kDate isSameDayAsDate:kDateSameDayLater],      @"Dates should be the same day.");

	XCTAssertFalse([kDate isSameDayAsDate:kDateDiffDayEarlier],   @"Dates should not be the same day.");
	XCTAssertFalse([kDate isSameDayAsDate:kDateDiffDayLater],     @"Dates should not be the same day.");
}



#pragma mark - Intervals

- (void)testIntervals
{
	XCTAssertEqual([kDate secondsAfterDate:kDateSameMinuteEarlier],   29, @"Interval not correct.");
	XCTAssertEqual([kDate secondsAfterDate:kDateSameMinuteLater],    -29, @"Interval not correct.");
	XCTAssertEqual([kDate secondsBeforeDate:kDateSameMinuteLater],    29, @"Interval not correct.");
	XCTAssertEqual([kDate secondsBeforeDate:kDateSameMinuteEarlier], -29, @"Interval not correct.");

	XCTAssertEqual([kDate minutesAfterDate:kDateSameHourEarlier],     30, @"Interval not correct.");
	XCTAssertEqual([kDate minutesAfterDate:kDateSameHourLater],      -29, @"Interval not correct.");
	XCTAssertEqual([kDate minutesBeforeDate:kDateSameHourLater],      29, @"Interval not correct.");
	XCTAssertEqual([kDate minutesBeforeDate:kDateSameHourEarlier],   -30, @"Interval not correct.");

	XCTAssertEqual([kDate hoursAfterDate:kDateSameDayEarlier],        18, @"Interval not correct.");
	XCTAssertEqual([kDate hoursAfterDate:kDateSameDayLater],          -5, @"Interval not correct.");
	XCTAssertEqual([kDate hoursBeforeDate:kDateSameDayLater],          5, @"Interval not correct.");
	XCTAssertEqual([kDate hoursBeforeDate:kDateSameDayEarlier],      -18, @"Interval not correct.");

	XCTAssertEqual([kDate daysAfterDate:kDateSameMonthEarlier],       23, @"Interval not correct.");
	XCTAssertEqual([kDate daysAfterDate:kDateSameMonthLater],         -7, @"Interval not correct.");
	XCTAssertEqual([kDate daysBeforeDate:kDateSameMonthLater],         7, @"Interval not correct.");
	XCTAssertEqual([kDate daysBeforeDate:kDateSameMonthEarlier],     -23, @"Interval not correct.");

	XCTAssertEqual([kDate yearsAfterDate:kDateDiffYearEarlier],        1, @"Interval not correct.");
	XCTAssertEqual([kDate yearsAfterDate:kDateDiffYearLater],         -1, @"Interval not correct.");
	XCTAssertEqual([kDate yearsBeforeDate:kDateDiffYearLater],         1, @"Interval not correct.");
	XCTAssertEqual([kDate yearsBeforeDate:kDateDiffYearEarlier],      -1, @"Interval not correct.");
}


#pragma mark - Decomposing Dates

- (void)testComponentsSpanning
{
	NSDate *time = [kFormatter dateFromString:@"2014-04-08T10:00:00-04:00"];
	NSDateComponents *components = [kDate componentsSpanningDates:time];

	XCTAssertEqual([components year],      25, @"Year is not correct.");
}

- (void)testComponents
{
	XCTAssertEqual([kDate nearestHour], 19, @"Nearest hour is not correct.");
	XCTAssertEqual([kDate hour],        18, @"Hour is not correct.");
	XCTAssertEqual([kDate minute],      30, @"Minute is not correct.");
	XCTAssertEqual([kDate second],      30, @"Second is not correct.");
	XCTAssertEqual([kDate nanosecond],   0, @"Nanosecond is not correct.");
	XCTAssertEqual([kDate day],         24, @"Day is not correct.");
	XCTAssertEqual([kDate weekday],      1, @"Weekday is not correct.");
	XCTAssertEqual([kDate nthWeekday],   4, @"nth Weekday is not correct.");
	XCTAssertEqual([kDate weekOfYear],  31, @"Week of the year is not correct.");
	XCTAssertEqual([kDate month],        7, @"Month is not correct.");
	XCTAssertEqual([kDate year],      1988, @"Year is not correct.");
}

- (void)testComponents_time
{
	NSDateComponents *components = [kDate timeComponents];

	XCTAssertEqual([components hour],        18, @"Hour is not correct.");
	XCTAssertEqual([components minute],      30, @"Minute is not correct.");
	XCTAssertEqual([components second],      30, @"Second is not correct.");
	XCTAssertEqual([components nanosecond],   0, @"Nanosecond is not correct.");

	XCTAssertEqual([components day],         NSDateComponentUndefined, @"day is not undefined.");
	XCTAssertEqual([components weekOfMonth], NSDateComponentUndefined, @"weekOfMonth is not undefined.");
	XCTAssertEqual([components weekOfYear],  NSDateComponentUndefined, @"weekOfYear is not undefined.");
	XCTAssertEqual([components weekday],     NSDateComponentUndefined, @"weekday is not undefined.");
	XCTAssertEqual([components year],        NSDateComponentUndefined, @"year is not undefined.");
	XCTAssertEqual([components era],         NSDateComponentUndefined, @"era is not undefined.");
}

- (void)testComponents_dateAndTime
{
	NSDateComponents *components = [kDate dateAndTimeComponents];

	XCTAssertEqual([components hour],        18, @"Hour is not correct.");
	XCTAssertEqual([components minute],      30, @"Minute is not correct.");
	XCTAssertEqual([components second],      30, @"Second is not correct.");

	XCTAssertEqual([components day],         24, @"day is not undefined.");
	XCTAssertEqual([components weekday],     1, @"weekday is not undefined.");
	XCTAssertEqual([components year],        1988, @"year is not undefined.");
}

@end

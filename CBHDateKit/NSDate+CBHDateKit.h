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

/// The automatically updating current calendar.
+ (NSCalendar *)sharedCalendar;


#pragma mark - Relative Dates

/// This time tomorrow.
+ (instancetype)dateTomorrow;

/// This time yesterday.
+ (instancetype)dateYesterday;


/** Returns a date a given number of minutes from the current time.
 *
 * @param minutes   The number of minutes from now.
 *
 * @return          The new date.
 */
+ (instancetype)dateWithMinutesFromNow:(NSInteger)minutes;

/** Returns a date a given number of minutes before the current time.
 *
 * @param minutes   The number of minutes before now.
 *
 * @return          The new date.
 */
+ (instancetype)dateWithMinutesBeforeNow:(NSInteger)minutes;


/** Returns a date a given number of hours from the current time.
 *
 * @param hours     The number of hours from now.
 *
 * @return          The new date.
 */
+ (instancetype)dateWithHoursFromNow:(NSInteger)hours;

/** Returns a date a given number of hours before the current time.
 *
 * @param hours     The number of hours before now.
 *
 * @return          The new date.
 */
+ (instancetype)dateWithHoursBeforeNow:(NSInteger)hours;


/** Returns a date a given number of days from the current time.
 *
 * @param days  The number of days from now.
 *
 * @return      The new date.
 */
+ (instancetype)dateWithDaysFromNow:(NSInteger)days;

/** Returns a date a given number of days before the current time.
 *
 * @param days  The number of days before now.
 *
 * @return      The new date.
 */
+ (instancetype)dateWithDaysBeforeNow:(NSInteger)days;


#pragma mark - Comparing Dates

/** Returns a Boolean indicating if the receiver and the given date are during the same day ignoring the time.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are on the same day.
 */
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;

/** Returns a Boolean indicating if the receiver and the given date are the same ignoring sub-second units (nanoseconds).
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are the same ignoring sub-second units (nanoseconds).
 */
- (BOOL)isEqualToDateIgnoringNanoSeconds:(NSDate *)date;


#pragma mark Comparing Days

/** Returns a Boolean indicating if the receiver and the given date are during the same day.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are on the same day.
 */
- (BOOL)isSameDayAsDate:(NSDate *)date;

/// Returns a Boolean value indicating if the receiver is today.
@property (nonatomic, readonly) BOOL isToday;

/// Returns a Boolean value indicating if the receiver is tomorrow.
@property (nonatomic, readonly) BOOL isTomorrow;

/// Returns a Boolean value indicating if the receiver is yesterday.
@property (nonatomic, readonly) BOOL isYesterday;


#pragma mark Comparing Weeks

/** Returns a Boolean indicating if the receiver and the given date are during the same week.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are in the same week.
 */
- (BOOL)isSameWeekAsDate:(NSDate *)date;

/// Returns a Boolean value indicating if the receiver is this week.
@property (nonatomic, readonly) BOOL isThisWeek;

/// Returns a Boolean value indicating if the receiver is next week.
@property (nonatomic, readonly) BOOL isNextWeek;

/// Returns a Boolean value indicating if the receiver is last week.
@property (nonatomic, readonly) BOOL isLastWeek;


#pragma mark Comparing Months

/** Returns a Boolean indicating if the receiver and the given date are during the same month.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are in the same month.
 */
- (BOOL)isSameMonthAsDate:(NSDate *)date;

/// Returns a Boolean value indicating if the receiver is this month.
@property (nonatomic, readonly) BOOL isThisMonth;


#pragma mark Comparing Years

/** Returns a Boolean indicating if the receiver and the given date are during the same year.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if both dates are in the same year.
 */
- (BOOL)isSameYearAsDate:(NSDate *)date;

/// Returns a Boolean value indicating if the receiver is this year.
@property (nonatomic, readonly) BOOL isThisYear;

/// Returns a Boolean value indicating if the receiver is next year.
@property (nonatomic, readonly) BOOL isNextYear;

/// Returns a Boolean value indicating if the receiver is last year.
@property (nonatomic, readonly) BOOL isLastYear;


#pragma mark Before and After

/** Returns a Boolean indicating if the receiver comes before the given date.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if the receiver comes before the given date.
 */
- (BOOL)isEarlierThanDate:(NSDate *)date;

/** Returns a Boolean indicating if the receiver comes after the given date.
 *
 * @param date  The date to compare against.
 *
 * @return      A Boolean indicating if the receiver comes after the given date.
 */
- (BOOL)isLaterThanDate:(NSDate *)date;


/// Returns a Boolean value indicating if the receiver is in the future.
@property (nonatomic, readonly) BOOL isInTheFuture;

/// Returns a Boolean value indicating if the receiver is in the past.
@property (nonatomic, readonly) BOOL isInThePast;


#pragma mark - Date Roles

/// Returns a Boolean value indicating if the receiver is during a workday (Monday to Friday).
@property (nonatomic, readonly) BOOL isWorkday;

/// Returns a Boolean value indicating if the receiver is during a weekend (Saturday or Sunday).
@property (nonatomic, readonly) BOOL isWeekend;


#pragma mark - Adjusting Dates

/** Returns a new date the given number of minutes after the receiver.
 *
 * @param minutes   The number of minutes to add.
 *
 * @return          The new date.
 */
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/** Returns a new date the given number of minutes before the receiver.
 *
 * @param minutes   The number of minutes to subtract.
 *
 * @return          The new date.
 */
- (NSDate *)dateBySubtractingMinutes:(NSInteger)minutes;

/** Returns a new date the given number of hours after the receiver.
 *
 * @param hours     The number of hours to add.
 *
 * @return          The new date.
 */
- (NSDate *)dateByAddingHours:(NSInteger)hours;

/** Returns a new date the given number of hours before the receiver.
 *
 * @param hours     The number of hours to subtract.
 *
 * @return          The new date.
 */
- (NSDate *)dateBySubtractingHours:(NSInteger)hours;


/** Returns a new date the given number of days after the receiver.
 *
 * @param days      The number of days to add.
 *
 * @return          The new date.
 */
- (NSDate *)dateByAddingDays:(NSInteger)days;

/** Returns a new date the given number of days before the receiver.
 *
 * @param days      The number of days to subtract.
 *
 * @return          The new date.
 */
- (NSDate *)dateBySubtractingDays:(NSInteger)days;


/// Returns a copy of the receiver at 0:00am the morning of the same day.
@property (nonatomic, readonly) NSDate *dateAtStartOfDay;


#pragma mark - Intervals

/** Returns the number of whole seconds the receiver is after the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole seconds the receiver is after the given date.
 */
- (NSInteger)secondsAfterDate:(NSDate *)date;

/** Returns the number of whole seconds the receiver is before the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole seconds the receiver is before the given date.
 */
- (NSInteger)secondsBeforeDate:(NSDate *)date;


/** Returns the number of whole minutes the receiver is after the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole minutes the receiver is after the given date.
 */
- (NSInteger)minutesAfterDate:(NSDate *)date;

/** Returns the number of whole minutes the receiver is before the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole minutes the receiver is before the given date.
 */
- (NSInteger)minutesBeforeDate:(NSDate *)date;


/** Returns the number of whole hours the receiver is after the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole hours the receiver is after the given date.
 */
- (NSInteger)hoursAfterDate:(NSDate *)date;

/** Returns the number of whole hours the receiver is before the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole hours the receiver is before the given date.
 */
- (NSInteger)hoursBeforeDate:(NSDate *)date;


/** Returns the number of whole days the receiver is after the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole days the receiver is after the given date.
 */
- (NSInteger)daysAfterDate:(NSDate *)date;

/** Returns the number of whole days the receiver is before the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole days the receiver is before the given date.
 */
- (NSInteger)daysBeforeDate:(NSDate *)date;


/** Returns the number of whole years the receiver is after the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole years the receiver is after the given date.
 */
- (NSInteger)yearsAfterDate:(NSDate *)date;

/** Returns the number of whole days the receiver is before the given date.
 *
 * @param date  The date to compare to.
 *
 * @return      The number of whole years the receiver is before the given date.
 */
- (NSInteger)yearsBeforeDate:(NSDate *)date;


#pragma mark - Decomposing Dates

/** Returns requested date components from the receiver.
 *
 * @param unitFlags   The date components to acquire.
 *
 * @return            The date components requested.
 */
- (NSDateComponents *)components:(NSCalendarUnit)unitFlags;

/** Returns all date components from the receiver relating to the duration between the receiver and the given date.
 *
 * @param date  The other date relating to the span. Can be before or after the receiver.
 *
 * @return      All date components relating to the span.
 */
- (NSDateComponents *)componentsSpanningDates:(NSDate *)date;

/** Returns the requested date components relating to the span between the receiver and the given date.
 *
 * @param unitFlags The date components to acquire.
 * @param date      The other date relating to the span. Can be before or after the receiver.
 *
 * @return          The requested date components relating to the span.
 */
- (NSDateComponents *)components:(NSCalendarUnit)unitFlags spanningDates:(NSDate *)date;


/// Returns the date and time components of the receiver.
@property (nonatomic, readonly) NSDateComponents *dateAndTimeComponents;

/// Returns the time related components of the receiver.
@property (nonatomic, readonly) NSDateComponents *timeComponents;


/// Returns an integer representing the nearest hour. (0 to 24)
@property (nonatomic, readonly) NSInteger nearestHour;

/// Returns an integer representing the hour. (0 to 24)
@property (nonatomic, readonly) NSInteger hour;

/// Returns an integer representing the minute of the hour. (0 to 59)
@property (nonatomic, readonly) NSInteger minute;

/// Returns an integer representing the second of the minute. (0 to 59)
@property (nonatomic, readonly) NSInteger second;

/// Returns an integer representing the nanosecond of the second. (0 to 1,000,000,000)
@property (nonatomic, readonly) NSInteger nanosecond;

/// Returns an integer representing the day of the month. (1 to 31)
@property (nonatomic, readonly) NSInteger day;

/// Returns an integer representing the day of the week. (1 to 7 where 1 is Sunday)
@property (nonatomic, readonly) NSInteger weekday;

/// Returns an integer representation of the ordinal occurrence of the weekday represented by the receiver.
@property (nonatomic, readonly) NSInteger nthWeekday;

/// Returns an integer representing the week of the year. (1 to 52)
@property (nonatomic, readonly) NSInteger weekOfYear;

/// Returns an integer representing the month of the year. (1 to 12)
@property (nonatomic, readonly) NSInteger month;

/// Returns an integer representing the year.
@property (nonatomic, readonly) NSInteger year;

@end

NS_ASSUME_NONNULL_END

# CBHDateKit

[![release](https://img.shields.io/github/release/chris-huxtable/CBHDateKit.svg)](https://github.com/chris-huxtable/CBHDateKit/releases)
[![pod](https://img.shields.io/cocoapods/v/CBHDateKit.svg)](https://cocoapods.org/pods/CBHDateKit)
[![licence](https://img.shields.io/badge/licence-ISC-lightgrey.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHDateKit/blob/master/LICENSE)
[![coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHDateKit)

`CBHDateKit` builds on the existing `NSDate` API adding a number of comfort features including relative date creation, numerous common checks, and convenient methods for decomposing dates. Additionally the `NSDateFormatter` API is extended to provide convenient factories as well as some pre-built factories for RFC 822 and RFC 3339.


## `NSDate (CBHDateKit)`

```objective-c

#pragma mark - Shared Calendar

+ (NSCalendar *)sharedCalendar;


#pragma mark - Relative Dates

+ (instancetype)dateTomorrow;
+ (instancetype)dateYesterday;

+ (instancetype)dateWithDaysFromNow:(NSInteger)days;
+ (instancetype)dateWithDaysBeforeNow:(NSInteger)days;
+ (instancetype)dateWithHoursFromNow:(NSInteger)hours;
+ (instancetype)dateWithHoursBeforeNow:(NSInteger)hours;
+ (instancetype)dateWithMinutesFromNow:(NSInteger)minutes;
+ (instancetype)dateWithMinutesBeforeNow:(NSInteger)minutes;


#pragma mark - Comparing Dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;
- (BOOL)isEqualToDateIgnoringNanoSeconds:(NSDate *)date;

- (BOOL)isSameDayAsDate:(NSDate *)date;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;

- (BOOL)isSameWeekAsDate:(NSDate *)date;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;

- (BOOL)isSameMonthAsDate:(NSDate *)date;
- (BOOL)isThisMonth;

- (BOOL)isSameYearAsDate:(NSDate *)date;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;

- (BOOL)isEarlierThanDate:(NSDate *)date;
- (BOOL)isLaterThanDate:(NSDate *)date;

- (BOOL)isInTheFuture;
- (BOOL)isInThePast;


#pragma mark - Date Roles

- (BOOL)isWeekday;
- (BOOL)isWeekend;


#pragma mark - Adjusting Dates

- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateBySubtractingDays:(NSInteger)days;
- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateBySubtractingHours:(NSInteger)hours;
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateBySubtractingMinutes:(NSInteger)minutes;
- (NSDate *)dateAtStartOfDay;


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
```

## `NSDateFormatter (CBHDateKit)`
```objective-c
#pragma mark - Factories

+ (instancetype)formatterWithDateFormat:(NSString *)format;

+ (instancetype)formatterWithTimeStyle:(NSDateFormatterStyle)dateStyle;
+ (instancetype)formatterWithDateStyle:(NSDateFormatterStyle)dateStyle;


#pragma mark - RFC's

+ (instancetype)rfc822;
+ (instancetype)rfc3339;
```


## Prior Work

I believe this project was originally forked from [NSDate-Extensions](https://github.com/erica/NSDate-Extensions) at some point in 2010 but I am not entirely sure of its origin. Since then I have substantially reworked, expanded, and improved the code and I believe they differ enough to be considered separate works. That being said I wanted to give @erica (Erica Sadun) credit as well as anyone else who may have inspired this project.


## Licence
CBHDateKit is available under the [ISC license](https://github.com/chris-huxtable/CBHDateKit/blob/master/LICENSE).

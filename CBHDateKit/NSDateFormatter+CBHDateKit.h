//  NSDateFormatter+CBHDateKit.h
//  CBHDateKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, September 2012.
//  Copyright (c) 2012 Christian Huxtable. All rights reserved.
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

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (CBHDateKit)

#pragma mark - Factories

/** Creates a date formatter that uses a given format.
 *
 * @param format    A format style for the date.
 *
 * @return          The new date formatter.
 *
 * @note            See Data Formatting Guide for a list of the conversion specifiers permitted in date format strings.
 */
+ (instancetype)formatterWithDateFormat:(NSString *)format;


/** Creates a date formatter that uses a given time style.
 *
 * @param style     A style for the time. For possible values, see `NSDateFormatterStyle`.
 *
 * @return          The new date formatter.
 */
+ (instancetype)formatterWithTimeStyle:(NSDateFormatterStyle)style;

/** Creates a date formatter that uses a given date style.
 *
 * @param style     A style for the date. For possible values, see `NSDateFormatterStyle`.
 *
 * @return          The new date formatter.
 */
+ (instancetype)formatterWithDateStyle:(NSDateFormatterStyle)style;


#pragma mark - RFC's

/// Creates a formatter that conforms to the RFC 822 specification.
+ (instancetype)rfc822;

/// Creates a formatter that conforms to the RFC 3339 specification.
+ (instancetype)rfc3339;

@end

NS_ASSUME_NONNULL_END

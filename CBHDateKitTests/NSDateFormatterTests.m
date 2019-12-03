//  NSDateFormatterTests.m
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


@interface NSDateFormatterTests : XCTestCase
@end


@implementation NSDateFormatterTests

- (void)testStyles
{
	NSDateFormatter *timeFormatter = [NSDateFormatter formatterWithTimeStyle:NSDateFormatterShortStyle];
	NSDateFormatter *dateFormatter = [NSDateFormatter formatterWithDateStyle:NSDateFormatterShortStyle];

	NSDate *date = [timeFormatter dateFromString:@"3:30 PM"];
	XCTAssertEqual([date hour], 15, @"Wrong hour.");
	XCTAssertEqual([date minute], 30, @"Wrong minute.");

	date = [dateFormatter dateFromString:@"09/10/11"];
	XCTAssertEqual([date year], 2009, @"Wrong year.");
	XCTAssertEqual([date month], 10, @"Wrong month.");
	XCTAssertEqual([date day], 11, @"Wrong day.");
}

- (void)testRFC822
{
	NSDateFormatter *formatter = [NSDateFormatter rfc822];
	NSDate *date = [formatter dateFromString:@"Fri, 29 Nov 2019 11:27:43 -0500"];

	XCTAssertEqual([date year], 2019, @"Wrong year.");
	XCTAssertEqual([date month], 11, @"Wrong month.");
	XCTAssertEqual([date day], 29, @"Wrong month.");
}

- (void)testRFC3339
{
	NSDateFormatter *formatter = [NSDateFormatter rfc3339];
	NSDate *date = [formatter dateFromString: @"2019-11-29T11:27:43-05:00"];

	XCTAssertEqual([date year], 2019, @"Wrong year.");
	XCTAssertEqual([date month], 11, @"Wrong month.");
	XCTAssertEqual([date day], 29, @"Wrong month.");
}

@end

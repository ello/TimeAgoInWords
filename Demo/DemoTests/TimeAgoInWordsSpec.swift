//
//  TimeAgoInWordsSpec.swift
//  Ello
//
//  Created by Ryan Boyajian on 4/2/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

@testable
import TimeAgoInWords
import XCTest


class TimeAgoInWordsSpec: XCTestCase {
    func testLessThan5Seconds() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: 0).timeAgoInWords(), "<5s")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -4).timeAgoInWords(), "<5s")
    }

    func testLessThan10Seconds() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -5).timeAgoInWords(), "<10s")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -9).timeAgoInWords(), "<10s")
    }

    func testLessThan20Seconds() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -10).timeAgoInWords(), "<20s")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -19).timeAgoInWords(), "<20s")
    }

    func test30Seconds() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -20).timeAgoInWords(), "30s")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -39).timeAgoInWords(), "30s")
    }

    func testLessThan1Minute() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -40).timeAgoInWords(), "<1m")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -59).timeAgoInWords(), "<1m")
    }

    func test1Minute() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -60).timeAgoInWords(), "1m")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -89).timeAgoInWords(), "1m")
    }

    func testCountMinutes() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -90).timeAgoInWords(), "2m")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 45)).timeAgoInWords(), "45m")
    }

    func testAbout1Hour() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 46)).timeAgoInWords(), "~1h")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 90)).timeAgoInWords(), "~1h")
    }

    func testAboutCountHours() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 91)).timeAgoInWords(), "~2h")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 1_440)).timeAgoInWords(), "~24h")
    }

    func test1Day() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 1_441)).timeAgoInWords(), "1d")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 2_520)).timeAgoInWords(), "1d")
    }

    func testCountDays() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 2_521)).timeAgoInWords(), "2d")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 43_200)).timeAgoInWords(), "30d")
    }

    func testAboutCountMonths() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 43_201)).timeAgoInWords(), "~1mth")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 86_400)).timeAgoInWords(), "~2mth")
    }

    func testCountMonths() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 86_401)).timeAgoInWords(), "2mth")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 525_600)).timeAgoInWords(), "12mth")
    }

    func testAboutCountYears() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 525_601)).timeAgoInWords(), "~1y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (525_600 + 131_400 - 1))).timeAgoInWords(), "~1y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * 1_051_200)).timeAgoInWords(), "~2y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (1_051_200 + 131_400 - 1))).timeAgoInWords(), "~2y")
    }

    func testOverCountYears() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (525_600 + 131_400))).timeAgoInWords(), "+1y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (525_600 + 394_200 - 2))).timeAgoInWords(), "+1y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (1_051_200 + 131_400))).timeAgoInWords(), "+2y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (1_051_200 + 394_200 - 1))).timeAgoInWords(), "+2y")
    }

    func testAlmostCountYears() {
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (525_600 + 394_200))).timeAgoInWords(), "<2y")
        XCTAssertEqual(NSDate(timeIntervalSinceNow: -(60 * (1_051_200 - 1))).timeAgoInWords(), "<2y")
    }
}


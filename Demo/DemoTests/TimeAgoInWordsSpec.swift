//
//  TimeAgoInWordsSpec.swift
//  Ello
//
//  Created by Ryan Boyajian on 4/2/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Quick
import Nimble
import TimeAgoInWords

class TimeAgoInWordsSpec: QuickSpec {
    override func spec() {

        describe("-distanceOfTimeInWords:") {

            it("<5s") {
                expect(NSDate(timeIntervalSinceNow: 0).timeAgoInWords()) == "<5s"
                expect(NSDate(timeIntervalSinceNow: -4).timeAgoInWords()) == "<5s"
            }

            it("<10s") {
                expect(NSDate(timeIntervalSinceNow: -5).timeAgoInWords()) == "<10s"
                expect(NSDate(timeIntervalSinceNow: -9).timeAgoInWords()) == "<10s"
            }

            it("<20s") {
                expect(NSDate(timeIntervalSinceNow: -10).timeAgoInWords()) == "<20s"
                expect(NSDate(timeIntervalSinceNow: -19).timeAgoInWords()) == "<20s"
            }

            it("30s") {
                expect(NSDate(timeIntervalSinceNow: -20).timeAgoInWords()) == "30s"
                expect(NSDate(timeIntervalSinceNow: -39).timeAgoInWords()) == "30s"
            }

            it("<1m") {
                expect(NSDate(timeIntervalSinceNow: -40).timeAgoInWords()) == "<1m"
                expect(NSDate(timeIntervalSinceNow: -59).timeAgoInWords()) == "<1m"
            }

            it("1m") {
                expect(NSDate(timeIntervalSinceNow: -60).timeAgoInWords()) == "1m"
                expect(NSDate(timeIntervalSinceNow: -89).timeAgoInWords()) == "1m"
            }

            it("{count}m") {
                expect(NSDate(timeIntervalSinceNow: -90).timeAgoInWords()) == "2m"
                expect(NSDate(timeIntervalSinceNow: -(60 * 45)).timeAgoInWords()) == "45m"
            }

            it("~1h") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 46)).timeAgoInWords()) == "~1h"
                expect(NSDate(timeIntervalSinceNow: -(60 * 90)).timeAgoInWords()) == "~1h"
            }

            it("~{count}h") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 91)).timeAgoInWords()) == "~2h"
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_440)).timeAgoInWords()) == "~24h"
            }

            it("1d") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_441)).timeAgoInWords()) == "1d"
                expect(NSDate(timeIntervalSinceNow: -(60 * 2_520)).timeAgoInWords()) == "1d"
            }

            it("{count}d") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 2_521)).timeAgoInWords()) == "2d"
                expect(NSDate(timeIntervalSinceNow: -(60 * 43_200)).timeAgoInWords()) == "30d"
            }

            it("~{count}mth") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 43_201)).timeAgoInWords()) == "~1mth"
                expect(NSDate(timeIntervalSinceNow: -(60 * 86_400)).timeAgoInWords()) == "~2mth"
            }

            it("{count}mth") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 86_401)).timeAgoInWords()) == "2mth"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600)).timeAgoInWords()) == "12mth"
            }

            it("~{count}y") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_601)).timeAgoInWords()) == "~1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 + 131_400)).timeAgoInWords()) == "~1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_051_201)).timeAgoInWords()) == "~2y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_051_200 + 131_400)).timeAgoInWords()) == "~2y"
            }

            it("+{count}y") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 + 131_400)).timeAgoInWords()) == "+1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 + 394_200 - 1)).timeAgoInWords()) == "+1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_051_200 + 131_400)).timeAgoInWords()) == "+2y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 1_051_200 + 394_200 - 1)).timeAgoInWords()) == "+2y"
            }

            it("<{count}y") {
                expect(NSDate(timeIntervalSinceNow: -(60 * 394_200)).timeAgoInWords()) == "<1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 - 1)).timeAgoInWords()) == "<1y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 + 394_200)).timeAgoInWords()) == "<2y"
                expect(NSDate(timeIntervalSinceNow: -(60 * 525_600 + 525_600 - 1)).timeAgoInWords()) == "<2y"
            }
        }
    }
}


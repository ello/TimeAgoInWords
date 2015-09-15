//
//  TimeAgoInWords.swift
//  Ello
//
//  Created by Ryan Boyajian on 4/2/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public struct TimeAgoInWordsStrings {
    static var LessThan = NSLocalizedString("<", comment:"Indicates a less-than number")
    static var About    = NSLocalizedString("~", comment:"Indicates an approximate number")
    static var Over     = NSLocalizedString("+", comment:"Indicates an exceeding number")
    static var Almost   = NSLocalizedString("<", comment:"Indicates an approaching number")
    static var Seconds  = NSLocalizedString("s", comment:"More than one second in time")
    static var Minute   = NSLocalizedString("m", comment:"One minute in time")
    static var Minutes  = NSLocalizedString("m", comment:"More than one minute in time")
    static var Hour     = NSLocalizedString("h", comment:"One hour in time")
    static var Hours    = NSLocalizedString("h", comment:"More than one hour in time")
    static var Day      = NSLocalizedString("d", comment:"One day in time")
    static var Days     = NSLocalizedString("d", comment:"More than one day in time")
    static var Months   = NSLocalizedString("mth", comment:"More than one month in time")
    static var Years    = NSLocalizedString("y", comment:"More than one year in time")

    static public func updateStrings(dict: [String: String]) {
        for (key, value) in dict {
            switch key.lowercaseString {
            case "lessthan": LessThan = value
            case "about": About = value
            case "over": Over = value
            case "almost": Almost = value
            case "seconds": Seconds = value
            case "minute": Minute = value
            case "minutes": Minutes = value
            case "hour": Hour = value
            case "hours": Hours = value
            case "day": Day = value
            case "days": Days = value
            case "months": Months = value
            case "years": Years = value
            default: print("TimeAgoInWordsStrings.updateStrings key \(key) is not supported.")
            }
        }
    }
}

public extension NSDate {
    func distanceOfTimeInWords(toDate:NSDate) -> String {

        let MINUTES_IN_YEAR = 525_600.0
        let MINUTES_IN_QUARTER_YEAR	= 131_400.0
        let MINUTES_IN_THREE_QUARTERS_YEAR = 394_200.0

        let distanceInSeconds = round(abs(toDate.timeIntervalSinceDate(self)))
        let distanceInMinutes = round(distanceInSeconds / 60.0)

        switch distanceInMinutes {
        case 0...1:
            switch distanceInSeconds {
            case 0...4:
                return TimeAgoInWordsStrings.LessThan + "5" + TimeAgoInWordsStrings.Seconds
            case 5...9:
                return TimeAgoInWordsStrings.LessThan + "10" + TimeAgoInWordsStrings.Seconds
            case 10...19:
                return TimeAgoInWordsStrings.LessThan + "20" + TimeAgoInWordsStrings.Seconds
            case 20...39:
                return "30" + TimeAgoInWordsStrings.Seconds
            case 40...59:
                return TimeAgoInWordsStrings.LessThan + "1" + TimeAgoInWordsStrings.Minute
            default:
                return "1" + TimeAgoInWordsStrings.Minute
            }
        case 2...45:
            return "\(Int(round(distanceInMinutes)))" + TimeAgoInWordsStrings.Minutes
        case 45...90:
            return TimeAgoInWordsStrings.About + "1" + TimeAgoInWordsStrings.Hour
        // 90 mins up to 24 hours
        case 90...1_440:
            return TimeAgoInWordsStrings.About + "\(Int(round(distanceInMinutes / 60.0)))" + TimeAgoInWordsStrings.Hours
        // 24 hours up to 42 hours
        case 1_440...2_520:
            return "1" + TimeAgoInWordsStrings.Day
        // 42 hours up to 30 days
        case 2_520...43_200:
            return "\(Int(round(distanceInMinutes / 1_440.0)))" + TimeAgoInWordsStrings.Days
        // 30 days up to 60 days
        case 43_200...86_400:
            return TimeAgoInWordsStrings.About + "\(Int(round(distanceInMinutes / 43_200.0)))" + TimeAgoInWordsStrings.Months
        // 60 days up to 365 days
        case 86_400...525_600:
            return "\(Int(round(distanceInMinutes / 43_200.0)))" + TimeAgoInWordsStrings.Months
        // TODO: handle leap year like rails does
        default:
            let remainder = distanceInMinutes % MINUTES_IN_YEAR
            let distanceInYears = Int(floor(distanceInMinutes / MINUTES_IN_YEAR))
            if remainder < MINUTES_IN_QUARTER_YEAR {
                return TimeAgoInWordsStrings.About + "\(distanceInYears)" + TimeAgoInWordsStrings.Years
            }
            else if remainder < MINUTES_IN_THREE_QUARTERS_YEAR {
                return TimeAgoInWordsStrings.Over + "\(distanceInYears)" + TimeAgoInWordsStrings.Years
            }
            else {
                return TimeAgoInWordsStrings.Almost + "\(distanceInYears + 1)" + TimeAgoInWordsStrings.Years
            }
        }
    }

    func timeAgoInWords() -> String {
        return self.distanceOfTimeInWords(NSDate())
    }
}

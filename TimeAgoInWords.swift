//
//  TimeAgoInWords.swift
//  Ello
//
//  Created by Ryan Boyajian on 4/2/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import Foundation

public extension NSDate {
    func distanceOfTimeInWords(toDate:NSDate) -> String {

        let LessThan = NSLocalizedString("<", comment:"Indicates a less-than number")
        let About    = NSLocalizedString("~", comment:"Indicates an approximate number")
        let Over     = NSLocalizedString("+", comment:"Indicates an exceeding number")
        let Almost   = NSLocalizedString("<", comment:"Indicates an approaching number")
        let Seconds  = NSLocalizedString("s", comment:"More than one second in time")
        let Minute   = NSLocalizedString("m", comment:"One minute in time")
        let Minutes  = NSLocalizedString("m", comment:"More than one minute in time")
        let Hour     = NSLocalizedString("h", comment:"One hour in time")
        let Hours    = NSLocalizedString("h", comment:"More than one hour in time")
        let Day      = NSLocalizedString("d", comment:"One day in time")
        let Days     = NSLocalizedString("d", comment:"More than one day in time")
        let Months   = NSLocalizedString("mth", comment:"More than one month in time")
        let Years    = NSLocalizedString("y", comment:"More than one year in time")

        let MINUTES_IN_YEAR = 525_600.0
        let MINUTES_IN_QUARTER_YEAR	= 131_400.0
        let MINUTES_IN_THREE_QUARTERS_YEAR = 394_200.0

        let distanceInSeconds = round(abs(toDate.timeIntervalSinceDate(self)))
        let distanceInMinutes = round(distanceInSeconds / 60.0)

        switch distanceInMinutes {
        case 0...1:
            switch distanceInSeconds {
            case 0...4:
                return LessThan + "5" + Seconds
            case 5...9:
                return LessThan + "10" + Seconds
            case 10...19:
                return LessThan + "20" + Seconds
            case 20...39:
                return "30" + Seconds
            case 40...59:
                return LessThan + "1" + Minute
            default:
                return "1" + Minute
            }
        case 2...45:
            return "\(Int(round(distanceInMinutes)))" + Minutes
        case 45...90:
            return About + "1" + Hour
        // 90 mins up to 24 hours
        case 90...1_440:
            return About + "\(Int(round(distanceInMinutes / 60.0)))" + Hours
        // 24 hours up to 42 hours
        case 1_440...2_520:
            return "1" + Day
        // 42 hours up to 30 days
        case 2_520...43_200:
            return "\(Int(round(distanceInMinutes / 1_440.0)))" + Days
        // 30 days up to 60 days
        case 43_200...86_400:
            return About + "\(Int(round(distanceInMinutes / 43_200.0)))" + Months
        // 60 days up to 365 days
        case 86_400...525_600:
            return "\(Int(round(distanceInMinutes / 43_200.0)))" + Months
        // TODO: handle leap year like rails does
        default:
            let remainder = distanceInMinutes % MINUTES_IN_YEAR
            let deltaYears = Int(round(distanceInMinutes / MINUTES_IN_YEAR))
            let distanceInYears = Int(floor(distanceInMinutes / MINUTES_IN_YEAR))
            if remainder < MINUTES_IN_QUARTER_YEAR {
                return About + "\(deltaYears)" + Years
            }
            else if remainder < MINUTES_IN_THREE_QUARTERS_YEAR {
                return Over + "\(deltaYears)" + Years
            }
            else {
                return Almost + "\(deltaYears + 1)" + Years
            }
        }
    }

    func timeAgoInWords() -> String {
        return self.distanceOfTimeInWords(NSDate())
    }
}

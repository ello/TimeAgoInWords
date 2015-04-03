## TimeAgoInWords

[![CI Status](http://img.shields.io/travis/ello/TimeAgoInWords.svg?style=flat)](https://travis-ci.org/ello/TimeAgoInWords)
[![Version](https://img.shields.io/cocoapods/v/TimeAgoInWords.svg?style=flat)](http://cocoapods.org/pods/TimeAgoInWords)
[![License](https://img.shields.io/cocoapods/l/TimeAgoInWords.svg?style=flat)](http://cocoapods.org/pods/TimeAgoInWords)
[![Platform](https://img.shields.io/cocoapods/p/TimeAgoInWords.svg?style=flat)](http://cocoapods.org/pods/TimeAgoInWords)

This is a direct port of: http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-distance_of_time_in_words

### Usage

To override the default strings you can update them before you access them:
```swift
let railsStrings = [
  "LessThan": "less than ",
  "About": "about ",
  "Over": "over ",
  "Almost": "almost ",
  "Seconds": " seconds",
  "Minute": " minute",
  "Minutes": " minutes",
  "Hour": " hour",
  "Hours": " hours",
  "Day": " day",
  "Days": " days",
  "Months": " months",
  "Years": " years",
]
TimeAgoInWordsStrings.updateStrings(railsStrings)
NSDate(timeIntervalSinceNow: -90).timeAgoInWords() // 2 minutes
```

### Installation

TimeAgoInWords is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TimeAgoInWords"
```

### License

TimeAgoInWords is available under the MIT license. See the LICENSE file for more info.

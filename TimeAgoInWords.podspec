#
# Be sure to run `pod lib lint TimeAgoInWords.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "TimeAgoInWords"
  s.version = "0.1.0"
  s.summary = "A port of rails' time_ago_in_words date method."
  s.description = <<-DESC
  This is a direct port of: http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-distance_of_time_in_words
  DESC
  s.homepage = "https://github.com/ello/TimeAgoInWords"
  s.license = { type: "MIT", file: "LICENSE" }
  s.author = { "Ryan Boyajian" => "ryan@ello.co" }
  s.source = { git: "https://github.com/ello/TimeAgoInWords.git", tag: s.version.to_s }

  s.platform = :ios, '8.0'
  s.requires_arc = false

  s.source_files = 'TimeAgoInWords.swift'
  s.frameworks = 'Foundation'
end

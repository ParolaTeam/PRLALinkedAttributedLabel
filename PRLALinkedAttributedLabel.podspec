#
# Be sure to run `pod lib lint PRLALinkedAttributedLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PRLALinkedAttributedLabel"
  s.version          = "0.1.0"
  s.summary          = "A drop-in replacment for UILabel that supports attribution of the string and inter label linking"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC

A drop-in replacment for UILabel that supports attribution of the string and inter label linking. You can add regular strings to the label as well as any other custom object conforming to the PRLANamed/PRLAColored protocols. When displayed , anywhere in your app, a click on the name of an object will generate an event to your delegate with the supplied object that's name was clicked. Similar to web page linking but in your app :)

                       DESC

  s.homepage         = "https://github.com/ParolaTeam/PRLALinkedAttributedLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Saggi" => "saggi@paro.la" }
  s.source           = { :git => "https://github.com/ParolaTeam/PRLALinkedAttributedLabel.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PRLALinkedAttributedLabel' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TTTAttributedLabel', '~> 1.13.4'
end

#
# Be sure to run `pod lib lint ZZBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZBase'
  s.version          = '1.1.0'
  s.summary          = 'Rich extensions to the base classes, point syntax for some UI components.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Rich extensions to various common base classes, point syntax for some UI components.
                       DESC

  s.homepage         = 'https://github.com/CZ410'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CZ410' => '1039776732@qq.com' }
  s.source           = { :git => 'https://github.com/CZ410/ZZBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'
  s.platform     = :ios, "13.0"
  s.ios.deployment_target = '13.0'

#  s.source_files = 'ZZBase/Classes/**/*'
  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'ZZBase' => ['ZZBase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

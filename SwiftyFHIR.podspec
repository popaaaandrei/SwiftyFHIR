#
# Be sure to run `pod lib lint SwiftyFHIR.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyFHIR'
  s.version          = '0.0.4'
  s.summary          = 'FHIR Codable DSTU3 models for Swift 5'
  s.description      = 'FHIR Codable DSTU3 models for Swift 5. All models are taken from the official Swift-FHIR repository. We also added lots of convenience methods for creating FHIR Resources and a Concepts enum.'

  s.homepage         = 'https://github.com/popaaaandrei/SwiftyFHIR'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popaaaandrei' => 'a.popa@cardiologiecentra.nl' }
  s.source           = { :git => 'https://github.com/popaaaandrei/SwiftyFHIR.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5'
  s.source_files = 'SwiftyFHIR/Classes/**/*'

end

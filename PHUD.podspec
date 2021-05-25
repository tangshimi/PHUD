#
# Be sure to run `pod lib lint PHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PHUD'
  s.module_name      = 'PHUD'
  s.version          = '0.3.0'
  s.summary          = 'A short description of PHUD.'

  s.description      = 'PHUD'

  s.homepage         = 'https://github.com/tangshimi/PHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tangshimi' => 'tangshimi@sina.cn' }
  s.source           = { :git => 'https://github.com/tangshimi/PHUD.git', :tag => s.version.to_s }

  s.platform                  = :ios, '8.0'
  s.ios.deployment_target     = '8.0'
  
  s.swift_version             = '5.0'

  s.source_files = 'PHUD/Classes/**/*'
  
  s.resource_bundles = {
     'PHUDResources' => ['PHUD/Assets/*.xcassets']
  }

  s.dependency 'PKHUD'
  s.dependency 'SnapKit'

end

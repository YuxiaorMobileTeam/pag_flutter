#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint pag_darwin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'pag_darwin'
  s.version          = '0.0.2'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  # 源码统一放在 pag_darwin/Sources（与 SPM 的 Package.swift 共用，避免两份代码）。
  s.source_files = 'pag_darwin/Sources/**/*'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  s.resource_bundles = {'pag_darwin_privacy' => ['pag_darwin/Resources/PrivacyInfo.xcprivacy']}
  
  s.ios.deployment_target = '12.0'
  s.ios.dependency 'Flutter'
  s.ios.dependency 'libpag', '~>4.4.26'
end

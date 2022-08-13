#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint hikvision_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'hikvision_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter wrapper on Hikvision SDK.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://www.zensho.co.jp'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Zensho Hanoi System Center' => 'zenshohsc@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.vendored_libraries = 'lib/*.a'
  s.framework = 'AVFoundation', 'OpenAL', 'CoreGraphics', 'OpenGLES', 'QuartzCore', 'AudioToolBox', 'VideoToolBox', "CoreVideo", "CoreMedia", "Foundation", "GLKit", "UIKit"
  s.library = 'iconv', 'bz2'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end

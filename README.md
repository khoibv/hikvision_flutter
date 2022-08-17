# hikvision_flutter

A Flutter wrapper of HIKvision SDK.

## 1. Common

Yêu cầu chung: Tất cả các methods, params gửi/nhận giữa Flutter và native phải sử dụng `pigeon` để generate tự động, config ở file `pigeons/messages.dart`

## 2. iOS

### 2.1. Generate pigeon messages

    flutter pub run pigeon \
        --input ./pigeons/messages.dart \
        --dart_out ./lib/platform_communication.dart \
        --dart_test_out ./test/platform_communication_test.dart \
        --objc_header_out ./ios/Classes/platform_communication.h \
        --objc_source_out ./ios/Classes/platform_communication.mm \
        --java_out ./android/src/main/kotlin/vn/zensho/hikvision/hikvision_flutter/PlatformCommunication.java \
        --java_package "vn.zensho.hikvision.hikvision_flutter"

### 2.2. Notes

- bắt buộc phải sử dụng ObjectiveC++, không thể dùng swift (swift không build được/build lỗi)
- tất cả các file .m (ObjectiveC) đổi tên thành .mm (ObjectiveC++) (chú ý: file 'example/ios/Runner/GeneratedPluginRegistrant.m' cũng cần đổi đuôi)
- tất cả các file header của sdk được copy vào folder project/ios/Classes.
- tất cả các file library được copy vào folder `project/ios/lib`
- tất cả các file library phải được bắt đầu bằng `lib`. vd: `libHCNetSDK.a`, nếu không thì rename.
- file podspec cần thêm các dòng này:

```
    s.vendored_libraries = 'lib/*.a'
    s.framework = 'AVFoundation', 'OpenAL', 'CoreGraphics', 'OpenGLES', 'QuartzCore', 'AudioToolBox', 'VideoToolBox', 'CoreVideo', 'CoreMedia', 'Foundation', 'GLKit', 'UIKit'
    s.library = 'iconv', 'bz2'
```

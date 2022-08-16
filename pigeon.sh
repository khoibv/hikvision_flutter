#!/bin/bash

flutter pub run pigeon \
    --input ./pigeons/messages.dart \
    --dart_out ./lib/platform_communication.dart \
    --dart_test_out ./test/platform_communication_test.dart \
    --objc_header_out ./ios/Classes/platform_communication.h \
    --objc_source_out ./ios/Classes/platform_communication.mm \
    --java_out ./android/src/main/kotlin/vn/zensho/hikvision/hikvision_flutter/PlatformCommunication.java \
    --java_package "vn.zensho.hikvision.hikvision_flutter"

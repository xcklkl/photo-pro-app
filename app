flutter-photo-quick/
├── android/            # 安卓构建目录（Flutter自动生成）
├── ios/                # iOS构建目录（Flutter自动生成）
├── lib/
│   └── main.dart       # 主程序入口
├── pubspec.yaml        # 项目依赖
├── .gitignore
└── README.md
name: flutter_photo_quick
description: A simple Flutter app for taking and selecting photos.
publish_to: 'none' 

version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  image_picker: ^1.0.4

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '拍照 APP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("拍照 APP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile == null
                ? const Text("未选择图片")
                : Image.file(_imageFile!, height: 300),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text("拍照"),
            ),
            ElevatedButton(
              onPressed: _selectFromGallery,
              child: const Text("从相册选择"),
            ),
          ],
        ),
      ),
    );
  }
}
# Flutter/Dart/Pub
.dart_tool/
.packages
.pub/
build/
.flutter-plugins
.flutter-plugins-dependencies

# IDEs
.idea/
.vscode/
# Flutter Photo Quick

一个简单的 Flutter 跨平台拍照应用。

## 功能
- 打开相机拍照
- 从相册选择图片
- 显示拍摄/选择的图片

## 运行
```bash
flutter pub get
flutter run

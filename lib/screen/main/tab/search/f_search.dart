import 'dart:io';

import 'package:fast_app_base/common/widget/constant_widget.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  final scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();
  List<XFile> _pickedImgs = [];

  File? _image;
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        height20,
        RoundButton(
          text: 'image button',
          onTap: () async {
            final file =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (file != null) {
              // 선택 안하면 null이므로 체크
              setState(() {
                _image = File(file.path);
              });
            }
          },
          theme: RoundButtonTheme.blue,
        ),
        height20,
        _buildPhotoArea(),
        height20,
        RoundButton(
            text: 'multi Image',
            onTap: () {
              _pickImg();
            }),
        _imagesBox(),
      ],
    );
  }

  Future<void> _pickImg() async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _pickedImgs = images;
      });
    }
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? Container(
            width: 300,
            height: 300,
            child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: 300,
            height: 300,
            color: Colors.grey,
          );
  }

  Widget _imagesBox() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤
      child: Row(
        children: _pickedImgs!.map((imageFile) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.file(
              File(imageFile.path),
              width: 100, // 이미지 크기 설정
              height: 100, // 이미지 크기 설정
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:get/get.dart';

import '../page/TestPage.dart';
import '../page/TestPage2.dart';

//런타임 객체
var flutterJs = getJavascriptRuntime();

//필수 JS 클래스 정의 및 JS, Dart간 채널 등록
void initJS() async{

  String jsPath = 'assets/document/common.js';
  String jsString = await rootBundle.loadString(jsPath);

  //기본 정의
  flutterJs.evaluate('''
  
class MenuManager{

  constructor() {
  }

  ///화면이동 메서드
  async moveScreen(screenId) {
    console.log("moveScreen called");
    var result = await sendMessage('moveScreen', `{"screenId":"\${screenId}"}`);
    return result;
  }

}

const menuManager = new MenuManager();
  
  ''');


  flutterJs.onMessage("moveScreen", (arg) async {
    if( arg["screenId"] != null){

      print("moveScreen is work");
      String htmlPath = 'assets/document/${arg["screenId"]}.html';

      String htmlString = await rootBundle.loadString(htmlPath);

      Get.to(TestPage2(htmlString: htmlString));

    }
  });
}
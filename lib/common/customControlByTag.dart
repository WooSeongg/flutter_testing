import 'package:flutter/material.dart';
import 'package:flutter_html_v3/custom_render.dart';
import 'package:flutter_testing/util/Utils.dart';

import 'constants.dart';

//정의할 태그//
var customTagList = ["button"];

//선언//
CustomRenderMatcher btnMatcher() =>
    (context) => (context.tree.element?.localName == 'button');

CustomRenderMatcher backgroundImgMatcher() =>
        (context) => (context.tree.element?.localName == 'div' && context.tree.element?.attributes["background-image"] != null);

// background-image


//정의//

//버튼태그 -> 버튼
var btnMatcherWidget = CustomRender.widget(
    widget: (context, buildChildren){

      var style = context.tree.style;
      var element = context.tree.element;

      var backgroundColor = Utils().hexToColor(element?.attributes["background-color"] ?? "0");
      print(backgroundColor);

      var borderRadius = element?.attributes["border-radius"] ?? "0";
      return ElevatedButton(
              onPressed: () {
                print("pressed! in button event");

                flutterJs.evaluate('''

                async function test(){
                  try {
                    console.log("move before");
                    var result = await menuManager.moveScreen("test3");
                    console.log("move after");
                    // var a = await sendMessage('moveScreen', JSON.stringify({"screenId":"test3"}));
                    // console.log(a);
                  }
                  catch (e) {
                    console.error(e);
                  }
                }

                 test();
                  
                ''');


              },
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(TextStyle(
                      fontWeight: style.fontWeight,
                      fontSize: style.fontSize?.value,
                      // color: style.color
                  )),
                  // backgroundColor: MaterialStatePropertyAll(Color()),
                  foregroundColor:MaterialStatePropertyAll(style.color),
                  backgroundColor: MaterialStatePropertyAll(backgroundColor),
                  overlayColor:MaterialStatePropertyAll(style.backgroundColor ?? Colors.transparent),
                  elevation:MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Utils().pxToDouble(borderRadius))
                      )
                  )
              ),
              child: Text(element?.innerHtml.trim() ?? ""));
    });

var backgroundImgMatcherWidget = CustomRender.widget(
      widget: (context, buildChildren){

        var imgSrc = context.tree.element?.attributes["background-image"]!;
        var style = context.tree.style;
        var element = context.tree.element;

        if(imgSrc == null){
          return Container(
            width: style?.width?.value,
            height:style?.height?.value,
            color: Colors.grey,
            child: Text("이미지가 존재하지 않습니다")
          );
        }
        //네트워크 이미지인 경우
        else if(imgSrc.contains("http")){
          return Image.network(
            imgSrc,
            width: style?.width?.value, // 이미지의 너비
            height: style?.height?.value, // 이미지의 높이
            fit: BoxFit.cover, // 이미지의 화면에 맞게 조절
          );
        }
        //로컬 이미지인 경우
        else{
          return Image(
            image:AssetImage(imgSrc ?? ""),
            width:style?.width?.value,
            height:style?.height?.value,
            fit: BoxFit.cover, // 이미지의 화면에 맞게 조절
          );
        }
      }
);

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html_v3/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;


import '../common/constants.dart';
import '../common/customControlByTag.dart';
import '../common/style.dart';


class TestPage extends StatelessWidget{

  Widget html2 = Container();
  String htmlString = '';



  TestPage({required super.key,required String htmlString}){


    flutterJs.onMessage('someChannelName', (dynamic args) {
      print("first line");
      print(args);
      return "return sucess";
    });

    print("start");
    flutterJs.evaluate('''
      console.log(22);
      
      var x = 300;
      var y = 2764;
      
      console.log(x + y);
     
      async function test(){
        
      
        try {
        }
        catch (e) {
          console.error(e);
        }
      }      
      test();
      
    ''');

    // flutterJs.sendMessage(channelName: "ch01", args: ["123",'1']);

    // flutterJs.onMessage('someChannelName', (dynamic args) {
    //   print("under line");
    //   print(args);
    //   return "good return";
    // });

    flutterJs.onMessage("ch01", (args) {
      print("@#@#");

      print(args);
    });


    this.htmlString = htmlString;
    init();
  }

  void init(){

    //태그를 정의할 변수 선언
    // CustomRenderMatcher inputMatcher() => (context) => context.tree.element?.localName == 'input';

    dom.Document document = htmlparser.parse(htmlString);
    html2 = Html.fromDom(
      document: document,
      style: styleVal,
      customRenders: {
        btnMatcher(): btnMatcherWidget,
        backgroundImgMatcher(): backgroundImgMatcherWidget
        // inputMatcher(): CustomRender.widget(widget: (context, buildChildren) => SizedBox(width: context.tree.style.width?.value, height: context.tree.style.height?.value, child: TextField())),
      },
      tagsList: Html.tags..addAll(customTagList), //"input"
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView (
              children:[
                html2
              ]
          )
      )
    );
  }

}
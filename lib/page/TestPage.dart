import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html_v3/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

import '../common/customControlByTag.dart';
import '../common/style.dart';

class TestPage extends StatelessWidget{

  Widget html = Container();
  String htmlString = '';

  TestPage({required String htmlString}){
    this.htmlString = htmlString;
    init();
  }

  void init(){

    //태그를 정의할 변수 선언
    // CustomRenderMatcher inputMatcher() => (context) => context.tree.element?.localName == 'input';

    dom.Document document = htmlparser.parse(htmlString);
    html = Html.fromDom(
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
    print("@#@#@#");
    print("type: ${html.runtimeType}");
    return Scaffold(
      body: Container(
          child: ListView (
            // color:Colors.green,
              children:[
                html
              ]
          )
      )
    );

  }

}
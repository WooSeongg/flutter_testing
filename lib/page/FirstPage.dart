
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'TestPage.dart';

class FirstPage extends StatelessWidget {


  Future<String> getHtmlString() async{

    String htmlPath = 'assets/document/test.html';
    String htmlString = await rootBundle.loadString(htmlPath);

    return htmlString;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 300),
          Center(
            child: ElevatedButton(
                onPressed: () async{

                  var htmlString = await getHtmlString();
                  Get.to(() => TestPage(key:Key("TestPage"),htmlString: htmlString));
                },
                style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(30))),
                child: Text("화면이동")
            ),
          )
        ],
      ),
    );
  }
}
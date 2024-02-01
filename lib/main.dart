import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_testing/page/FirstPage.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // String htmlPath = 'assets/document/flutter.html';
  // String htmlString =  await rootBundle.loadString(htmlPath);

  runApp(MyApp());

}

//모든 곳에서 접근할 수 있도록 함
var flutterJs = getJavascriptRuntime();


class MyApp extends StatelessWidget {


  MyApp({super.key}){

    // flutterJs = getJavascriptRuntime();
    // flutterJs.evaluate('''
    //   var a = 2;
    //   console.log(22);
    //   console.log(33);
    //
    //   var html= ${}
    //
    //   var myElement = document.getElementById("btn_1");
    //   myElement.style.fontSize = "3px";
    //
    //   console.log(44);
    //
    // ''');

    // print(flutterJs.dartContext);
    // print(flutterJs.localContext);
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'FlutterHTML',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            backgroundColor: Colors.yellow,
            body: FirstPage()
        )
    );
    ///////////////////////////////
  }
}
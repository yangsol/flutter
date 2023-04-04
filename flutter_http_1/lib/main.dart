import 'package:flutter/material.dart';
import 'package:flutter_http_1/post/controller/post_table_controller.dart';
import 'package:flutter_http_1/post/view/pages/list_page.dart';
import 'package:flutter_http_1/routes.dart';
import 'package:provider/provider.dart';

void main(){
  // controller는 사용하기 전에 주입을 해줘야 한다
  // 프로젝트가 커지면 하나의 controller로만 사용하기 어렵다
  // 주입을 해주는 ChangeNotifierProvider를 여러개 사용하고 싶다
  // MultiProvider를 사용한다
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => PostTableController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.goRouter,
    );
  }
}

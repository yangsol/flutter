import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_2/post_dto.dart'; // PostDTOTable 클래스를 가져옴
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDTOTable>?>(null); // 상태를 관리하는 Hook

    // useEffect 훅을 사용하여 HTTP GET 요청을 보냄
    useEffect(() {
      String url = "https://jsonplaceholder.typicode.com/users";
      http.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) { // 요청이 성공했을 경우
          dynamic decodedBody = jsonDecode(response.body); // 응답 데이터를 JSON으로 디코딩
          List jsonList = decodedBody as List; // JSON 데이터를 List 타입으로 캐스팅
          // PostDTOTable 객체 리스트를 생성
          listState.value = jsonList.map((data) {
            return PostDTOTable.fromJson(data);
          }).toList();
        }
      });
    });

    return Scaffold(
      body: SafeArea(
          child: ListView(
              children: listState.value?.map((e) => ListItem(postDTOTable: e)).toList()??[] // 리스트 페이지를 나타내는 ListView
          )
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable; // PostDTOTable 객체를 받아들임

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PostDTOTable 객체의 각 속성을 표시하는 위젯 생성
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black87)
      ),
      child: Column(
        children: [
          Text("유저번호 : ${postDTOTable.id}"),
          Divider(),
          Text("이름 : ${postDTOTable.name}"),
          Divider(),
          Text("이메일 : ${postDTOTable.email}")
        ],
      ),
    );
  }
}

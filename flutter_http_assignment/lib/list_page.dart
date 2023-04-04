// list_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_assignment/movie_dto.dart';
import 'package:flutter_http_assignment/movie_repository.dart';

import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<MovieDTOTable>?>(null);
    useEffect(() {
      MovieRepository.instance.getDTOList().then((value){
        listState.value = value;
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(movieDTOTable: e)).toList() ?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  MovieDTOTable movieDTOTable;

  ListItem({Key? key, required this.movieDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Column(
        children: [
          Text("영화랭킹 : ${movieDTOTable.rank}"),
          Divider(),
          Text("영화 관객수 : ${movieDTOTable.audiCnt}"),
          Divider(),
          Text("영화이름 : ${movieDTOTable.movieNm}"),
          Divider(),
          Text("개봉일 : ${movieDTOTable.openDt}"),
        ],
      ),
    );
  }
}

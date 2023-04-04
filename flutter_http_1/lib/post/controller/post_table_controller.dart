import 'package:flutter/foundation.dart';
import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:flutter_http_1/post/model/repository/post_repository.dart';

class PostTableController extends ChangeNotifier {
  List<PostDTOTable>? _postDTOTableList;

  List<PostDTOTable>? get postDTOTableList => _postDTOTableList;

  void setPostDTOTableList(){
    PostRepository.instance.getDTOList().then((value){
      _postDTOTableList = value;
      notifyListeners();
    });
  }

}
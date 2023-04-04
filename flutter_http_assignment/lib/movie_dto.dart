// movie_dto.dart

// 테이블 용
class MovieDTOTable {
  String rank; // 랭킹
  String audiCnt; // 관객수
  String movieNm; // 영화이름
  String openDt; // 개봉일
  // 생성자
  MovieDTOTable({
    required this.rank,
    required this.audiCnt,
    required this.movieNm,
    required this.openDt,
  });

  // 생성자를 이용한 팩토리 함수
  factory MovieDTOTable.fromJson(dynamic json) => MovieDTOTable(
        rank: json["rank"],
        audiCnt: json["audiCnt"],
        movieNm: json["movieNm"],
        openDt: json["openDt"],
      );

  // 팩토리를 이용한 함수
  static List<MovieDTOTable> fromJsonList(List jsonList) {
    return jsonList.map<MovieDTOTable>((json) => MovieDTOTable.fromJson(json)).toList();
  }
}

// 상세 페이지 용
class MovieDTODetail {
  String rank;
  String audiCnt;
  String movieNm;
  String openDt;
  String body;

  MovieDTODetail(
      {required this.rank,
      required this.audiCnt,
      required this.movieNm,
        required this.openDt,
      required this.body,}); // 내용
}

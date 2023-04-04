class PostDTOTable{
  int id;
  String name;
  String email;

  PostDTOTable({required this.id,
                required this.name,
                required this.email});

  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
      id: json["id"],
      name: json["name"],
      email: json["email"]);

}
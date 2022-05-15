class GithubRepo {
  GithubRepo({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;

  factory GithubRepo.fromJson(Map<String, dynamic> json) => GithubRepo(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "private": private,
      };
}

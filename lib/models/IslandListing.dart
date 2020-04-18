class IslandListing {
  int id;
  String islandName;
  String playerName;
  String dodoCode;
  String description;
  int playerCount;
  String createdAt;
  String updatedAt;
  int userId;

  IslandListing(
      {this.id,
      this.islandName,
      this.playerName,
      this.dodoCode,
      this.description,
      this.playerCount,
      this.createdAt,
      this.updatedAt,
      this.userId});

  IslandListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    islandName = json['island_name'];
    playerName = json['player_name'];
    dodoCode = json['dodo_code'];
    description = json['description'];
    playerCount = json['player_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['island_name'] = this.islandName;
    data['player_name'] = this.playerName;
    data['dodo_code'] = this.dodoCode;
    data['description'] = this.description;
    data['player_count'] = this.playerCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
class MarkAsComplete {
  String? contentID;
  int? contentProgressPercentage;

  MarkAsComplete({this.contentID, this.contentProgressPercentage});

  MarkAsComplete.fromJson(Map<String, dynamic> json) {
    contentID = json['contentID'];
    contentProgressPercentage = json['contentProgressPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentID'] = this.contentID;
    data['contentProgressPercentage'] = this.contentProgressPercentage;
    return data;
  }
}

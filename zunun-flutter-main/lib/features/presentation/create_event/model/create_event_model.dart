class CreateEventModel {
  String? title;
  String? description;
  String? place;
  String? type;
  bool? isRecurring;
  String? recurType;
  int? duration;
  String? startDate;
  String? endDate;
  String? status;

  CreateEventModel(
      {this.title,
      this.description,
      this.place,
      this.type,
      this.isRecurring,
      this.recurType,
      this.duration,
      this.startDate,
      this.endDate,
      this.status});

  CreateEventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    place = json['place'];
    type = json['type'];
    isRecurring = json['isRecurring'];
    recurType = json['recurType'];
    duration = json['duration'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['place'] = this.place;
    data['type'] = this.type;
    data['isRecurring'] = this.isRecurring;
    data['recurType'] = this.recurType;
    data['duration'] = this.duration;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    return data;
  }
}

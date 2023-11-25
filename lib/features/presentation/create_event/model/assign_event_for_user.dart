class EventAssignForUser {
  Data? data;
  bool? success;

  EventAssignForUser({this.data, this.success});

  EventAssignForUser.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<Date>? date;

  Data({this.date});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Date {
  String? id;
  String? title;
  String? description;
  String? createdBy;
  String? startDate;
  String? endDate;
  String? type;
  String? status;
  String? place;

  Date(
      {this.id,
      this.title,
      this.description,
      this.createdBy,
      this.startDate,
      this.endDate,
      this.type,
      this.status,
      this.place});

  Date.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    type = json['type'];
    status = json['status'];
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['type'] = this.type;
    data['status'] = this.status;
    data['place'] = this.place;
    return data;
  }
}

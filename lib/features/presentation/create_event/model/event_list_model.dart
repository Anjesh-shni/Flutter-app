class EventList {
  List<Data>? data;
  bool? success;

  EventList({this.data, this.success});

  EventList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  String? createdBy;
  String? startDate;
  String? endDate;
  String? type;
  String? status;
  String? place;

  Data(
      {this.id,
      this.title,
      this.description,
      this.createdBy,
      this.startDate,
      this.endDate,
      this.type,
      this.status,
      this.place});

  Data.fromJson(Map<String, dynamic> json) {
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

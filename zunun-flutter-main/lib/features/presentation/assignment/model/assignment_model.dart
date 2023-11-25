class AssignmentModel2 {
  List<AssignmentM>? data;
  bool? success;

  AssignmentModel2({this.data, this.success});

  AssignmentModel2.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AssignmentM>[];
      json['data'].forEach((v) {
        data!.add(new AssignmentM.fromJson(v));
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

class AssignmentM {
  String? id;
  String? title;
  String? openDate;
  String? dueDate;
  String? submissionStatus;

  AssignmentM({
    this.id,
    this.title,
    this.openDate,
    this.dueDate,
    this.submissionStatus,
  });

  AssignmentM.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    title = json['title'] ?? "";
    openDate = json['openDate'] ?? "";
    dueDate = json['dueDate'] ?? "";
    submissionStatus = json['submissionStatus'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['openDate'] = this.openDate;
    data['dueDate'] = this.dueDate;
    data['submissionStatus'] = this.submissionStatus;

    return data;
  }
}

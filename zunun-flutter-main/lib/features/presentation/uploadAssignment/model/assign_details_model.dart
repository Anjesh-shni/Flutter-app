class AssignmentDetails {
  Data? data;
  bool? success;

  AssignmentDetails({this.data, this.success});

  AssignmentDetails.fromJson(Map<String, dynamic> json) {
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
  String? id;
  Assignment? assignment;
  String? submissionText;
  String? submissionStatus;
  String? gradingStatus;
  Student? student;
  List<Comments>? comments;
  String? updatedAt;
  Feedback? feedback;

  Data(
      {this.id,
      this.assignment,
      this.submissionText,
      this.submissionStatus,
      this.gradingStatus,
      this.student,
      this.comments,
      this.updatedAt,
      this.feedback});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignment = json['assignment'] != null
        ? new Assignment.fromJson(json['assignment'])
        : null;
    submissionText = json['submissionText'];
    submissionStatus = json['submissionStatus'];
    gradingStatus = json['gradingStatus'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    feedback = json['feedback'] != null
        ? new Feedback.fromJson(json['feedback'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.assignment != null) {
      data['assignment'] = this.assignment!.toJson();
    }
    data['submissionText'] = this.submissionText;
    data['submissionStatus'] = this.submissionStatus;
    data['gradingStatus'] = this.gradingStatus;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    if (this.feedback != null) {
      data['feedback'] = this.feedback!.toJson();
    }
    return data;
  }
}

class Assignment {
  String? id;
  String? title;
  String? description;
  String? openDate;
  String? dueDate;
  String? createdBy;

  Assignment(
      {this.id,
      this.title,
      this.description,
      this.openDate,
      this.dueDate,
      this.createdBy});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    openDate = json['openDate'];
    dueDate = json['dueDate'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['openDate'] = this.openDate;
    data['dueDate'] = this.dueDate;
    data['createdBy'] = this.createdBy;
    return data;
  }
}

class Student {
  String? name;

  Student({this.name});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Comments {
  String? createdAt;
  String? comment;
  User? user;

  Comments({this.createdAt, this.comment, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    comment = json['comment'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['comment'] = this.comment;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  int? role;

  User({this.name, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}

class Feedback {
  int? gradePoint;
  String? gradedOn;
  Student? gradedBy;
  String? feedback;

  Feedback({this.gradePoint, this.gradedOn, this.gradedBy, this.feedback});

  Feedback.fromJson(Map<String, dynamic> json) {
    gradePoint = json['gradePoint'];
    gradedOn = json['gradedOn'];
    gradedBy = json['gradedBy'] != null
        ? new Student.fromJson(json['gradedBy'])
        : null;
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gradePoint'] = this.gradePoint;
    data['gradedOn'] = this.gradedOn;
    if (this.gradedBy != null) {
      data['gradedBy'] = this.gradedBy!.toJson();
    }
    data['feedback'] = this.feedback;
    return data;
  }
}

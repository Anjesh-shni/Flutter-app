class StudentCourseDetails {
  Data? data;
  bool? success;

  StudentCourseDetails({this.data, this.success});

  StudentCourseDetails.fromJson(Map<String, dynamic> json) {
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
  List<Lesson>? lesson;

  Data({this.lesson});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['lesson'] != null) {
      lesson = <Lesson>[];
      json['lesson'].forEach((v) {
        lesson!.add(new Lesson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lesson != null) {
      data['lesson'] = this.lesson!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesson {
  String? id;
  String? name;
  List<Content>? content;

  Lesson({this.id, this.name, this.content});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? id;
  String? name;
  String? contentType;

  Content({this.id, this.name, this.contentType});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contentType'] = this.contentType;
    return data;
  }
}

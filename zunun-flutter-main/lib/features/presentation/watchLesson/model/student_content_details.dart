// class StudentContentDetails {
//   Data? data;
//   bool? success;

//   StudentContentDetails({this.data, this.success});

//   StudentContentDetails.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class Data {
//   String? id;
//   String? title;
//   String? description;
//   String? instruction;
//   String? contentType;
//   String? abilityCategory;
//   List<String>? keywords;
//   int? supplyContentType;

//   Data(
//       {this.id,
//       this.title,
//       this.description,
//       this.instruction,
//       this.contentType,
//       this.abilityCategory,
//       this.keywords,
//       this.supplyContentType});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     instruction = json['instruction'];
//     contentType = json['contentType'];
//     abilityCategory = json['abilityCategory'];
//     keywords = json['keywords'].cast<String>();
//     supplyContentType = json['supplyContentType'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['instruction'] = this.instruction;
//     data['contentType'] = this.contentType;
//     data['abilityCategory'] = this.abilityCategory;
//     data['keywords'] = this.keywords;
//     data['supplyContentType'] = this.supplyContentType;
//     return data;
//   }
// }


class StudentContentDetails {
  Data? data;
  bool? success;

  StudentContentDetails({this.data, this.success});

  StudentContentDetails.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? instruction;
  String? contentType;
  String? abilityCategory;
  List<String>? keywords;
  int? supplyContentType;
  bool? hasCompleted;
  File? file;

  Data(
      {this.id,
      this.title,
      this.description,
      this.instruction,
      this.contentType,
      this.abilityCategory,
      this.keywords,
      this.supplyContentType,
      this.hasCompleted,
      this.file});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    instruction = json['instruction'];
    contentType = json['contentType'];
    abilityCategory = json['abilityCategory'];
    keywords = json['keywords'].cast<String>();
    supplyContentType = json['supplyContentType'];
    hasCompleted = json['hasCompleted'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['instruction'] = this.instruction;
    data['contentType'] = this.contentType;
    data['abilityCategory'] = this.abilityCategory;
    data['keywords'] = this.keywords;
    data['supplyContentType'] = this.supplyContentType;
    data['hasCompleted'] = this.hasCompleted;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class File {
  String? id;
  String? fileType;
  String? fileName;
  String? url;

  File({this.id, this.fileType, this.fileName, this.url});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileType = json['fileType'];
    fileName = json['fileName'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileType'] = this.fileType;
    data['fileName'] = this.fileName;
    data['url'] = this.url;
    return data;
  }
}

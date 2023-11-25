class UploadAssignment {
  String? submissionText;
  List<AssignmentFiles>? assignmentFiles;

  UploadAssignment({this.submissionText, this.assignmentFiles});

  UploadAssignment.fromJson(Map<String, dynamic> json) {
    submissionText = json['submissionText'];
    if (json['assignmentFiles'] != null) {
      assignmentFiles = <AssignmentFiles>[];
      json['assignmentFiles'].forEach((v) {
        assignmentFiles!.add(new AssignmentFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submissionText'] = this.submissionText;
    if (this.assignmentFiles != null) {
      data['assignmentFiles'] =
          this.assignmentFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignmentFiles {
  String? fileName;
  String? fileType;
  String? id;
  String? url;

  AssignmentFiles({this.fileName, this.fileType, this.id, this.url});

  AssignmentFiles.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileType = json['fileType'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['fileType'] = this.fileType;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

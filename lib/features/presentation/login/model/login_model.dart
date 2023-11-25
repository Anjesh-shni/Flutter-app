class LoginModel {
  Data? data;
  bool? success;

  LoginModel({this.data, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? refresh;
  String? access;
  User? user;

  Data({this.refresh, this.access, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? surname;
  String? email;
  String? username;
  String? homePhone;
  String? cellular;
  String? gender;
  String? dob;
  String? birthplace;
  Role? role;
  List<Permissions>? permissions;

  User(
      {this.id,
      this.firstName,
      this.surname,
      this.email,
      this.username,
      this.homePhone,
      this.cellular,
      this.gender,
      this.dob,
      this.birthplace,
      this.role,
      this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    surname = json['surname'];
    email = json['email'];
    username = json['username'];
    homePhone = json['homePhone'];
    cellular = json['cellular'];
    gender = json['gender'];
    dob = json['dob'];
    birthplace = json['birthplace'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add( Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['homePhone'] = this.homePhone;
    data['cellular'] = this.cellular;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['birthplace'] = this.birthplace;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }



}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Permissions {
  int? id;
  String? name;
  String? description;
  Url? url;

  Permissions({this.id, this.name, this.description, this.url});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'] != null ?  Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.url != null) {
      data['url'] = this.url!.toJson();
    }
    return data;
  }
}

class Url {
  int? id;
  String? path;

  Url({this.id, this.path});

  Url.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}
Map<String, dynamic> loginModelToMap(LoginModel loginModel) {
  return loginModel.toJson();
}

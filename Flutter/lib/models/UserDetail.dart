import 'dart:convert';

class UserDetail {
  final int? userId, roleId;
  final String userName, firstName, lastName, phoneNo, email;
  final DateTime dateOfBirth;

  UserDetail(
      {this.userId,
      this.roleId,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.phoneNo,
      required this.email});

  static UserDetail fromJson(var data) {
    return UserDetail(
        userId: data['CustomerId'],
        roleId: data['RoleId'],
        userName: data['Username'],
        firstName: data['FirstName'],
        lastName: data['LastName'],
        dateOfBirth: DateTime.parse(data['DateOfBirth']),
        phoneNo: data['ContactNo'],
        email: data['Email']);
  }

  Map<String, dynamic> toMap() {
    return {
      'Username': userName,
      'FirstName': firstName,
      'LastName': lastName,
      'DateOfBirth': dateOfBirth.toString(),
      'ContactNo': phoneNo,
      'Email': email,
    };
  }

  String toJson([UserDetail? data]) {
    if (data != null) {
      return _toJson(data);
    }

    return jsonEncode(this);
  }

  static String _toJson(UserDetail userDetail) {
    return jsonEncode({
      'Username': userDetail.userName,
      'FirstName': userDetail.firstName,
      'LastName': userDetail.lastName,
      'DateOfBirth': userDetail.dateOfBirth,
      'ContactNo': userDetail.phoneNo,
      'Email': userDetail.email,
    });
  }

  @override
  String toString() {
    return {
      'Username': userName,
      'FirstName': firstName,
      'LastName': lastName,
      'DateOfBirth': dateOfBirth,
      'ContactNo': phoneNo,
      'Email': email,
    }.toString();
  }
}

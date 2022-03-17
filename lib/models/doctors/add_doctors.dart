class AddDoctor {
  String? message;
  String? status;
  Data? data;
  AddDoctor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Fdata? empRegister;
  Data.fromJson(Map<String, dynamic> json) {
    empRegister = json['empRegister'] != null
        ? Fdata.fromJson(json['empRegister'])
        : null;
  }
}

class Fdata {
  String? nameAr;
  String? nameEn;
  int? branchId;
  int? empNo;
  String? job;
  String? note;
  int? companyId;
  String? birthDate;
  String? email;
  String? address;
  String? gender;
  String? phoneNumber;
  String? phoneNumberSecond;
  String? socialStatus;
  String? numberIdentification;
  String? datePermanent;
  String? dateExp;
  String? dateAppointment;
  String? typeIdentification;
  String? exprience;
  String? specialiation;
  String? cerficationDate;
  dynamic sallery;
  int? remeningDay;
  String? statusProccess;
  String? nationalityTitel;
  int? nationalityId;
  String? scientificDisciplinesTitel;
  int? scientificDisciplinesId;
  String? userName;
  String? password;
  String? confirmPassword;
  int? role;
  Fdata.fromJson(Map<String, dynamic> json) {
    exprience = json['exprience'];
    cerficationDate = json['cerficationDate'];
    specialiation = json['specialiation'];
    sallery = json['sallery'];
    remeningDay = json['remeningDay'];
    statusProccess = json['statusProccess'];
    nationalityTitel = json['nationalityTitel'];
    statusProccess = json['statusProccess'];
    nationalityId = json['nationalityId'];
    nationalityTitel = json['nationalityTitel'];
    scientificDisciplinesId = json['scientificDisciplinesId'];
    scientificDisciplinesTitel = json['scientificDisciplinesTitel'];
    role = json['role'];
    confirmPassword = json['confirmPassword'];
    password = json['password'];
    userName = json['userName'];
  }
}
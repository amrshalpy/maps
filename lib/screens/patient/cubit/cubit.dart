import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/constants/admin_const.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/models/admin/admin_model.dart';
import 'package:hms/models/branch/get_branch.dart';
import 'package:hms/models/branch/widgets/create_branches.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:hms/share/network/dio_helper.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitailState());
  static PatientCubit get(context) => BlocProvider.of(context);
  Map<int, bool> isLiked = {};
  void changeIsLiked(int index) {
    isLiked[index] = !(isLiked[index] ?? false);
    emit(ChangeLiked());
  }

  AdminModel? adminModel;

  void loginAdminData(String email, password) {
    emit(LoginAdminDataLoading());
    try {
      DioHelper.postData(
        data: {
          'UserName': email,
          'Password': password,
        },
        path: kLogin,
      ).then((value) {
        adminModel = AdminModel.fromJson(value.data);
        print(adminModel!.data!.username);
        emit(LoginAdminDataSucsses(adminModel!.data!.token));
      }).catchError((er) {
        emit(LoginAdminDataError());

        print(er.toString());
      });
    } catch (er) {
      print(er.toString());
    }
  }

  GetBranches? getBranchModel;
  void getBranches() {
    emit(GetBranchesLoading());

    DioHelper.getData(
            token: uid!,
            path: 'https://192.168.1.100:49/api/Branch/Get?pageId= 1')
        .then((value) {
      getBranchModel = GetBranches.fromJson(value.data);
      emit(GetBranchesSucsses());
    }).catchError((er) {
      print(er.toString());
    });
  }

  void updateBranch({int? id}) {
    emit(UpdateBranchesLoading());

    DioHelper.patchData(
      path: kUpdateBranch,
      data: {
        'id': id,
      },
      token: uid!,
    ).then((value) {
      emit(UpdateBranchesSucsses());

      getBranches();
    }).catchError((er) {
      print(er.toString());
    });
  }

  void deleteBranch({id}) {
    emit(DeleteBranchesLoading());

    DioHelper.deleteData(
      path: kdeleteBranch,
      data: {'id': id},
    ).then((value) {
      emit(DeleteBranchesSucsses());

      getBranches();
    }).catchError((er) {
      emit(DeleteBranchesError());

      print(er.toString());
    });
  }

  CreateBranche? createBranchModel;
  void createBranch({
    String? nameAr,
    String? nameEn,
    int? branchId,
    int? companyId,
    String? note,
    String? address,
    String? mangerMobile,
    String? mangerName,
    String? taxNumber,
    String? commercialNumber,
  }) {
    emit(CreateBranchesLoading());
    try {
      DioHelper.postData(
        token: uid!,
        data: {
          'NameAr': nameAr,
          'NameEn': nameEn,
          'BranchId': branchId,
          'CompanyId': companyId,
          'Note': note,
          'Address': address,
          'MangerMobile': mangerMobile,
          'MangerName': mangerName,
          'TaxNumber': taxNumber,
          'CommercialNumber': commercialNumber,
        },
        path: kCreateBranch,
      ).then((value) {
        createBranchModel = CreateBranche.fromJson(value.data);
        emit(CreateBranchesSucsses());
      }).catchError((er) {
        emit(CreateBranchesError());

        print(er.toString());
      });
    } catch (er) {
      print(er.toString());
    }
  }

  void getBranchesDetails() {
    emit(GetBranchsDetailsLoading());
    DioHelper.getData(path: kGetDetailsBranch, token: uid).then((value) {
      emit(GetBranchsDetailsSucsses());
    }).catchError((er) {
      print(er);
      emit(GetBranchsDetailsError());
    });
  }
}

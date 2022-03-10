abstract class PatientState {}

class PatientInitailState extends PatientState {}

class ChangeLiked extends PatientState {}

class IncreasePage extends PatientState {}

class DecreasePage extends PatientState {}

class LoginAdminDataLoading extends PatientState {}

class LoginAdminDataSucsses extends PatientState {
  String? token;
  LoginAdminDataSucsses(this.token);
}

class LoginAdminDataError extends PatientState {}

class GetBranchesLoading extends PatientState {}

class GetBranchesSucsses extends PatientState {}

class GetBranchesError extends PatientState {}

class GetBranchsDetailsLoading extends PatientState {}

class GetBranchsDetailsSucsses extends PatientState {}

class GetBranchsDetailsError extends PatientState {}

class CreateBranchesLoading extends PatientState {}

class CreateBranchesSucsses extends PatientState {}

class CreateBranchesError extends PatientState {}

class UpdateBranchesLoading extends PatientState {}

class UpdateBranchesSucsses extends PatientState {}

class UpdateBranchesError extends PatientState {}

class DeleteBranchesLoading extends PatientState {}

class DeleteBranchesSucsses extends PatientState {}

class DeleteBranchesError extends PatientState {}

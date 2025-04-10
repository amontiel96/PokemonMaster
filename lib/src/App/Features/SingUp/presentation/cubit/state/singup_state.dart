part of '../singup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}
class SignupRedirectRegisterScreen extends SignupState {}
class SignupLayoutAuthScreenStart extends SignupState {}
class SignupOnBackSignup extends SignupState {}
class SignupShowState extends SignupState {}

class SignupLoaded extends SignupState {

}

class SignupError extends SignupState {
}

class SignupStep1 extends SignupState {}
class SignupdataContactSelectGender extends SignupState {}
class SignupdataContactSelectAccountType extends SignupState {}
class SignupDContactPhoneValidation extends SignupState {}
class SignupStep4Validation extends SignupState {}
class SignupStep5Validation extends SignupState {}
class SignupStep3Validation extends SignupState {}
class SignupStep5DBInit extends SignupState {}
class SignupStep5DBFinish extends SignupState {
  final bool result;
  SignupStep5DBFinish(this.result);
}

class SignupStepCompleteSelectOption extends SignupState {
  final int option;
  SignupStepCompleteSelectOption(this.option);
}

class SignupStepCompleteImageSaved extends SignupState {}
class SignupStepAvatarImagesLoading extends SignupState {}
class SignupStepAvatarImageSelected extends SignupState {}
class SignupStepAvatarImageSelectedConfirm extends SignupState {}
class SignupStep3UpdateLocation extends SignupState {}
class SignupStep3ConfirmLocation extends SignupState {}
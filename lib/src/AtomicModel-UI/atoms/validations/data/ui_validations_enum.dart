part of 'package:poke_app/src/AtomicModel-UI/atoms/validations/ui_validations.dart';

enum UIValidation {
  confirmation,
  error,
  vDefault,
  invalid,
  valid,
  activation,
  sms, 
  process
}

extension UIValidationType on UIValidation {
  String get type {
    switch (this) {
      case UIValidation.confirmation:
        return TDSMAssets.validations.confirmation;
      case UIValidation.error:
        return TDSMAssets.validations.error;
      case UIValidation.vDefault:
        return TDSMAssets.validations.vDefault;
      case UIValidation.invalid:
        return TDSMAssets.validations.invalid;
      case UIValidation.valid:
        return TDSMAssets.validations.valid;
      case UIValidation.activation:
        return TDSMAssets.validations.activation;
      case UIValidation.sms:
        return TDSMAssets.validations.sms;
      case UIValidation.process:
        return TDSMAssets.validations.process;
      default:
        return '';
    }
  }
}

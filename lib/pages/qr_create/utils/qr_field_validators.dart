import 'package:form_field_validator/form_field_validator.dart';

class QrFieldValidtors {
  static final requiredValidator = RequiredValidator(errorText: 'Field is required');

  static MaxLengthValidator maxLengthValidator(len, {fieldName = 'Field'}) {
    return MaxLengthValidator(len, errorText: '$fieldName needs to be under $len characters');
  }

  static MinLengthValidator minLengthValidator(len, {fieldName = 'Field'}) {
    return MinLengthValidator(len, errorText: '$fieldName needs to be at least $len characters long');
  }
}

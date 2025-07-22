import 'package:formz/formz.dart';

enum TitleValidationError { empty, tooShort }

class TitleInput extends FormzInput<String, TitleValidationError> {
  const TitleInput.pure() : super.pure('');
  const TitleInput.dirty([super.value = '']) : super.dirty();

  @override
  TitleValidationError? validator(String value) {
    if (value.isEmpty) return TitleValidationError.empty;
    if (value.length < 3) return TitleValidationError.tooShort;
    return null;
  }
}

enum DescriptionValidationError { empty }

class DescriptionInput extends FormzInput<String, DescriptionValidationError> {
  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty([super.value = '']) : super.dirty();

  @override
  DescriptionValidationError? validator(String value) {
    if (value.isEmpty) return DescriptionValidationError.empty;
    return null;
  }
}

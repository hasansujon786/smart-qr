import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputEmail extends StatelessWidget {
  const QrInputEmail({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Email *',
          hintText: 'Enter email here',
          onSaved: (val) {
            updateFormData('email', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            EmailValidator(errorText: 'Not a valid Email'),
          ]),
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Subject',
          hintText: 'Enter subject here',
          onSaved: (val) {
            updateFormData('subject', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.maxLengthValidator(100, fieldName: 'Subject'),
          ]),
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Your Message',
          isLastField: true,
          hintText: 'Enter message here',
          onSaved: (val) {
            updateFormData('message', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.maxLengthValidator(300, fieldName: 'Message'),
          ]),
        )
      ],
    );
  }
}

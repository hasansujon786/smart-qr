import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputSms extends StatelessWidget {
  const QrInputSms({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Phone number *',
          hintText: 'Enter number here',
          onSaved: (val) {
            updateFormData('phoneNumber', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.maxLengthValidator(100),
          ]),
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Your Message',
          hintText: 'Enter message here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('message', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.maxLengthValidator(200, fieldName: 'Message'),
          ]),
        ),
      ],
    );
  }
}

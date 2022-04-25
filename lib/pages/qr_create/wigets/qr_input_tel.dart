import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputTel extends StatelessWidget {
  final Function updateFormData;

  const QrInputTel({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Your phone number *',
          hintText: 'Enter number here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('tel', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.maxLengthValidator(100, fieldName: 'Subject'),
          ]),
        ),
      ],
    );
  }
}

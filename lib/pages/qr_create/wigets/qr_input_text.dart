import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputText extends StatelessWidget {
  final Function updateFormData;

  const QrInputText({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Enter text *',
          hintText: 'Enter text here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('text', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.maxLengthValidator(500, fieldName: 'Text'),
          ]),
        ),
      ],
    );
  }
}

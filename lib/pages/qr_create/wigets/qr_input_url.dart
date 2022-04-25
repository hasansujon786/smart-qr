import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputUrl extends StatelessWidget {
  final Function updateFormData;

  const QrInputUrl({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Enter website URL *',
          hintText: 'https://',
          initialValue: 'https://',
          isLastField: true,
          onSaved: (val) {
            updateFormData('url', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.maxLengthValidator(500, fieldName: 'Url'),
          ]),
        ),
      ],
    );
  }
}

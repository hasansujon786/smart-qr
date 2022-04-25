import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';

class QrInputLocation extends StatelessWidget {
  final Function updateFormData;

  const QrInputLocation({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'Latitude *',
          hintText: 'Enter latitude here',
          onSaved: (val) {
            updateFormData('lat', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.requiredDoubleValidator(fieldName: 'Latitude'),
            QrFieldValidtors.maxLengthValidator(500, fieldName: 'latitude'),
          ]),
        ),
        const SizedBox(height: 8),
        QrFormField(
          label: 'Longitude *',
          hintText: 'Enter longitude here',
          isLastField: true,
          onSaved: (val) {
            updateFormData('long', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.requiredDoubleValidator(fieldName: 'Longitude'),
            QrFieldValidtors.maxLengthValidator(500, fieldName: 'longitude'),
          ]),
        ),
      ],
    );
  }
}

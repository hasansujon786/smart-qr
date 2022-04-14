import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import './wigets.dart';
import '../../../ui/ui.dart';

class QrInputWifi extends StatefulWidget {
  const QrInputWifi({
    Key? key,
    required this.updateFormData,
  }) : super(key: key);

  final Function updateFormData;

  @override
  State<QrInputWifi> createState() => _QrInputWifiState();
}

class _QrInputWifiState extends State<QrInputWifi> {
  final _wifiEncryptionTypes = ['WPA', 'WEP', 'OPEN'];
  int _selectedEncryptionIndex = 0;

  void onOptionTap(updatedIndex) {
    setState(() {
      _selectedEncryptionIndex = updatedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrFormField(
          label: 'SSID *',
          hintText: 'Enter wifi name here',
          onSaved: (val) {
            widget.updateFormData('ssid', val);
          },
          validator: MultiValidator([
            QrFieldValidtors.requiredValidator,
            QrFieldValidtors.maxLengthValidator(200, fieldName: 'SSID'),
          ]),
        ),
        const SizedBox(height: 8),
        QrFormField(
          isLastField: true,
          label: 'Password',
          hintText: 'Enter password here',
          onSaved: (val) {
            widget.updateFormData('pass', val);
            widget.updateFormData('type', _wifiEncryptionTypes[_selectedEncryptionIndex]);
          },
          validator: MultiValidator([
            QrFieldValidtors.maxLengthValidator(200, fieldName: 'Password'),
          ]),
        ),
        const SizedBox(height: 24),
        OptionSelector(
          selectedOptionIndex: _selectedEncryptionIndex,
          options: _wifiEncryptionTypes,
          onTap: onOptionTap,
        ),
      ],
    );
  }
}

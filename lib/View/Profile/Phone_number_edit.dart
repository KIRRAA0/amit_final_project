import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../API/phone_number_update_API.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/inter_text_style.dart';

class PhoneEdit extends StatefulWidget {
  const PhoneEdit({super.key});

  @override
  State<PhoneEdit> createState() => _PhoneEditState();
}

class _PhoneEditState extends State<PhoneEdit> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final phone = GetStorage().read('user_phone');
    if (phone != null) {
      controller.text = phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onPressed: () async {
          final enteredPhone = controller.text;
          GetStorage().write('user_phone', enteredPhone);
          updatePhoneNumber(enteredPhone);
        },
        text: 'Save',
        isButtonEnabled: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterTextStyle.getTextWidget(
              text: 'Main Email Address',
              size: 13,
              opacity: 0.6,
            ),
            const SizedBox(height: 10),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              controller: controller,
              onChanged: (phone) {
              },
            ),
          ],
        ),
      ),
    );
  }
}

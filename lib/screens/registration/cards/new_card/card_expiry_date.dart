import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CardExpiryInput extends StatelessWidget {
  const CardExpiryInput({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4), // Limit to 4 characters (MM/YY)
        CardExpiryInputFormatter(), // Custom formatter for MM/YY
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Expiry Date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}



class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final StringBuffer newText = StringBuffer();

    // Format as MM/YY
    for (int i = 0; i < newValue.text.length; i++) {
      newText.write(newValue.text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newValue.text.length) {
        newText.write('/');
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

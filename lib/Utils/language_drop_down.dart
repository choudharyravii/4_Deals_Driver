import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        borderRadius: BorderRadius.circular(Data.height * 1),
        items: <String>['English', 'Arabic'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                CircleAvatar(
                  radius: Data.height * 2,
                  backgroundImage: AssetImage(
                      Data.imgBasePath + value.toLowerCase() + "_flag.png"),
                ),
                SizedBox(
                  width: Data.width * 10,
                ),
                Text(value),
              ],
            ),
          );
        }).toList(),
        onChanged: (_) {},
        elevation: 0,
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: Data.height * 4,
        ),
        hint: Text(
          "Select Language",
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: Data.height * 2.5,
              fontWeight: FontWeight.w600),
        ),
        underline: const SizedBox());
  }
}

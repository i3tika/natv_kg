import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField({
    super.key,
    required this.title,
    required this.number,
    this.textEditingController,
  });
  final String title;
  final String number;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 20),
          child: Text(title , style: TextStyle(fontSize: 18, color: Colors.grey,),),
        ),
         Padding(
          padding: const EdgeInsets.only(left : 20, right: 20, top: 5),
          child: TextField(
            decoration: InputDecoration(
                hintText: number , border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
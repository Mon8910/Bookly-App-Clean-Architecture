import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: outLineBorder(),
          focusedBorder: outLineBorder(),
          suffixIcon: Opacity(
            opacity: .8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          hintText: 'Search'),
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(16),
    );
  }
}

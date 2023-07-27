import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String? text;
  final bool? isFocus;
  final FocusNode? focusNode;

  const SearchWidget(
      {super.key,
      this.controller,
      required this.onChanged,
      this.text,
      this.isFocus,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
      focusNode: focusNode,
      autofocus: isFocus!,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey.shade100,
        ),
        hintText: "Search",
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: text!.isNotEmpty
            ? GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  controller!.clear();
                  onChanged('');
                  FocusScope.of(context).requestFocus(
                    FocusNode(),
                  );
                },
              )
            : null,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
      onChanged: onChanged,
    );
  }
}

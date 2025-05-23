import 'package:dae/core/components/dropdown_field_widget.dart';
import 'package:flutter/cupertino.dart';

class ItemInputWidget extends StatelessWidget {
  final String text;
  final List<String> items;
  final String value;
  final void Function(String?)? onChange;
  const ItemInputWidget({
    super.key,
    required this.text,
    required this.items,
    required this.value,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          DropdownFieldWidget(
            contentPadding: 5,
            items: items,
            value: value,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalBottomSheetWidget extends StatefulWidget {
  final List<GlobalOptionData> options;
  final void Function(GlobalOptionData item) onSelect;

  const GlobalBottomSheetWidget({
    super.key,
    required this.options,
    required this.onSelect,
  });

  @override
  _GlobalBottomSheetWidgetState createState() =>
      _GlobalBottomSheetWidgetState();
}

class _GlobalBottomSheetWidgetState extends State<GlobalBottomSheetWidget> {
  late List<GlobalOptionData> filteredOptions;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOptions = widget.options;
  }

  void _filterOptions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredOptions = widget.options;
      } else {
        filteredOptions = widget.options
            .where((option) =>
                option.value.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 30.h,
        bottom: bottomPadding > 0 ? bottomPadding : 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search Field
          GlobalTextFormfield(
            textEditingController: searchController,
            hintText: context.loc.search,
            onChanged: _filterOptions,
          ),
          const SizedBox(height: 16.0),
          // Options List
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredOptions.length,
              itemBuilder: (context, index) {
                final option = filteredOptions[index];
                return ListTile(
                  title: GlobalText(
                    str: option.value,
                    color: KColor.white.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () {
                    widget.onSelect(option);
                    Navigation.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

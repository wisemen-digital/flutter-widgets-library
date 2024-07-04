import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/wise_widgets_library.dart';

class PlatformSearch extends StatefulWidget {
  const PlatformSearch({
    required this.backgroundColor,
    required this.textColor,
    required this.placeholderColor,
    required this.buttonColor,
    super.key,
    this.onSearchChanged,
  });

  final ValueChanged<String>? onSearchChanged;
  final Color backgroundColor;
  final Color textColor;
  final Color placeholderColor;
  final Color buttonColor;

  @override
  State<PlatformSearch> createState() => _PlatformSearchState();
}

class _PlatformSearchState extends State<PlatformSearch> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isEditing =
            _focusNode.hasFocus || _textEditingController.text.isNotEmpty;
      });
    });

    _textEditingController.addListener(() {
      setState(() {
        _isEditing =
            _textEditingController.text.isNotEmpty || _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return _buildIosSearch();
    } else {
      return _buildMaterialSearch();
    }
  }

  Widget _buildIosSearch() {
    return Row(
      children: [
        Expanded(
          child: CupertinoSearchTextField(
            controller: _textEditingController,
            focusNode: _focusNode,
            onChanged: (value) => widget.onSearchChanged!(value),
          ),
        ),
        AnimatedClipRect(
          open: !_isEditing,
          horizontalAnimation: true,
          verticalAnimation: false,
          alignment: Alignment.centerLeft,
          child: const Padding(padding: EdgeInsets.only(right: 16)),
        ),
        AnimatedClipRect(
          open: _isEditing,
          horizontalAnimation: true,
          verticalAnimation: false,
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            child: Text(
              Swl.of(context).cancel,
              style: TextStyle(color: widget.buttonColor),
            ),
            onPressed: () {
              _textEditingController.clear();
              _focusNode.unfocus();

              if (widget.onSearchChanged != null) {
                // ignore: prefer_null_aware_method_calls
                widget.onSearchChanged!('');
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.p8, right: Sizes.p16),
      child: material.SearchBar(
        elevation: const material.WidgetStatePropertyAll(0),
        leading: Icon(
          material.Icons.search,
          color: widget.placeholderColor,
        ),
        backgroundColor: material.WidgetStatePropertyAll(
          widget.backgroundColor,
        ),
        textStyle: material.WidgetStatePropertyAll(
          TextStyle(color: widget.textColor),
        ),
        hintStyle: material.WidgetStatePropertyAll(
          TextStyle(color: widget.placeholderColor),
        ),
        hintText: Swl.of(context).search,
        controller: _textEditingController,
        trailing: _isEditing
            ? [
                material.IconButton(
                  color: widget.placeholderColor,
                  onPressed: () {
                    _textEditingController.clear();

                    if (widget.onSearchChanged != null) {
                      // ignore: prefer_null_aware_method_calls
                      widget.onSearchChanged!('');
                    }
                  },
                  icon: const Icon(material.Icons.clear),
                ),
              ]
            : [],
        onChanged: (value) {
          widget.onSearchChanged!(value);
        },
      ),
    );
  }
}

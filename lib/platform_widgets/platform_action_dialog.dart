import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

import 'platform_widget.dart';

class PlatformActionDialog
    extends PlatformWidget<CupertinoActionSheet, Material> {
  const PlatformActionDialog({
    required this.title,
    required this.actions,
    required this.functions,
    super.key,
    this.message,
  });
  final String? title;
  final String? message;
  final List<Widget?> actions;
  final List<void Function()> functions;

  @override
  CupertinoActionSheet createCupertinoWidget(BuildContext context) =>
      CupertinoActionSheet(
        title: Text(title ?? ''),
        actions: List.generate(
          actions.length,
          (index) => CupertinoActionSheetAction(
            child: actions[index]!,
            onPressed: () {
              Navigator.pop(context);
              functions[index]();
            },
          ),
        ),
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: Text(
            Swl.of(context).cancel,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );

  @override
  Material createMaterialWidget(BuildContext context) => Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomSheet(
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    // title
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(height: 1),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          title: actions[index],
                          onTap: () {
                            Navigator.pop(context);
                            functions[index]();
                          },
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: actions.length,
                      ),
                    ),
                  ],
                ),
              );
            },
            onClosing: () {},
          ),
        ),
      );
}

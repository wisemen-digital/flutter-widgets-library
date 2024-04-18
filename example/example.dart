import 'package:flutter/cupertino.dart';
import 'package:wisewidgetslibrary/wise_widgets_library.dart';

/// Example of a widget using [PlatformScaffold] and a constant [SizedBox]
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlatformScaffold(
      navigationBar: PlatformAppBar(),
      child: gapH10,
    );
  }
}

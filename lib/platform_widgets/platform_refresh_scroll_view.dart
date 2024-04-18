import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widgets.dart';

class PlatformRefreshScrollView
    extends PlatformWidget<CustomScrollView, RefreshIndicator> {
  const PlatformRefreshScrollView({
    required this.onRefresh,
    required this.headerSliver,
    required this.bodySlivers,
    super.key,
    this.physics,
    this.indicatorColor,
    this.scrollController,
  });
  final Widget headerSliver;
  final Color? indicatorColor;
  final List<Widget> bodySlivers;
  final void Function() onRefresh;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;

  @override
  CustomScrollView createCupertinoWidget(BuildContext context) {
    final slivers = <Widget>[
      headerSliver,
      CupertinoSliverRefreshControl(
        onRefresh: () async => onRefresh(),
        builder: (
          context,
          refreshState,
          pulledExtent,
          refreshTriggerPullDistance,
          refreshIndicatorExtent,
        ) =>
            CupertinoActivityIndicator(color: indicatorColor),
      ),
      ...bodySlivers,
    ];
    return CustomScrollView(
      physics: physics,
      slivers: slivers..addAll(bodySlivers),
      controller: scrollController,
    );
  }

  @override
  RefreshIndicator createMaterialWidget(BuildContext context) {
    final slivers = <Widget>[
      headerSliver,
      ...bodySlivers,
    ];
    return RefreshIndicator(
      color: indicatorColor,
      displacement: MediaQuery.of(context).size.height / 5,
      onRefresh: () async => onRefresh(),
      child: CustomScrollView(
        physics: physics,
        slivers: slivers,
        controller: scrollController,
      ),
    );
  }
}

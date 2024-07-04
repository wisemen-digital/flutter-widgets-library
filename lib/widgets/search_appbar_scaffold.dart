// ignore_for_file: omit_local_variable_types

import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:wisewidgetslibrary/widgets/platform_search_bar.dart';
import 'package:wisewidgetslibrary/widgets/safe_area_cupertino_refresh_indicator.dart';
import 'package:wisewidgetslibrary/wise_widgets_library.dart';

class SearchAppbarScaffold extends StatefulWidget {
  const SearchAppbarScaffold({
    required this.title,
    required this.slivers,
    required this.backgroundColor,
    required this.tintColor,
    required this.textColor,
    this.searchBackgroundColor = material.Colors.grey,
    this.placeholderColor = material.Colors.grey,
    super.key,
    this.onRefresh,
    this.rightAction,
    this.physics,
    this.onSearchChanged,
    this.hasBackground = true,
    this.scrollController,
    this.scrollToTop = false,
    this.blurs = true,
    this.leading,
  });
  final String title;
  final Widget? rightAction;
  final List<Widget> slivers;
  final RefreshCallback? onRefresh;
  final ScrollPhysics? physics;
  final ValueChanged<String>? onSearchChanged;
  final bool hasBackground;
  final ScrollController? scrollController;
  final bool scrollToTop;
  final bool blurs;
  final Color backgroundColor;
  final Color tintColor;
  final Color textColor;
  final Color searchBackgroundColor;
  final Color placeholderColor;
  final Widget? leading;

  @override
  State<SearchAppbarScaffold> createState() => _SearchAppbarScaffoldState();
}

class _SearchAppbarScaffoldState extends State<SearchAppbarScaffold> {
  final double _expandedHeight = 96;
  final double _collapsedHeight = material.kToolbarHeight;
  late double treshold = _expandedHeight - _collapsedHeight;
  var _isExpanded = true;
  double _expandedProgress = 1;
  bool _isAnimating = false;
  double _textFieldOffset = 32;
  late final double _searchHeight = isIos ? 48 : 64;
  late final double _actualSearchHeight =
      widget.onSearchChanged == null ? 0 : _searchHeight;

  late final ScrollController _scrollController =
      widget.scrollController ?? ScrollController();

  late final TextStyle largeAppbarTitle = TextStyle(
    inherit: false,
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: widget.textColor,
  );

  late final TextStyle smallAppbarTitle = TextStyle(
    inherit: false,
    fontFamily: 'CupertinoSystemDisplay',
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: widget.textColor,
    height: 0,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(_scrollListener);
      _scrollController.position.isScrollingNotifier
          .addListener(_isScrollingDidChange);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
  }

  Future<void> _animateTo(double offset) async {
    if (_isAnimating && !_scrollController.position.isScrollingNotifier.value) {
      return;
    }

    setState(() {
      _isAnimating = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 50));
    await _scrollController
        .animateTo(
      offset,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    )
        .then((_) {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;

      final addedHeight = _expandedHeight - _collapsedHeight - Sizes.p8;
      final searchBarOffset = max(addedHeight - offset, -Sizes.p8);

      if (searchBarOffset != _textFieldOffset) {
        setState(() {
          _textFieldOffset = searchBarOffset;
        });
      }

      // Calculate expanded state
      _isExpanded = _expandedHeight - offset > _collapsedHeight;

      // Calculate progress
      final double progress = offset / (_expandedHeight - _collapsedHeight);
      final double newProgress = 1 - min(1, max(0, progress));
      if (newProgress != _expandedProgress) {
        _expandedProgress = newProgress;
        setState(() {});
      }
    }
  }

  void _isScrollingDidChange() {
    if (!_scrollController.position.isScrollingNotifier.value &&
        !_isAnimating) {
      final offset = _scrollController.offset;

      if (offset >= treshold || offset < 0) {
        return;
      }

      if (offset < treshold / 2) {
        _animateTo(0);
      } else {
        _animateTo(
          min(
            _scrollController.position.maxScrollExtent,
            treshold + (widget.onSearchChanged == null ? 0 : 8),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    if (widget.scrollToTop) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    return material.Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildContent(topPadding),
          ),
          if (widget.rightAction != null)
            Positioned(
              top: topPadding,
              right: Sizes.p8,
              child: widget.rightAction!,
            ),
        ],
      ),
    );
  }

  Widget _buildContent(double topPadding) {
    if (isAndroid && widget.onRefresh != null) {
      return material.RefreshIndicator(
        color: widget.tintColor,
        onRefresh: widget.onRefresh!,
        displacement: topPadding,
        child: _buildCustomScrollView(),
      );
    } else {
      return _buildCustomScrollView();
    }
  }

  Widget _buildCustomScrollView() {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: _isAnimating,
          child: CustomScrollView(
            physics: widget.onRefresh != null
                ? const AlwaysScrollableScrollPhysics()
                : widget.physics,
            controller: _scrollController,
            slivers: [
              if (widget.onRefresh != null && isIos)
                SafeAreaCupertinoRefreshIndicator(onRefresh: widget.onRefresh!),
              _buildAppBar(),
              SliverPadding(
                padding: EdgeInsets.only(bottom: _actualSearchHeight),
              ),
              ...widget.slivers,
            ],
          ),
        ),
        _buildSearch(),
      ],
    );
  }

  Widget _buildAppBar() {
    return material.SliverAppBar.large(
      toolbarHeight: material.kToolbarHeight,
      stretch: true,
      surfaceTintColor: material.Colors.transparent,
      title: AnimatedOpacity(
        opacity: _isExpanded ? 0 : 1,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AutoSizeText(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      leading: widget.leading,
      titleTextStyle: smallAppbarTitle,
      centerTitle: true,
      expandedHeight: _expandedHeight,
      backgroundColor: material.Colors.transparent,
      flexibleSpace: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isExpanded ? 0 : 1,
              duration: Duration.zero,
              child: SizedBox(
                height: MediaQuery.of(context).padding.top +
                    _collapsedHeight +
                    _actualSearchHeight +
                    (widget.blurs ? 0 : 8),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: widget.backgroundColor.withOpacity(
                        isIos && widget.blurs ? 0.4 : 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: _collapsedHeight +
                MediaQuery.of(context).padding.top -
                Sizes.p8,
            left: Sizes.p16,
            right: Sizes.p16,
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomLeft,
                heightFactor: _expandedProgress,
                child: AutoSizeText(
                  widget.title,
                  style: largeAppbarTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    if (widget.onSearchChanged != null) {
      return Positioned(
        top: MediaQuery.of(context).padding.top +
            _collapsedHeight +
            _textFieldOffset,
        left: Sizes.p16,
        right: 0,
        child: PlatformSearch(
          backgroundColor: widget.searchBackgroundColor,
          textColor: widget.textColor,
          placeholderColor: widget.placeholderColor,
          buttonColor: widget.tintColor,
          onSearchChanged: widget.onSearchChanged,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

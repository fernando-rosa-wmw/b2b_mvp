import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class WebScroll extends StatefulWidget {
  final Widget child;

  const WebScroll({
    super.key,
    required this.child,
  });

  @override
  State<WebScroll> createState() => _WebScrollState();
}

class _WebScrollState extends State<WebScroll> {

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(_) {
    return WebSmoothScroll(
      controller: _scrollController,
      animationDuration: 500,
      scrollOffset: 100,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}

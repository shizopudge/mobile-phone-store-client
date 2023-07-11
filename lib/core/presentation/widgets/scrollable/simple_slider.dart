import 'dart:async';

import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class SimpleSlider extends StatefulWidget {
  final Widget Function(int index) itemBuilder;
  final int itemCount;
  final int initialPage;
  final bool showBottomButtons;
  final Duration slidePeriod;
  final Color bottomActiveButtonColor;
  final Color bottomInactiveButtonColor;
  const SimpleSlider({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.initialPage = 0,
    this.showBottomButtons = true,
    this.slidePeriod = const Duration(milliseconds: 3000),
    this.bottomActiveButtonColor = kLightWhite,
    this.bottomInactiveButtonColor = kGrey,
  });

  @override
  State<SimpleSlider> createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  Timer? _timer;
  Timer? _refreshTimer;

  late final PageController _pageController =
      PageController(initialPage: widget.initialPage, viewportFraction: 1.1)
        ..addListener(_pageListener);
  late final ValueNotifier<int> _pageNotifer =
      ValueNotifier(widget.initialPage);

  void _pageListener() {
    _cancelTimer();
    _pageNotifer.value = _pageController.page?.ceil() ?? 0;
  }

  void _changePage(int page) => _pageController.animateToPage(page,
      duration: const Duration(milliseconds: 200), curve: Curves.easeOut);

  void _onTick(Timer timer) {
    final currPage = _pageController.page?.ceil() ?? 0;
    if (currPage == widget.itemCount - 1) {
      _changePage(0);
    } else {
      _changePage(currPage + 1);
    }
  }

  void _cancelTimer({Duration? duration}) {
    _refreshTimer?.cancel();
    _timer?.cancel();
    _refreshTimer = Timer(duration ?? widget.slidePeriod, _startAutoScroll);
  }

  void _startAutoScroll() {
    if (widget.itemCount > 1) {
      _timer = Timer.periodic(widget.slidePeriod, _onTick);
    }
  }

  @override
  void initState() {
    _startAutoScroll();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _pageNotifer,
      builder: (context, page, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                widget.itemCount,
                (index) => FractionallySizedBox(
                  widthFactor: 1 / _pageController.viewportFraction,
                  child: GestureDetector(
                    onTap: _cancelTimer,
                    onLongPress: () => _cancelTimer(
                        duration: const Duration(milliseconds: 12000)),
                    onDoubleTap: _cancelTimer,
                    child: widget.itemBuilder(index),
                  ),
                ),
              ),
            ),
          ),
          if (widget.showBottomButtons)
            SizedBox(
              height: SizeConfig.setPadding(15),
            ),
          if (widget.showBottomButtons)
            SizedBox(
              height: SizeConfig.radiusSmall * 2,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.itemCount,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: SizeConfig.setPadding(8)),
                    child: GestureDetector(
                      onTap: () => _changePage(index),
                      child: CircleAvatar(
                        backgroundColor: index == page
                            ? widget.bottomActiveButtonColor
                            : widget.bottomInactiveButtonColor,
                        radius: index == page
                            ? SizeConfig.radiusSmall
                            : SizeConfig.radiusSmaller,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.showBottomButtons)
            SizedBox(
              height: SizeConfig.setPadding(15),
            ),
        ],
      ),
    );
  }
}

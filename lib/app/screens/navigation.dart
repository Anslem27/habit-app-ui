// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'grow/views/grow_page_view.dart';
import 'home/views/home_view.dart';
import 'profile/views/profile_view.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late int _currentPage;
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController(initialPage: _currentPage);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _shakeAnimation =
        Tween(begin: -5.0, end: 5.0).animate(_animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _changePage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _onButtonTap(int index) {
    _changePage(index);
    _pageController.jumpToPage(index);

    _animationController.reset();
    _animationController.forward();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mildBlack,
      body: BottomBar(
        fit: StackFit.expand,
        // barColor: ,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        scrollOpposite: false,
        hideOnScroll: true,
        body: (context, controller) => PageView(
          onPageChanged: _onPageChanged,
          controller: _pageController,
          children: const [
            HomeView(),
            GrowPageView(),
            ProfileView(),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onButtonTap(0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(
                  _currentPage == 0 ? _shakeAnimation.value : 0,
                  _currentPage == 0 ? _shakeAnimation.value : 0,
                  0,
                ),
                child: SizedBox(
                  height: 70,
                  width: 40,
                  child: Center(
                    child: Icon(
                      size: 28,
                      _currentPage == 0 ? Icons.sunny : PhosphorIcons.sun(),
                      color: _currentPage == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onButtonTap(1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(
                  _currentPage == 1 ? _shakeAnimation.value : 0,
                  _currentPage == 1 ? _shakeAnimation.value : 0,
                  0,
                ),
                child: SizedBox(
                  height: 70,
                  width: 40,
                  child: Center(
                    child: Icon(
                      size: 28,
                      _currentPage == 1 ? Icons.star : PhosphorIcons.star(),
                      color: _currentPage == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onButtonTap(2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(
                  _currentPage == 2 ? _shakeAnimation.value : 0,
                  _currentPage == 2 ? _shakeAnimation.value : 0,
                  0,
                ),
                child: SizedBox(
                  height: 70,
                  width: 40,
                  child: Center(
                    child: Icon(
                      size: 28,
                      _currentPage == 2
                          ? Icons.person
                          : Icons.person_outline_outlined,
                      color: _currentPage == 2 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

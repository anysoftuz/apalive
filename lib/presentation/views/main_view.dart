import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(boxShadow: wboxShadow),
        child: BottomNavigationBar(
          backgroundColor: white,
          items: [
            BottomNavigationBarItem(
              icon: AppIcons.home.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.home.svg(color: Color(0xFF003B81)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.globalEducation.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.globalEducation.svg(
                color: Color(0xFF003B81),
              ),
              label: 'Academy',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.mortarboardBottom.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.mortarboardBottom.svg(
                color: Color(0xFF003B81),
              ),
              label: 'Graduates',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.bookOpen.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.bookOpen.svg(color: Color(0xFF003B81)),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.video.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.video.svg(color: Color(0xFF003B81)),
              label: 'Meets',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.archive.svg(color: Color(0xFF535862)),
              activeIcon: AppIcons.archive.svg(color: Color(0xFF003B81)),
              label: 'Blog',
            ),
            // BottomNavigationBarItem(
            //   icon: AppIcons.userGroup.svg(
            //     color: Color(0xFF535862),
            //     height: 24,
            //     width: 24,
            //   ),
            //   activeIcon: AppIcons.userGroup.svg(
            //     color: Color(0xFF003B81),
            //     height: 24,
            //     width: 24,
            //   ),
            //   label: 'Forum',
            // ),
          ],
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade400,
        ),
      ),
    );
  }
}

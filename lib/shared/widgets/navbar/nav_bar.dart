import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(String) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          child: Container(
            height: 60,
            color: Colors.transparent,
            child: Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  // onTap: () => onTap(routePaths.home),
                ),
                navItem(
                  Icons.category_outlined,
                  pageIndex == 1,
                  // onTap: () => onTap(routePaths.task.path),
                ),
                const SizedBox(width: 80),
                navItem(
                  Icons.notifications_none_outlined,
                  pageIndex == 2,
                  // onTap: () => onTap(routePaths.home),
                ),
                navItem(
                  Icons.search_rounded,
                  pageIndex == 3,
                  // onTap: () => onTap(routePaths.home),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected ? Colors.black : Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }
}

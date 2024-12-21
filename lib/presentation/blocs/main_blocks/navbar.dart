import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:card_swiper/card_swiper.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchPressed;
  final bool isScrolled;
  
  const Navbar({
    super.key, 
    this.title = 'GenCare',
    this.onSearchPressed,
    this.isScrolled = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PreferredSize(
      preferredSize: preferredSize,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: theme.brightness == Brightness.light 
              ? Brightness.dark : Brightness.light,
          ),
          elevation: isScrolled ? 4 : 0,
          backgroundColor: theme.primaryColor.withOpacity(isScrolled ? 1 : 0.95),
          automaticallyImplyLeading: false,
          leading: null,
          title: Hero(
            tag: 'app_title',
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                'assets/icon/icon.png',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                scale: 0.8,
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: 'ابحث هنا...',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.mic_rounded,
                      color: Colors.white.withOpacity(0.7),
                      size: 24,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                  ),
                ),
                onTap: () {
                  HapticFeedback.selectionClick();
                  if (onSearchPressed != null) {
                    onSearchPressed!();
                  } else {
                    showSearch(context: context, delegate: CustomSearchDelegate());
                  }
                },
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                tooltip: 'المزيد',
                offset: const Offset(0, 50),
                elevation: 8,
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                constraints: const BoxConstraints(
                  minWidth: 220,
                  maxWidth: 280,
                ),
                padding: EdgeInsets.zero,
                itemBuilder: (context) => [
                  _buildMenuItem('الملف الشخصي', Icons.person_rounded, 'Profile'),
                  _buildMenuItem('الإعدادات', Icons.settings_rounded, 'Settings'),
                  _buildMenuItem('حول التطبيق', Icons.info_outline_rounded, 'About'),
                  _buildMenuItem('اتصل بنا', Icons.mail_outline_rounded, 'Contact'),
                  const PopupMenuDivider(height: 0.5),
                  _buildMenuItem('تسجيل الخروج', Icons.logout_rounded, 'Logout', isDestructive: true),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withBlue(theme.primaryColor.blue + 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(
    String text, 
    IconData icon, 
    String value, 
    {bool isDestructive = false}
  ) {
    return PopupMenuItem<String>(
      value: value,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDestructive 
                ? Colors.red.withOpacity(0.1)
                : Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: isDestructive ? Colors.red : Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDestructive ? Colors.red : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white.withOpacity(0.15),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Colors.white70),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) => const SizedBox();
}

class EnhancedSwiper extends StatelessWidget {
  final List<SwiperItem> items;
  final Duration autoplayDelay;
  final bool autoplay;

  const EnhancedSwiper({
    super.key,
    required this.items,
    this.autoplayDelay = const Duration(seconds: 5),
    this.autoplay = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Swiper(
        itemBuilder: (_, i) => _buildSwiperItem(items[i]),
        itemCount: items.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).primaryColor,
            color: Colors.grey.withOpacity(0.3),
            size: 8,
            activeSize: 10,
          ),
        ),
        control: const SwiperControl(color: Colors.white, padding: EdgeInsets.all(12)),
        autoplay: autoplay,
        autoplayDelay: autoplayDelay.inMilliseconds,
        duration: 800,
        curve: Curves.easeInOutCubic,
        viewportFraction: 0.85,
        scale: 0.9,
      ),
    );
  }

  Widget _buildSwiperItem(SwiperItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, progress) => progress == null ? child : Center(
                child: CircularProgressIndicator(value: progress.expectedTotalBytes != null 
                  ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes! 
                  : null),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(item.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item.description, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwiperItem {
  final String imageUrl;
  final String title;
  final String description;
  
  const SwiperItem({required this.imageUrl, required this.title, required this.description});
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/extensions/space_exs.dart';
import 'package:new_flutter/utils/app_colors.dart';
import 'package:new_flutter/views/home/about_view.dart';
import 'package:new_flutter/views/home/home_view.dart';
import 'package:new_flutter/views/home/profile_view.dart';
import 'package:new_flutter/views/home/setting_view.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

//icons
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

//text
  final List<String> texts = [
    "Ana Sayfa",
    "Profil",
    "Ayarlar",
    "Hakkında",
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: AppColors.primaryGradientColor,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
          ),
          8.h,
          Text(
            "Berat Musa Yücel",
            style: textTheme.displayMedium,
          ),
          Text(
            "Flutter",
            style: textTheme.bodySmall,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Sayfa yönlendirme
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingView()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutView()),
                        );
                        break;
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        texts[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:new_flutter/extensions/space_exs.dart';
import 'package:new_flutter/utils/app_colors.dart';
import 'package:new_flutter/utils/app_str.dart';
import 'package:new_flutter/utils/constants.dart';
import 'package:new_flutter/views/home/components/fab.dart';
import 'package:new_flutter/views/home/components/home_app_bar.dart';
import 'package:new_flutter/views/home/components/slider_drawer.dart';

import 'widgets/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  final List<int> testing = [];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Colors.white,

        //FAB
        floatingActionButton: const Fab(),

        //Body
        body: SliderDrawer(
          key: drawerKey,
          isDraggable: false,
          animationDuration: 700,

          //drawer
          slider: CustomDrawer(),

          appBar: HomeAppBar(
            drawerKey: drawerKey,
          ),

          //main body
          child: _buildHomeBody(textTheme),
        ));
  }

// Home Body
  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          //app bar
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //progress
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,

                // top level task info
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStr.mainTitle,
                      style: textTheme.displayLarge,
                    ),
                    3.h,
                    Text(
                      "3 görevden 1'i",
                      style: textTheme.titleMedium,
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),

          //task
          SizedBox(
            width: double.infinity,
            height: 500,
            child: testing.isNotEmpty
                ? ListView.builder(
                    // shrinkWrap: true,
                    itemCount: testing.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {},
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              8.w,
                              const Text(
                                AppStr.deletedTask,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          key: Key(
                            index.toString(),
                          ),
                          child: const TaskWidget());
                    })
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                            lottieURL,
                            animate: testing.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      FadeInUp(
                        from: 30,
                        child: const Text(
                          AppStr.doneAllTask,
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:new_flutter/extensions/space_exs.dart';
import 'package:new_flutter/utils/app_colors.dart';
import 'package:new_flutter/utils/app_str.dart';
import 'package:new_flutter/views/home/components/date_time_selection.dart';
import 'package:new_flutter/views/home/components/rep_textfield.dart';
import 'package:new_flutter/views/home/widgets/tas_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const TaskViewAppBar(),

        //body
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //top side text
                _buildTopSideTexts(textTheme),

                _buildMainTaskViewActivity(textTheme, context),

                _buildBottomSideButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSideButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // delete button
          MaterialButton(
            onPressed: () {},
            minWidth: 150,
            height: 55,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                ),
                5.w,
                const Text(
                  AppStr.deleteTask,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          //add button
          MaterialButton(
            onPressed: () {},
            minWidth: 150,
            height: 55,
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              AppStr.addTaskString,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 530,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              AppStr.titleOfTitleTextField,
              style: textTheme.headlineMedium,
            ),
          ),

          //task title
          RepTextField(controller: titleTaskController),

          10.h,

          //task title
          RepTextField(
            controller: descriptionTaskController,
            isForDescription: true,
          ),

          //time selection
          DateTimeSelectionWidget(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => SizedBox(
                        height: 280,
                        child: TimePickerWidget(
                          onChange: (_, __) {},
                          dateFormat: 'HH:mm',
                          onConfirm: (dateTime, _) {},
                        ),
                      ));
            },
            title: AppStr.timeString,
          ),
          DateTimeSelectionWidget(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                maxDateTime: DateTime(2030, 4, 5),
                minDateTime: DateTime.now(),
                onConfirm: (dateTime, _) {},
              );
            },
            title: AppStr.dateString,
          ),
        ],
      ),
    );
  }

  Widget _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 62,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
              text: TextSpan(
                  text: AppStr.addNewTask,
                  style: textTheme.titleLarge,
                  children: const [])),
          const SizedBox(
            width: 62,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}

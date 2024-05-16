import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:new_flutter/main.dart';
import 'package:new_flutter/utils/app_str.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

String lottieURL = "assets/lottie/1.json";

dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'Zaten Tüm Görevleri Sildin!',
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'Görevleri Düzenlemeyi ve Ardından Güncellemeyi Deneyin!',
    corner: 20.0,
    duration: 5000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: AppStr.oopsMsg,
    message: 'Silmek İçin Görev Yok!\n Biraz Ekledikten Sonra Deneyin.',
    buttonText: "Tamam",
    onTapDismiss: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.normal,
  );
}

dynamic deleteAtTask(BuildContext context) {
  return PanaraConfirmDialog.show(context,
      title: AppStr.areYouSure,
      message:
          "Gerçekten Tüm Görevleri Silmek İstiyor Musun? Bunu Geri Alamayacaksın!",
      confirmButtonText: "Evet",
      cancelButtonText: "Hayır", onTapConfirm: () {
    BaseWidget.of(context).dataStore.box.clear();
    Navigator.pop(context);
  }, onTapCancel: () {
    Navigator.pop(context);
  }, panaraDialogType: PanaraDialogType.error, barrierDismissible: false);
}

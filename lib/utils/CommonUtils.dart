import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUtils {

  static void showToast(BuildContext context,String text){
    Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }

  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }

   static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      print("Cannot open url $url");
    }
  }

  static String getSearchUrl(String title){
    return "https://en.wikipedia.org/wiki/"+title.replaceAll(" ","_");
  }
}

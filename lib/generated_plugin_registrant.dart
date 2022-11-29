//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';


// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  // FilePickerWeb.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  // GeolocatorPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}

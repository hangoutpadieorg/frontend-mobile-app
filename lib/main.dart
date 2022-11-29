import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_main.dart';
import 'common/constants/firebase_messaging.dart';
import 'common/constants/utils.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//// 428 926

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

// late MessageFromFirebaseHandling messageFromFirebaseHandling;
final messageFromFirebaseHandlingProvider = Provider<MessageFromFirebaseHandling>((ref) => MessageFromFirebaseHandling.init(ref));


int? isViewed;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  hasInternetConnection();
  debugPrint('has connection');

  final sharePreferences = await SharedPreferences.getInstance();
  ////////onBoard
  isViewed = sharePreferences.getInt('onBoard');
  debugPrint('saved');
      runApp(const ProviderScope(
       child: MyApp(),
  ));
}


























// overrides: [
//   sharedPreferencesProvider.overrideWithValue(sharePreferences),
// ],
// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError();
// });



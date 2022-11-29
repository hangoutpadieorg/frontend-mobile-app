import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/services/auth/shared_prefernces.dart';


final loadingProvider = StateProvider.autoDispose<bool>((ref) => false);
final tokenProvider = FutureProvider<String?>((ref) async {
  String? token = await Preferences().getToken();
  return token;
});

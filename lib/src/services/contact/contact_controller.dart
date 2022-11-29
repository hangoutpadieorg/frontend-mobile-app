import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/constants/exceptions.dart';
import 'contact_services.dart';


final urlControllerProvider =
StateNotifierProvider<ContactController, dynamic>(
        (ref) => ContactController());

class ContactController extends StateNotifier{
  final Ref? _read;
  ContactController([this._read]) : super(null) {
    String? url;
    final uri = Uri.parse(url!);
    launchUrl(uri.toString());
  }

  Future<void> launchUrl(String? url) async {
    try {
      final urls = await _read!.read(contactServiceProvider).launchURL(url!);
      state = urls;
    } on CustomException {
      state = int;
    }
  }
}

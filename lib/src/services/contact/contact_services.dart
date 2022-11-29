import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';



final contactServiceProvider = Provider<ContactService>((ref) {
  // Client _client = Client();
  return ContactService();
});

class ContactService{

  launchURL(String url) async{
    final uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else{
      throw 'Could not launch';
    }
  }


  openLink(){
  }
}
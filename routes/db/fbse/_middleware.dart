import 'package:firedart/firedart.dart';

import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  // TODO: implement middleware
  return (context) async {
    if (Firestore.initialized == false) {
      Firestore.initialize("healthcare7-7476f");
    }
    final response = await handler(context);
    return response;
  };
}

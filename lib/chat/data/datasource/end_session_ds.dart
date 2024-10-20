import 'dart:developer';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/get_sahaara_endpoint_notifier.dart';

import 'package:http/http.dart' as http;
import 'package:sahaara/sessions/presentation/notifier/session_notifier.dart';

Future endSession(WidgetRef ref) async {
  try {
    final uri = Uri.parse('${ref.read(getSahaaraEndpointNotifier)}/end');

    log('Uri for end: $uri');
    var request = http.MultipartRequest('POST', uri);

    String sessionId = ref.read(sessionNotifier);
    ref.read(sessionNotifier.notifier).setSessionId(sessionId);
    request.fields['session_id'] = sessionId;
    request.fields['uid'] = ref.read(myUserNotifier).uid;

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse)
        .timeout(6.seconds, onTimeout: () => Future.error(Error()));

    if (response.statusCode == 200) {
      log('Request sent for session end..');
    } else {
    
     
    }
  } catch (e) {
    
      log('Error uploading file: $e');
  
  
  }
}

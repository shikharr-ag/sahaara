import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetSaharaEndpointNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  Future getSaharaEndpoint()async{
state = await    FirebaseFirestore.instance.collection('remote-data').doc('sahara_endpoint').get().then((docSnap){
      if(docSnap.exists){
        return docSnap.data()?['endpoint'] ?? '';
      }else{
         return 'http://10.156.114.253:8000/ask';
      }
    });
  }
}


final getSahaaraEndpointNotifier = NotifierProvider<GetSaharaEndpointNotifier,String>(GetSaharaEndpointNotifier.new);
import 'package:firedart/firedart.dart';
import 'package:first_api/utis/constants.dart';

import '../routes/db/fbse/index.dart';
import 'models.dart';

class CallRecord{


Constants c =Constants();



addCallRecord(CreateCallCollection callDetails){


c.db.collection("Companies")
    .document(c.companyID!)
    .collection("conversations")
    .document("telephony")
    .collection("call collection")
    .document(c.CIUD!)
    .set(callDetails as Map<String, dynamic>);  


}

}
import 'dart:io';

import 'package:firedart/firedart.dart';
import 'package:firedart/firedart.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:first_api/utis/constants.dart';

import '../../../../createCallCollection/controller.dart';
import '../../../../createCallCollection/models.dart';
import '../index.dart';

Constants constant = Constants();
Future<Response> onRequest(RequestContext context) async {
  // TODO: implement route handler
  switch (context.request.method) {
    case HttpMethod.post:
      return fetchCompanyID(context);

    case HttpMethod.delete:
    case HttpMethod.get:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> fetchCompanyID(RequestContext context) async {
  //checking token
  if (context.request.headers['authorization'].toString() !=
      constant.tokenformainapi.toString()) {
    return Response(statusCode: HttpStatus.forbidden);
  }

  //start process

  final body = await context.request.json() as Map<String, dynamic>;
print(body.toString());

  constant.didNumber = body["call_to_number"] as String;

  constant.callduration = body["duration"] as String;
  constant.endTime = body["end_stamp"] as String;
  constant.callDirection = body["direction"] as String;

  constant.CIUD = body["uuid"] as String;
  constant.callStartStamp = body["start_stamp"] as String;


  await constant.db
      .collection("masterCollection")
      .document("didNumbers")
      .collection("didNumbers")
      .where("didNo", isEqualTo: constant.didNumber)
      .get()
      .then(
    (value) async {
      constant.companyID = value[0]["companyId"] as String;

      await constant.db
          .collection("Companies")
          .document(constant.companyID!)
          .collection("Employees")
          .where("phoneNo", isEqualTo: constant.answeredAgentNo)
          .get()
          .then((value2) {
        constant.empID = value2[0]["id"].toString();
        constant.empPhoneno = value2[0]["phoneNo"].toString();
        constant.empDesignation = value2[0]["designation"].toString();
        constant.empName = value2[0]["name"].toString();
      });
    },
  );

  return fetchWebhookOnHangUp(context);
}

Future<Response> fetchWebhookOnHangUp(RequestContext context) async {
  CallRecord callRecord = CallRecord();

  CreateCallCollection callDetails = CreateCallCollection(
      companyID: constant.companyID,
      cuid: constant.CIUD,
      callerDid: constant.didNumber,

      agentDid: constant.didNumber,
      callStartStamp: constant.callStartStamp,
      recordingLink: constant.recordingLink,
      agentid: constant.empID,
      callStatus: "Ended",
      callTranfer: false,
      callTransferIds: [],
      department: "Sales",
      isNewLeadCall: false,
      baseID: constant.baseID,
  
    
      advertisedNumber: false,
      callDirection: constant.callDirection,
      duration: constant.callduration,
      endStamp: constant.endTime);

  callRecord.updateCallRecord(callDetails);

  return Response.json(body: "Done");
}

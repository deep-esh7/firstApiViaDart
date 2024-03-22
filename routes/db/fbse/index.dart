import 'dart:async';
import 'dart:io';
import 'package:firedart/firedart.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:first_api/utis/constants.dart';

var constant = Constants();
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
  ;
}

//fetch company id

Future<Response> fetchCompanyID(RequestContext context) async {
  //checking token
  if ((context.request.headers['authorization'] != "hello")) {
    return Response(statusCode: HttpStatus.forbidden);
  }

  //start process

  final body = await context.request.json() as Map<String, dynamic>;

  constant.didNumber = body["call_to_number"] as String;
  constant.callerNumber = body["caller_id_number"] as String;

  constant.CIUD = body["call_id"] as String;
  constant.callStartStamp = body["start_stamp"] as String;

  await constant.db
      .collection("masterCollection")
      .document("didNumbers")
      .collection("didNumbers")
      .where("didNo", isEqualTo: constant.didNumber)
      .get()
      .then(
    (value) {
      constant.companyID = value[0]["companyId"] as String;
      print(constant.companyID);
    },
  );

  return checkLeadExists(context);
}

// check lead exists or not

Future<Response> checkLeadExists(
  RequestContext context,
) async {
  var res;
  unawaited(await constant.db
      .collection("Companies")
      .document(constant.companyID!)
      .collection("leads")
      .where("personalDetails.mobileNo", isEqualTo: constant.callerNumber)
      .get()
      .then(
    (value) async {
      if (value.toString() != "[]") {
        // this means lead exists and data is extracted and now goto emplyee collection to check weather employee is avaialbe or busy
        constant.empID = value[0]["owner"]["id"] as String;
        constant.empName = value[0]["owner"]["name"] as String;
        constant.empDesignation = value[0]["owner"]["designation"] as String;

        await constant.db
            .collection("Companies")
            .document(constant.companyID!)
            .collection("Employees")
            .document(constant.empID!)
            .get()
            .then((value2) {
          constant.empPhoneno = value2.map["phoneNo"] as String;

          constant.empStatus = value2.map["status"] as String;
          // now we have extracted the emp phone no and status for exisiting lead

          if (constant.empStatus == "available") {
            List agentNumbers = [];

            agentNumbers.add(constant.empPhoneno);

            var resMap = [
              {
                "transfer": {"type": "number", "data": agentNumbers}
              }
            ];

            print("adsd");

            res = resMap;
          } else {
            List agentNumbers = [];
            agentNumbers.add("11111");

            res = agentNumbers;
            var resMap = [
              {
                "transfer": {"type": "number", "data": agentNumbers}
              }
            ];
          }
        });
      } else {
//this means leads doesnt exists

        print(value);
      }
    },
  ));

  return Response.json(body: res);
}

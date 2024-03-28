// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';

class CreateCallCollection {
  String? companyID;
  String? cuid;
  String? callerDid;
  String? callerNumber;
  String? agentDid;
  String? callStartStamp;
  String? recordingLink;
  String? agentid;
  String? callStatus;
  bool? callTranfer;
  List<String>? callTransferIds;
  String? department;
  bool? isNewLeadCall;
  String? baseID;
  bool? isSmsSent;
  String? callDateTime;
  bool? advertisedNumber;
  String? callDirection;
  String? endStamp;
  String? duration;
  String? source;
  CreateCallCollection({
    this.companyID,
    this.cuid,
    this.callerDid,
    this.callerNumber,
    this.agentDid,
    this.callStartStamp,
    this.recordingLink,
    this.agentid,
    this.callStatus,
    this.callTranfer,
    this.callTransferIds,
    this.department,
    this.isNewLeadCall,
    this.baseID,
    this.isSmsSent,
    this.callDateTime,
    this.advertisedNumber,
    this.callDirection,
    this.endStamp,
    this.duration,
    this.source,
  });

  CreateCallCollection copyWith({
    String? companyID,
    String? cuid,
    String? callerDid,
    String? callerNumber,
    String? agentDid,
    String? callStartStamp,
    String? recordingLink,
    String? agentid,
    String? callStatus,
    bool? callTranfer,
    List<String>? callTransferIds,
    String? department,
    bool? isNewLeadCall,
    String? baseID,
    bool? isSmsSent,
    String? callDateTime,
    bool? advertisedNumber,
    String? callDirection,
    String? endStamp,
    String? duration,
    String? source,
  }) {
    return CreateCallCollection(
      companyID: companyID ?? this.companyID,
      cuid: cuid ?? this.cuid,
      callerDid: callerDid ?? this.callerDid,
      callerNumber: callerNumber ?? this.callerNumber,
      agentDid: agentDid ?? this.agentDid,
      callStartStamp: callStartStamp ?? this.callStartStamp,
      recordingLink: recordingLink ?? this.recordingLink,
      agentid: agentid ?? this.agentid,
      callStatus: callStatus ?? this.callStatus,
      callTranfer: callTranfer ?? this.callTranfer,
      callTransferIds: callTransferIds ?? this.callTransferIds,
      department: department ?? this.department,
      isNewLeadCall: isNewLeadCall ?? this.isNewLeadCall,
      baseID: baseID ?? this.baseID,
      isSmsSent: isSmsSent ?? this.isSmsSent,
      callDateTime: callDateTime ?? this.callDateTime,
      advertisedNumber: advertisedNumber ?? this.advertisedNumber,
      callDirection: callDirection ?? this.callDirection,
      endStamp: endStamp ?? this.endStamp,
      duration: duration ?? this.duration,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyID': companyID,
      'cuid': cuid,
      'callerDid': callerDid,
      'callerNumber': callerNumber,
      'agentDid': agentDid,
      'callStartStamp': callStartStamp,
      'recordingLink': recordingLink,
      'agentid': agentid,
      'callStatus': callStatus,
      'callTranfer': callTranfer,
      'callTransferIds': callTransferIds,
      'department': department,
      'isNewLeadCall': isNewLeadCall,
      'baseID': baseID,
      'isSmsSent': isSmsSent,
      'callDateTime': callDateTime,
      'advertisedNumber': advertisedNumber,
      'callDirection': callDirection,
      'endStamp': endStamp,
      'duration': duration,
      'source': source,
    };
  }

  factory CreateCallCollection.fromMap(Map<String, dynamic> map) {
    return CreateCallCollection(
      companyID: map['companyID'] != null ? map['companyID'] as String : null,
      cuid: map['cuid'] != null ? map['cuid'] as String : null,
      callerDid: map['callerDid'] != null ? map['callerDid'] as String : null,
      callerNumber: map['callerNumber'] != null ? map['callerNumber'] as String : null,
      agentDid: map['agentDid'] != null ? map['agentDid'] as String : null,
      callStartStamp: map['callStartStamp'] != null ? map['callStartStamp'] as String : null,
      recordingLink: map['recordingLink'] != null ? map['recordingLink'] as String : null,
      agentid: map['agentid'] != null ? map['agentid'] as String : null,
      callStatus: map['callStatus'] != null ? map['callStatus'] as String : null,
      callTranfer: map['callTranfer'] != null ? map['callTranfer'] as bool : null,
      callTransferIds: map['callTransferIds'] != null ? List<String>.from((map['callTransferIds'] as List<String>) ): null,
      department: map['department'] != null ? map['department'] as String : null,
      isNewLeadCall: map['isNewLeadCall'] != null ? map['isNewLeadCall'] as bool : null,
      baseID: map['baseID'] != null ? map['baseID'] as String : null,
      isSmsSent: map['isSmsSent'] != null ? map['isSmsSent'] as bool : null,
      callDateTime: map['callDateTime'] != null ? map['callDateTime'] as String : null,
      advertisedNumber: map['advertisedNumber'] != null ? map['advertisedNumber'] as bool : null,
      callDirection: map['callDirection'] != null ? map['callDirection'] as String : null,
      endStamp: map['endStamp'] != null ? map['endStamp'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateCallCollection.fromJson(String source) => CreateCallCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateCallCollection(companyID: $companyID, cuid: $cuid, callerDid: $callerDid, callerNumber: $callerNumber, agentDid: $agentDid, callStartStamp: $callStartStamp, recordingLink: $recordingLink, agentid: $agentid, callStatus: $callStatus, callTranfer: $callTranfer, callTransferIds: $callTransferIds, department: $department, isNewLeadCall: $isNewLeadCall, baseID: $baseID, isSmsSent: $isSmsSent, callDateTime: $callDateTime, advertisedNumber: $advertisedNumber, callDirection: $callDirection, endStamp: $endStamp, duration: $duration, source: $source)';
  }

  @override
  bool operator ==(covariant CreateCallCollection other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.companyID == companyID &&
      other.cuid == cuid &&
      other.callerDid == callerDid &&
      other.callerNumber == callerNumber &&
      other.agentDid == agentDid &&
      other.callStartStamp == callStartStamp &&
      other.recordingLink == recordingLink &&
      other.agentid == agentid &&
      other.callStatus == callStatus &&
      other.callTranfer == callTranfer &&
      listEquals(other.callTransferIds, callTransferIds) &&
      other.department == department &&
      other.isNewLeadCall == isNewLeadCall &&
      other.baseID == baseID &&
      other.isSmsSent == isSmsSent &&
      other.callDateTime == callDateTime &&
      other.advertisedNumber == advertisedNumber &&
      other.callDirection == callDirection &&
      other.endStamp == endStamp &&
      other.duration == duration &&
      other.source == source;
  }

  @override
  int get hashCode {
    return companyID.hashCode ^
      cuid.hashCode ^
      callerDid.hashCode ^
      callerNumber.hashCode ^
      agentDid.hashCode ^
      callStartStamp.hashCode ^
      recordingLink.hashCode ^
      agentid.hashCode ^
      callStatus.hashCode ^
      callTranfer.hashCode ^
      callTransferIds.hashCode ^
      department.hashCode ^
      isNewLeadCall.hashCode ^
      baseID.hashCode ^
      isSmsSent.hashCode ^
      callDateTime.hashCode ^
      advertisedNumber.hashCode ^
      callDirection.hashCode ^
      endStamp.hashCode ^
      duration.hashCode ^
      source.hashCode;
  }
}

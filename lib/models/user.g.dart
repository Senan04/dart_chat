// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  userID: json['userID'] as String,
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  profilePicURL: json['profilePicURL'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'userID': instance.userID,
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'profilePicURL': instance.profilePicURL,
};

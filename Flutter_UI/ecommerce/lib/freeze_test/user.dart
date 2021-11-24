import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'job.dart';

part 'user.freezed.dart';
// part 'user.g.dart';

@freezed
class User with _$User {
  // const User._();

  const factory User(
      {required String name, int? age, required List<Job> jobs}) = _User;

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

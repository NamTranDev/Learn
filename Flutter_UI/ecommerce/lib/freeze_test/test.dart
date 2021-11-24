import 'package:ecommerce/freeze_test/job.dart';
import 'package:ecommerce/freeze_test/user.dart';

void main() {
  const userA = User(name: "User A", jobs: [Job(level: 3)]);
  const userB = User(name: "User B", age: 1, jobs: [Job(level: 3)]);

  print(userA == userB);

  final userAcopy = userA.copyWith(name: "User B");
  final userBcopy = userA.copyWith(age: null);

  print(userAcopy == userBcopy);
}

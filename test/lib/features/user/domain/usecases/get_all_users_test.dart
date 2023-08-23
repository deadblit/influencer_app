import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/core/usecases/usecase.dart';
import 'package:influencer_app/features/user/domain/entities/user.dart';
import 'package:influencer_app/features/user/domain/entities/user_type.dart';
import 'package:influencer_app/features/user/domain/repositories/user_repository.dart';
import 'package:influencer_app/features/user/domain/usecases/get_all_users.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late final GetAllUsers usecase;
  late final MockUserRepository mockUserRepository;
  late final List<User> users;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetAllUsers(mockUserRepository);
    users = [
      User(
        id: "id",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        emailVerified: false,
        username: "username",
        email: "email",
        type: UserType.user,
      ),
    ];
  });

  test('should get all users', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(() => mockUserRepository.getAll())
        .thenAnswer((_) async => Result.success(users));

    //Act - Call the function that is to be tested
    final result = await usecase(NoParams());

    //Assert - Compare the actual result and expected result
    expect(result, Result.success(users));
    verify(() => mockUserRepository.getAll()).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}

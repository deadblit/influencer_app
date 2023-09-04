import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/core/usecases/usecase.dart';
import 'package:influencer_app/features/task/domain/entities/task.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/domain/repositories/task_repository.dart';
import 'package:influencer_app/features/task/domain/use_cases/get_all_tasks.dart';
import 'package:influencer_app/features/user/domain/entities/user.dart';
import 'package:influencer_app/features/user/domain/entities/user_type.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late final GetAllTasks usecase;
  late final MockTaskRepository mockTaskRepository;
  late final User user;
  late final List<Task> tasks;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetAllTasks(mockTaskRepository);
    user = User(
      id: "id",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      emailVerified: false,
      username: "username",
      email: "email",
      type: UserType.user,
    );
    tasks = [
      Task(
        id: "id",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        owner: user,
        assignee: user,
        related: null,
        state: TaskState.created,
        doneAt: null,
        title: "task title",
        description: null,
      ),
    ];
  });

  test('should get all tasks', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(() => mockTaskRepository.getAll())
        .thenAnswer((_) async => Result.success(tasks));

    //Act - Call the function that is to be tested
    final result = await usecase(NoParams());

    //Assert - Compare the actual result and expected result
    expect(result, Result.success(tasks));
    verify(() => mockTaskRepository.getAll()).called(1);
    verifyNoMoreInteractions(mockTaskRepository);
  });
}

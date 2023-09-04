import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/core/failure/failure.dart';
import 'package:influencer_app/core/failure/server_failure.dart';
import 'package:influencer_app/features/task/domain/entities/task.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/domain/repositories/task_repository.dart';
import 'package:influencer_app/features/task/domain/use_cases/create_task.dart';
import 'package:influencer_app/features/user/domain/entities/user.dart';
import 'package:influencer_app/features/user/domain/entities/user_type.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late CreateTask usecase;
  late MockTaskRepository mockTaskRepository;
  late User owner, assignee, related;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = CreateTask(mockTaskRepository);
    owner = User(
      id: "idowner",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      emailVerified: false,
      username: "owner",
      email: "emailowner",
      type: UserType.user,
    );
    assignee = User(
      id: "idassignee",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      emailVerified: false,
      username: "assignee",
      email: "emailassignee",
      type: UserType.user,
    );
    related = User(
      id: "idrelated",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      emailVerified: false,
      username: "related",
      email: "emailrelated",
      type: UserType.user,
    );
  });

  test('should create a task with success', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(() => mockTaskRepository.create(
          ownerId: any(named: "ownerId"),
          assigneeId: any(named: "assigneeId"),
          relatedId: any(named: "relatedId"),
          title: any(named: "title"),
          description: any(named: "description"),
        )).thenAnswer((_) async => const Result.success(unit));

    //Act - Call the function that is to be tested
    final result = await usecase(CreateTaskParams(
        ownerId: "idowner",
        assigneeId: "idassignee",
        relatedId: "idrelated",
        title: "task title",
        description: "task description"));

    //Assert - Compare the actual result and expected result
    expect(result, const Result.success(unit));
    verify(() => mockTaskRepository.create(
          ownerId: any(named: "ownerId"),
          assigneeId: any(named: "assigneeId"),
          relatedId: any(named: "relatedId"),
          title: any(named: "title"),
          description: any(named: "description"),
        )).called(1);
    verifyNoMoreInteractions(mockTaskRepository);
  });

  test('should fail while creating a task', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(() => mockTaskRepository.create(
              ownerId: any(named: "ownerId"),
              assigneeId: any(named: "assigneeId"),
              relatedId: any(named: "relatedId"),
              title: any(named: "title"),
              description: any(named: "description"),
            ))
        .thenAnswer((_) async => Result.error(ServerFailure("error message")));

    //Act - Call the function that is to be tested
    final result = await usecase(CreateTaskParams(
        ownerId: "idowner",
        assigneeId: "idassignee",
        relatedId: "idrelated",
        title: "task title",
        description: "task description"));

    //Assert - Compare the actual result and expected result
    expect(result, Result.error(ServerFailure("error message")));
    verify(() => mockTaskRepository.create(
          ownerId: any(named: "ownerId"),
          assigneeId: any(named: "assigneeId"),
          relatedId: any(named: "relatedId"),
          title: any(named: "title"),
          description: any(named: "description"),
        )).called(1);
    verifyNoMoreInteractions(mockTaskRepository);
  });
}

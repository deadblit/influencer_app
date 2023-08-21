import '../../features/task/domain/entities/task.dart';
import '../../features/task/domain/entities/task_state.dart';
import '../../features/user/domain/entities/user.dart';
import '../../features/user/domain/entities/user_role.dart';

final _dt = DateTime.now();

final users = <User>[
  User(
    id: 1,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Rafael Winter",
    email: "rafael@spacerock.dev",
    password: "swordfish",
    role: UserRole.admin,
  ),
  User(
    id: 2,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Hélio Gurgel",
    email: "helio@alohainfluencer.com.br",
    password: "swordfish",
    role: UserRole.admin,
  ),
  User(
    id: 3,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Wesley Safadão",
    email: "wesley@alohainfluencer.com.br",
    password: "swordfish",
    role: UserRole.influencer,
  ),
  User(
    id: 4,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Maria Beltrão",
    email: "maria@alohainfluencer.com.br",
    password: "swordfish",
    role: UserRole.user,
  ),
  User(
    id: 5,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Fátima Bernardes",
    email: "fatima@alohainfluencer.com.br",
    password: "swordfish",
    role: UserRole.user,
  ),
  User(
    id: 6,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Felipe Ret",
    email: "felipe@alohainfluencer.com.br",
    password: "influencer",
    role: UserRole.influencer,
  ),
  User(
    id: 7,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Clara Moneke",
    email: "clara@alohainfluencer.com.br",
    password: "influencer",
    role: UserRole.influencer,
  ),
  User(
    id: 8,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Pedro Sampaio",
    email: "pedro@alohainfluencer.com.br",
    password: "influencer",
    role: UserRole.influencer,
  ),
  User(
    id: 9,
    createdAt: _dt,
    updatedAt: _dt,
    name: "MC Melody",
    email: "melody@alohainfluencer.com.br",
    password: "influencer",
    role: UserRole.influencer,
  ),
  User(
    id: 10,
    createdAt: _dt,
    updatedAt: _dt,
    name: "Gaby Cavallin",
    email: "gaby@alohainfluencer.com.br",
    password: "influencer",
    role: UserRole.influencer,
  ),
];

final tasks = <Task>[
  Task(
    id: 1,
    createdAt: _dt,
    updatedAt: _dt,
    owner: users[1],
    assignee: users[0],
    related: users[5],
    state: TaskState.created,
    title: "comprar roupas pra ensaio",
  ),
  Task(
    id: 2,
    createdAt: _dt,
    updatedAt: _dt,
    owner: users[1],
    assignee: users[0],
    related: users[7],
    state: TaskState.inProgress,
    title: "alugar espaço para festa",
  )
];

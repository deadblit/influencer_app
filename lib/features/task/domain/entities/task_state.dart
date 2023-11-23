import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TaskState {
  created('created', 'Nova'),
  toDo('toDo', 'A fazer'),
  inProgress('inProgress', 'Em progresso'),
  done('done', 'Finalizada'),
  cancelled('cancelled', 'Cancelada');

  const TaskState(this.value, this.description);
  final String value;
  final String description;

  static TaskState fromValue(String value) =>
      TaskState.values.firstWhere((element) => element.value == value);
}

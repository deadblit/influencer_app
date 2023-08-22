import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TaskState {
  created('created'),
  toDo('toDo'),
  inProgress('inProgress'),
  done('done'),
  cancelled('cancelled');

  const TaskState(this.value);
  final String value;

  static TaskState fromValue(String value) =>
      TaskState.values.firstWhere((element) => element.value == value);
}

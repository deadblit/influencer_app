import 'package:multiple_result/multiple_result.dart';

abstract class IRepository<T> {
  Future<Result<T, Exception>> create(T model);
  Future<Result<List<T>, Exception>> getAll();
  Future<Result<T?, Exception>> get(int id);
  Future<Result<T?, Exception>> update(T model);
  Future<Result<T?, Exception>> delete(int id);
}

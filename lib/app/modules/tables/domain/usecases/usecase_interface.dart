abstract class DataUseCase<T> {
  Future<List<T>> getData();
  Future<void> saveData(List<T> data);
}

import '../model/store.dart';
import '../repository/store_repository.dart';

class LocalState {
  final StoreRepository repository;
  final key = 'localState';

  LocalState(this.repository);

  Store read() {
    return repository.read(key);
  }

  void write(Store values) {
    repository.write(key, values);
  }
}

import '../../route_guard.dart';
import '../local_state.dart';

class LoginGuard extends RouteGuard {
  final LocalState localState;

  LoginGuard(this.localState);

  @override
  void hook() {
    print('login onInit');
    var store = localState.read();
    
    if (store.jwt.isNotEmpty) {
      print('jwt stored. value: ${store.jwt}');

      // TODO トークンリフレッシュ
      // await context.read<LoginNavigator>().next(context, '自動ログインしました');
    }
  }
}

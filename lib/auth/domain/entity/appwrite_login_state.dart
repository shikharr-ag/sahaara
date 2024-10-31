import 'package:copy_with_extension/copy_with_extension.dart';

part 'appwrite_login_state.g.dart';

@CopyWith()
class AppwriteLoginState {
  bool isSigningIn;
  String email;
  String password;
  String? errorMessage;
  AppwriteLoginState({
    required this.isSigningIn,
    this.errorMessage,
    required this.password,
    required this.email,
  });
}

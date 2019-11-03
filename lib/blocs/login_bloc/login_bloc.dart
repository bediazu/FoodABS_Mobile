import 'dart:async';

class LoginBloc {

  StreamController<String> _emailStreamController = StreamController<String>.broadcast();
  StreamController<String> _passwordStreamController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailStreamController.stream;
  Stream<String> get passwordStream => _passwordStreamController.stream;

  Function (String) get addEmail => _emailStreamController.sink.add;
  Function (String) get addPassword => _emailStreamController.sink.add;

  void dispose()
  {
    _emailStreamController.close();
    _passwordStreamController.close();
  }

  var  emailController;
  var passwordController;


}
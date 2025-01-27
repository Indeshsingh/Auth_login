import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  AuthBloc()
      : _firebaseAuth = FirebaseAuth.instance,
        super(const AuthState()) {
    on<AuthSignupEvent>((event, emit) async {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(state.copyWith(
          email: event.email,
          password: event.password,
          isAuthenticated: true,
          errormessage: "",
        ));
      } catch (e) {
        emit(state.copyWith(errormessage: e.toString()));
      }
    });
    on<AuthLoginEvent>((event, emit) async {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(state.copyWith(
          isAuthenticated: true,
          errormessage: "",
        ));
      } catch (e) {
        emit(state.copyWith(errormessage: e.toString()));
      }
    });

    on<AuthLogoutEvent>((event, emit) async {
      await _firebaseAuth.signOut();
      emit(state.copyWith(
        isAuthenticated: false,
        email: "",
        password: "",
      ));
    });
  }
}

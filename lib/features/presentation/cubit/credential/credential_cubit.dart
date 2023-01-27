import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/sign_in_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/sign_up_user_usecase.dart';



part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUserUsecase signInUserUsecase;
  final SignUpUserUsecase signUpUserUsecase;

  CredentialCubit(
      {required this.signUpUserUsecase,
        required this.signInUserUsecase})
      : super(CredentialInitial());

  Future<void> signInUser({required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await signInUserUsecase.call(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on SocketException catch(_){
      emit(CredentialFailure());
    } catch(_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUserUsecase.call(user);
      emit(CredentialSuccess());
    } on SocketException catch(_){
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}

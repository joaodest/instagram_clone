 import 'dart:io';

import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';

abstract class FirebaseRemoteDataSource{
  //Credenciais
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();

  //User
  Stream<List<UserEntity>> getUsers(UserEntity user);
  Stream<List<UserEntity>> getSingleUser(String uid);
  Future<String> getCurrentUid();
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);

  //Cloud Storage
  Future<String> uploadImageToStorage(File? file, bool isPost, String childName);
}
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class SignInUserUsecase {

  final FirebaseRepository repository;

  SignInUserUsecase({required this.repository});

  Future<void> call(UserEntity userEntity){
    return repository.signInUser(userEntity);
  }

}
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class SignUpUserUsecase {

  final FirebaseRepository repository;

  SignUpUserUsecase({required this.repository});

  Future<void> call(UserEntity userEntity){
    return repository.signUpUser(userEntity);
  }

}
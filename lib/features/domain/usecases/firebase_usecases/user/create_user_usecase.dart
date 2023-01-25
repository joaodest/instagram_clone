
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class CreateUserUsecase {

  final FirebaseRepository repository;

  CreateUserUsecase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.createUser(user);
  }

}
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class UpdateUserUsecase {

  final FirebaseRepository repository;

  UpdateUserUsecase({required this.repository});

  Future<void> call(UserEntity userEntity){
    return repository.updateUser(userEntity);
  }

}
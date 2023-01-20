import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class GetUsersUsecase {

  final FirebaseRepository repository;

  GetUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity userEntity){
    return repository.getUsers(userEntity);
  }

}
import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class GetSingleUserUsecase {

  final FirebaseRepository repository;

  GetSingleUserUsecase({required this.repository});

  Stream<List<UserEntity>> call(String uid){
    return repository.getSingleUser(uid);
  }

}
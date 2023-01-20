import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class GetCurrentUidUsecase {

  final FirebaseRepository repository;

  GetCurrentUidUsecase({required this.repository});

  Future<String> call(){
    return repository.getCurrentUid();
  }

}
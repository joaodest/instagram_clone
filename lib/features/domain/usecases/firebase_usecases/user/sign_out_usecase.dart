import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class SignOutUserUsecase {

  final FirebaseRepository repository;

  SignOutUserUsecase({required this.repository});

  Future<void> call(){
    return repository.signOut();
  }

}
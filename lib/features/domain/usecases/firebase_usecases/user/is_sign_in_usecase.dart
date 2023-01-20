import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_class.dart';

class IsSignInUsecase {

  final FirebaseRepository repository;

  IsSignInUsecase({required this.repository});

  Future<bool> call(){
    return repository.isSignIn();
  }

}
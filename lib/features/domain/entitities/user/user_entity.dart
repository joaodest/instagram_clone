import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? uid;
  final String? username;
  final String? name;
  final String? bio;
  final String? website;
  final String? profileUrl;
  final List followers;
  final List? following;
  final num? totalFollowers;
  final num? totalFollowing;

  //Não sera salvo no banco de dados
  final String? password;
  final String? otherUid;

  UserEntity(
      this.uid,
      this.username,
      this.name,
      this.bio,
      this.website,
      this.profileUrl,
      this.followers,
      this.following,
      this.totalFollowers,
      this.totalFollowing,
      this.password,
      this.otherUid,
      );

  @override
  List<Object?> get props => [
    uid,
    username,
    name,
    bio,
    website,
    profileUrl,
    followers,
    following,
    totalFollowers,
    totalFollowing,
    password,
    otherUid,
  ];
}

import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? uid;
  final String? username;
  final String? name;
  final String? bio;
  final String? website;
  final String? email;
  final String? profileUrl;
  final List? followers;
  final List? following;
  final num? totalFollowers;
  final num? totalFollowing;
  final num? totalPosts;

  //Não sera salvo no banco de dados
  final File? imageFile;
  final String? password;
  final String? otherUid;

  UserEntity({
    this.imageFile,
    this.uid,
    this.username,
    this.name,
    this.bio,
    this.email,
    this.website,
    this.profileUrl,
    this.followers,
    this.following,
    this.totalFollowers,
    this.totalFollowing,
    this.totalPosts,
    this.password,
    this.otherUid,
  });

  @override
  List<Object?> get props => [
    imageFile,
    uid,
    username,
    name,
    bio,
    website,
    email,
    profileUrl,
    followers,
    following,
    totalFollowers,
    totalFollowing,
    totalPosts,
    password,
    otherUid,
  ];
}

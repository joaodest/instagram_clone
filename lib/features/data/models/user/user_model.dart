import 'package:instagram_clone/features/domain/entitities/user/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
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

  UserModel({
    this.uid,
    this.username,
    this.name,
    this.bio,
    this.website,
    this.email,
    this.profileUrl,
    this.followers,
    this.following,
    this.totalFollowers,
    this.totalFollowing,
    final num? totalPosts,
  }) : super(
      uid: uid,
      username: username,
      name: name,
      bio: bio,
      website: website,
      email: email,
      profileUrl: profileUrl,
      followers: followers,
      following: following,
      totalFollowers: totalFollowers,
      totalFollowing: totalFollowing,
      totalPosts: totalPosts
  );

  factory UserModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      bio: snapshot['bio'],
      username: snapshot['username'],
      totalFollowers: snapshot['totalFollowers'],
      totalFollowing: snapshot['totalFollowing'],
      totalPosts: snapshot['totalPosts'],
      uid: snapshot['uid'],
      website: snapshot['website'],
      profileUrl: snapshot['profileUrl'],
      followers: List.from(snap.get("followes")),
      following: List.from(snap.get("following")),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "uid": uid,
        "email": email,
        "name": name,
        "bio": bio,
        "username": username,
        "totalFollowers": totalFollowers,
        "totalFollowing": totalFollowing,
        "totalPosts": totalPosts,
        "website": website,
        "profileUrl": profileUrl,
        "followers": followers,
        "following": following,
      };
}

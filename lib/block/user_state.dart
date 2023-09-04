import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserState extends Equatable{


}


class UserInit extends UserState{
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class UserLoading extends UserState{

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class UserDataLoaded extends UserState{

  List<UserModel> userModelList;
  UserDataLoaded(this.userModelList);

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList];


}

class UserErrors extends UserState{

  String message;
  UserErrors(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];


}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/block/user_event.dart';
import 'package:flutter_block/block/user_state.dart';
import 'package:flutter_block/model/user_model.dart';
import 'package:flutter_block/service/api_service.dart';

class UserBlock extends Bloc<UserEvent,UserState>{

  UserBlock():super(UserInit()) {

    List<UserModel> userModelList=[];
    ApiService apiService= ApiService();

    on<GetAllUserList>((event,emit) async {

          try{
            emit(UserLoading());
            userModelList=await apiService.getListData();
            emit(UserDataLoaded(userModelList));
          } catch(e){
            emit(UserErrors(e.toString()));
          }


    });

  }

}
import 'package:dio/dio.dart';
import 'package:flutter_block/model/user_model.dart';

class ApiService{
  Future<List<UserModel>> getListData()async{
    List<UserModel> userDataList=[];

    Dio dio=new Dio();

    try{
      
      Response response=await dio.get("https://jsonplaceholder.typicode.com/users");
      if(response.statusCode==200){

        List<dynamic> data=response.data;

        data.forEach((element) {
          UserModel userModel= UserModel.fromJson(element);
          userDataList.add(userModel);

        });

        return userDataList;



      }else{
        return [];
      }

    }
    catch(e){
      rethrow;

    }



  }

}
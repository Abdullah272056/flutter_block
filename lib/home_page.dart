



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/block/user_event.dart';

import 'block/user_block.dart';
import 'block/user_state.dart';
import 'model/user_model.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    context.read<UserBlock>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:BlocBuilder<UserBlock,UserState>(
        builder: (context,state){
          if (state is UserLoading) {
          return  Center(
              child: CircularProgressIndicator(),
            );

          }

          if (state is UserLoading) {
            return  Center(
              child: CircularProgressIndicator(),
            );

          }

          if (state is UserErrors) {
            return  Center(
              child: Text(
                state.message
              ),
            );

          }

          if (state is UserErrors) {
            return  Center(
              child: Text(
                  state.message
              ),
            );

          }

          if (state is UserDataLoaded) {
            return  bodyDesign(context, state.userModelList);

          }

          return Container();
        }
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  Widget bodyDesign(BuildContext context,List<UserModel> userDataList){
    return ListView.builder(

        itemBuilder: (context,itemIndex){

      UserModel userModel =userDataList[itemIndex];
      return ListTile(
        title: Text(userModel.name.toString(),),
        subtitle: Text(userModel.email.toString(),),
        leading: Text(userModel.id.toString(),),
      );


    },
      itemCount:userDataList.length ,

    );

  }
}

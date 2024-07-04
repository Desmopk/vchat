import 'package:flutter/material.dart';
import 'package:vchat/auth/auth_service.dart';
import 'package:vchat/chat/chat_service.dart';

import '../component/user_tile.dart';
import 'chat_page.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  void logout()
  {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Site Of Grace"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: _buildUserList(),
    );
  }

   Widget _buildUserList()
   {
     return StreamBuilder(stream: _chatService.getUsersStream(), builder: (context,snapshot){
       if(snapshot.hasError){
         return Text("Error");
       }
       if(snapshot.connectionState == ConnectionState.waiting){
         return Text("Fetching..");
       }
       return ListView(
         children: snapshot.data!.map<Widget>((userdata) => _buildUserListItem(userdata,context)).toList(),
       );
     });
   }
   Widget _buildUserListItem(
       Map<String,dynamic> userData , BuildContext context){
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(text: userData["email"],
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(receiverEmail: userData["email"],)));
        },
      );

    }
    else{
      return Container();
    }


   }














}



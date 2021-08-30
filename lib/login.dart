import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String username='',password='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  Stack(
          alignment: AlignmentDirectional.center,
            children: <Widget>[
            Image.asset(
              "assets/images/FitMe.jpg",
              height:double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
           Container(
             child: ListView(
               children: [
                 Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 200,
               width: 120,
               child: ListView(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Enter username"),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       decoration: InputDecoration(
                         hintText: "Username"
                       ),
                       keyboardType: TextInputType.name,
                       onChanged: (String value){
                         try{
                           username=value;
                         }catch(exception){
                           username='';
                         }
                       },
                     ),
                   )
                 ],
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height:200,
               width:120,
               child: ListView(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Enter password"),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       
                       obscureText: true,
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                         hintText: 'password'
                       ),
                       onChanged: (String value){
                         try{
                           password=value;
                         }catch(exception){
                           password.contains(' ');
                         }
                       },
                     ),
                   ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 300,
                      
                        child: Scaffold(
                          
                          body: Builder(builder: (context)=>ElevatedButton(
                            onPressed:(){
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                 backgroundColor: Colors.redAccent,
                                 content: Text("Login Successful"))
                               ) ;
                            } ,
                            child: Text("Login")
                          )),
                        ),
                      
                    ),
                  )
                     ,
                   
               ],
             ),
           )
               ),]
             ),
           )
            ]
            ),
      ),
    );
  }
}
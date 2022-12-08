import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nom = '';
  String phone = '';
  String password = '';

  final formkey = GlobalKey<FormState>() ;

  validation(){

  if(formkey.currentState!.validate()){
    formkey.currentState!.save();

    debugPrint('$nom') ;
    debugPrint('$phone') ;
    debugPrint('$password') ;

    formkey.currentState!.reset() ;
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon application'),
        backgroundColor: Colors.amberAccent,
        actions: [
          Icon(
            Icons.account_balance_wallet_rounded,
            size: 20,
            color: Colors.yellowAccent,
          )
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nom',
                    hintText: 'Entrer votre nom',
                    icon: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.blueAccent,
                    )),
                validator: (val) => val?.length == 0 ? 'Enter votre nom' : null,
                onSaved: (val) => nom = val!,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Telephone',
                    hintText: 'Entrer votre numero',
                    icon: Icon(
                      Icons.phone_rounded,
                      size: 20,
                      color: Colors.blueAccent,
                    )),
                validator: (val) =>
                    val?.length == 0 ? 'Enter votre numero' : null,
                onSaved: (val) => phone = val!,
                keyboardType: TextInputType.number,

              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    hintText: 'Entrer votre mot de passe',
                    icon: Icon(
                      Icons.key_sharp,
                      size: 20,
                      color: Colors.blueAccent,
                    )),
                validator: (val) =>
                    val?.length == 0 ? 'Enter votre mot de passe' : null,
                onSaved: (val) => password = val!,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),

              SizedBox(height: 20,),
        
              ElevatedButton(
                onPressed: validation,
                 child: const Text('S\'inscrire' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold)
                 ,))
            ],
          ),
        ),
      )),
    );
  }
}

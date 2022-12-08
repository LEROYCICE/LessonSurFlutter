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

        primarySwatch: Colors.blueGrey
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

  late List<Geo> geos ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geos = Geo.getgeo();
  }

Widget tableau(){
  return DataTable(
    columns: [
      DataColumn(label: Text('Pays' , style: TextStyle(color: Colors.blueAccent),)),
      DataColumn(label: Text('Capitale' , style: TextStyle(color: Colors.blueAccent),)),
      DataColumn(label: Text('Continent' ,style: TextStyle(color: Colors.blueAccent),)),
      ],
     rows: geos.map( (geo) => DataRow(
      cells: [
        DataCell(Text(geo.pays),) ,
        DataCell(Text(geo.capitale),) ,
        DataCell(Text(geo.continent),) ,
      ] ) ,
      ).toList() ,
      );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon application'),
        backgroundColor: Colors.amberAccent,
        actions: [
          Icon(Icons.account_balance_wallet_rounded ,
          size: 20,color: Colors.yellowAccent,)
        ],
        ), 

      body: Center(
        child:SingleChildScrollView(
          child: Column(
            children: [
        
              tableau(),
        
            ],
          ),
        ) ),
    );
  }
}


class Geo {
  String pays ;
  String capitale ;
  String continent ;

  Geo({ required this.pays , required this.capitale , required this.continent }) ;

  static List<Geo> getgeo() {
    return <Geo> [
      Geo(pays : 'Togo' , capitale: 'Lome' , continent: 'Afrique') ,
      Geo(pays : 'Benin' , capitale: 'Porto-Novo' , continent: 'Afrique') ,
      Geo(pays : 'Belgique' , capitale: 'Belgique' , continent: 'Europe') ,
      Geo(pays : 'Coree' , capitale: 'Coree du sud' , continent: 'Asie') ,
      Geo(pays : 'Canada' , capitale: 'Ottawa' , continent: 'Amerique') ,
      Geo(pays : 'USA' , capitale: 'Washington' , continent: 'Amerique') ,
      Geo(pays : 'Australie' , capitale: 'Australie' , continent: 'Oceanie') ,
      Geo(pays : 'Dubai' , capitale: 'Dubai' , continent: 'Asie') ,
      Geo(pays : 'Cameroon' , capitale: 'Yaounde' , continent: 'Afrique') ,
      Geo(pays : 'Senegal' , capitale: 'Dakar' , continent: 'Afrique') ,
      Geo(pays : 'Cote d\'ivoire' , capitale: 'Yamoussokro' , continent: 'Afrique') ,
      Geo(pays : 'Tanzanie' , capitale: 'Tanzanie' , continent: 'Afrique') ,
    ] ;}
  
}


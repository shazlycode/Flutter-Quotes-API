import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quotes/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>with QuoteApiService {



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:   Text('Quotes'.toUpperCase()),),
      body: Padding(padding: EdgeInsets.all(10),child: FutureBuilder(future: fetchAndSetQuotes(),builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child:SpinKitDoubleBounce(color: Colors.amber),);
        }return ListView.builder(itemCount: quotes.length,itemBuilder: (context, index){
          return Card(elevation: 5,child: ListTile(title: Text(quotes[index].quote!),subtitle: Text('Author: ${quotes[index].author!}'),),);
        });
      }),),
    );
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
class Quote{
  final int? id;
  final String? quote;
  final String? author;

  Quote({this.id, this.quote, this.author});
}


class QuoteApiService{
  List<Quote> _quotes=[];
  List<Quote> get quotes=>_quotes;


  Future fetchAndSetQuotes()async{
  var url= Uri.parse('https://dummyjson.com/quotes');
  try{
    final response= await http.get(url);
    if(response.statusCode==200){
      final data= jsonDecode(response.body)['quotes'];
      List<Quote> fetched=[];
      for(int i=0;i<data.length; i++){
        fetched.add(Quote(id: data[i]['id'],quote: data[i]['quote'],author: data[i]['author']));
      }
      _quotes=fetched;
      print(_quotes.length);
    }else{
      print(response.statusCode);
    }

  }catch(err){
    rethrow;
  }
  }
}
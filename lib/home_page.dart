import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_servece.dart';
import 'ecommerce_model.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> futureModels;
  @override
  void initState() {

    super.initState();
    futureModels=ApiService().getAllproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("E-commerce"),
      ),
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: futureModels,
          builder: (context,snapshot){
      if(snapshot.hasData){
        final books=snapshot.data!;
        return ListView.builder(
    itemCount: books.length,
    itemBuilder: (context,index){
      final book=books[index];
      return
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Image.network(book.image!,height: 200,
                      width: 200,),

                      Expanded(
                          flex: 2,
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: Text(book.description.toString(),maxLines: 3,overflow:TextOverflow.ellipsis,)),
                      ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("Id : ${book.id.toString()}",style: TextStyle(color: Colors.purple,fontSize: 30),)),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Text("Title : ",style: TextStyle(color: Colors.purple,fontSize: 20),),
                              Expanded(child: Text("${book.title.toString()}",style: TextStyle(color: Colors.orange),)),
                            ],
                          ),),
                    ],
                  ),




                ],
              ),
            ),
          );
        // ListTile(
    //     leading: Image.network(book.image!),
    //   title: Text(book.title.toString()),
    // subtitle: Text(book.id.toString()),
    //   );
    });
    }
      else if(snapshot.hasError){
        return Text(snapshot.error.toString());

    }else{
        return CircularProgressIndicator();
    }
    
          },
        ),
      ),
    );
  }
}


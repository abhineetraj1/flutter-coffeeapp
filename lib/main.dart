import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
int bill=0;
var t = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod";
var y =[];
var coffee_list=[
  [1,"Espresso",10,t],
  [2,"Cold Brew",10,t],
  [3,"Drip Coffee",10,t],
  [4,"Pour Over",11,t],
  [5,"Mocha",11,t],
  [6,"Latte",11,t],
  [7,"Cappuccino",12,t],
  [8,"Americano",12,t],
];

FuncBill() {
  int a =0;
  for (List x in coffee_list) {
    for (int z in y) {
      if (x[0] == z) {
        a += int.parse(x[2].toString());
      }
    }
  }
  bill=a;
  return a;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {
  var coffee_s = TextEditingController();
  Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/wall.jpg"), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DEJA BREW", style: TextStyle(fontSize: 30, fontFamily: "Comic Sans" ,fontWeight: FontWeight.bold),),
                      IconButton(onPressed: () {
                        (y.length == 0) ? AlertBox(context) : Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return Cart();
                        }));
                      },icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30,))
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: coffee_s,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(onPressed: () {
                        print(coffee_s.text);
                      }, icon: Icon(Icons.search)),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Search for coffee",
                      labelText: "Coffee name",
                      focusColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 360,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (List i in coffee_list) Padding(
                          padding: const EdgeInsets.all(12),
                          child: CoffeeWid(i[0], i[1], i[2], i[3]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.centerLeft,child: Text("Today's recommendation", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20, blurStyle: BlurStyle.outer)]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.asset("assets/coffee.png", width: MediaQuery.sizeOf(context).width*0.3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width*0.46,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(coffee_list[1][1].toString(), style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                        Text(coffee_list[1][2].toString()+" USD", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    Text(coffee_list[1][3].toString(), style: TextStyle(fontSize: 17),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeWid extends StatefulWidget {
  final int idx;
  final String name;
  final int price;
  final String description;
  const CoffeeWid(this.idx, this.name,this.price,this.description);

  @override
  State<CoffeeWid> createState() => _CoffeeWidState();
}

class _CoffeeWidState extends State<CoffeeWid> {
  @override
  Widget build(BuildContext context) {
    var added = !y.contains(widget.idx);
    return Container(
      width: MediaQuery.sizeOf(context).width*0.70,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20, blurStyle: BlurStyle.outer),],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
            Image.asset("assets/coffee.png", width: MediaQuery.sizeOf(context).width*0.6,),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),color: Colors.grey.shade200.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.name, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text(widget.price.toString()+" USD", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Text(widget.description, style: TextStyle(fontSize: 17),),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*0.25,
                      child: ElevatedButton(
                        onPressed: () {
                          if (added == true) {
                            y.add(widget.idx);
                            print(y);
                          } else {
                            y.remove(widget.idx);
                            print(y);
                          }
                          setState(() {
                            added = !added;
                          });
                        },
                        child: Center(
                          child: Row(
                            children: [
                              Icon((added == true) ? Icons.add : Icons.check),
                              Text((added == true) ? "Add":"Added")
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

AlertBox(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Cart is empty"),
    backgroundColor: Colors.grey.shade200.withOpacity(0.7),
    actions: [
      TextButton(onPressed: () {
        Navigator.of(context).pop();
      }, child: Text("Ok", style: TextStyle(color: Colors.black),))
    ],
  );
  return showDialog(context: context, builder: (context) {
    return alert;
  });
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Index();
          }));
        }, child: Icon(Icons.arrow_back), backgroundColor: Colors.black,),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/wall.jpg"), fit: BoxFit.fill)
          ),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Billing", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                for (int i in y) Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.8,
                          child: Column(
                            children: [
                              Align(alignment: Alignment.centerLeft,child: Text(coffee_list[i-1][1].toString(), style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              Text(coffee_list[i-1][3].toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(coffee_list[i-1][2].toString()+" USD", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                      Text(FuncBill().toString()+" USD", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                      ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Checkout"), style: ElevatedButton.styleFrom(backgroundColor: Colors.black),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
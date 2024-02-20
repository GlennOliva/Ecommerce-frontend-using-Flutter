import 'package:flutter/material.dart';
import 'package:flutter_prac2/week6task/Itemslist.dart';

import 'Items.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key});
  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  ItemList items = ItemList();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController soldController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // ignore: non_constant_identifier_names
  ShowAddDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Input item title',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Input item price',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                  hintText: 'Input Image path',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: soldController,
                decoration: const InputDecoration(
                  hintText: 'Input item Sold',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  hintText: 'Input Location',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: rateController,
                decoration: const InputDecoration(
                  hintText: 'Input item rate',
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  addItem();
                },
                child: const Text('Save Item'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel Item'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  addItem(){
    Items newItem = Items(
      image: imageController.text,
     title: titleController.text,
      sold: soldController.text,
       location: locationController.text,
        price: priceController.text,
         rate: int.parse(rateController.text),
          liked: false);

          setState(() {
            items.itemList.add(newItem);
            Navigator.pop(context);
            titleController.clear();
            priceController.clear();
            soldController.clear();
            rateController.clear();
            imageController.clear();
            locationController.clear();
          });
  }
 Widget listTile(Items item) => ListTile(
  leading: Image.asset(item.image),
  title: Text(item.title),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Price: ${item.price}'),
      Text('Sold: ${item.sold}'),
      Text('Rate: ${item.rate}'),
      Text('Location: ${item.location}'),
    ],
  ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Of Items'),
        actions: [
          IconButton(onPressed: () {
            ShowAddDialog(context);
          },
           icon: const Icon(Icons.add),)
        ],
      ),
      body: Center(
        child: ListView(
           children: items.itemList.map((item){return listTile(item);}).toList(),
        )
      ),
    );
  }
}
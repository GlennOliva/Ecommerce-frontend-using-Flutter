import 'package:flutter/material.dart';

import '../Items.dart';
import '../Itemslist.dart';
import 'Locations.dart';
import 'Sold.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.item});
  final Items item;
  @override
  State<Product> createState() => _ProductState();
}
  ItemList items = ItemList();
   TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController soldController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController locationController = TextEditingController();




class _ProductState extends State<Product> {

  





   // ignore: non_constant_identifier_names
   Widget ListCard(Items item) => Card(
    child: InkWell(
    onTap: () {
   
    },
  child: Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            item.image,
            width: 500,
            fit: BoxFit.contain, // Ensure the image covers the available space
          ),
        ),
        const SizedBox(height: 10),
        Text(
          item.title,
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          '₱${item.price}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ratingSold(item),
        location(item),
      ],
    ),
  ),
));

Widget buttonLike(Items item) => TextButton.icon(
  onPressed: () {
    setState(() {
       item.liked = (item.liked ? false : true);
    });
   
  },
  icon: Icon(
    Icons.thumb_up_sharp,
    color: item.liked ? Colors.blue : Colors.grey,
  ),
  label: Text(
    'LIKE',
    style: TextStyle(
      color: item.liked ? Colors.blue : Colors.grey,
    ),
  ),
);





  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product View'),
        
      ),
     body: ListCard(widget.item),
    );
  }



  
}
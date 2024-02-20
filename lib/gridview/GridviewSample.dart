import 'package:flutter/material.dart';
import 'package:flutter_prac2/week6task/gridview/Buttons.dart';
import 'package:flutter_prac2/week6task/gridview/Locations.dart';
import 'package:flutter_prac2/week6task/gridview/Product.dart';
import 'package:flutter_prac2/week6task/gridview/Sold.dart';
import '../Items.dart';
import '../Itemslist.dart';



class GridViewSample extends StatefulWidget {
  const GridViewSample({super.key});

  @override
  State<GridViewSample> createState() => _GridViewSampleState();
}

class _GridViewSampleState extends State<GridViewSample> {
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

  // ignore: non_constant_identifier_names
 Widget ListCard(Items item) => Card(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Product(item: item)),
      );
    },
    onLongPress: () {
      showDeleteConfirmationDialog(item);
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
              width: 200,
              fit: BoxFit.contain,
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
          buttons(item),
        ],
      ),
    ),
  ),
);



void showDeleteConfirmationDialog(Items item) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete Item'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              deleteItem(item);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}

void deleteItem(Items item) {
  setState(() {
    items.itemList.remove(item);
  });
}

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





  Widget buttonAddtocart(Items item) => TextButton.icon(
  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Product(item: item)),
  );
},

   icon: const Icon(
    Icons.remove_red_eye,
    color: Colors.grey,
   ),
    label: const Text(
      'VIEW',
      style: TextStyle(
        color: Colors.grey,
      ),
    ),
  );


 Widget buttons(Items item) => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buttonLike(item),
      buttonAddtocart(item),
    ],
  ),
);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Item List'),
        actions: [
          IconButton(
  onPressed: () {
    ShowAddDialog(context);
  },
  icon: const Icon(Icons.add),
),



        ],
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 360,),
         itemCount: items.itemList.length,
         itemBuilder: (BuildContext ctx , index) {
          return ListCard(items.itemList[index]);
         },
         ),
    );
  }
}
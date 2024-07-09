import 'package:flutter/material.dart';
import 'package:flutter_footwear_app/api.dart/api.dart';
import 'package:flutter_footwear_app/const/api_keys.dart';
import 'package:flutter_footwear_app/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ApiService apiService = ApiService(fullUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 62, 62, 63),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  35,
                ),
              )),
          child: const Column(
            children: [
              Text(
                "Timbu Shop",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Your number one shop,for all purchase....  ",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox.shrink(),
              //Placeholder(),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: apiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No data found');
          } else {
            // Access your data here
            final data = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 10,
                mainAxisSpacing: 4,
              ),
              itemCount: data.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data.items[index];
                final imageUrl = item.getFullImageUrl(apiService.baseUrl);
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: Image.network(
                                //  height: 30,
                                filterQuality: FilterQuality.high,
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            // height: 6,
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              //price
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    border: const Border()),
                                child: Text(
                                  item.currentPrice.first.currency.entries.first
                                          .key
                                          .toString() +
                                      item.currentPrice.first.currency.entries
                                          .first.value.first
                                          .toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              //description
                              Text(
                                item.description ?? "Emty description!",
                                style: const TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );

            // return ListView.builder(
            //   itemCount: data.items.length,
            //   itemBuilder: (context, index) {
            //     final item = data.items[index];
            //     final imageUrl = item.getFullImageUrl(apiService.baseUrl);
            //     //  print('{data.items.[index].photos.first.url.toString()}');
            //     return ListTile(
            //       leading: CircleAvatar(
            //           child: Image.network(
            //         imageUrl,
            //         fit: BoxFit.cover,
            //       )),
            //       title: Text(item.name),
            //       subtitle: Text(item.description ?? 'No description'),
            //     );
            //   },
            // );
          }
        },
      ),
    );
  }
}

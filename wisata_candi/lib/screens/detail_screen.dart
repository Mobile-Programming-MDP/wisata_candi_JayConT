import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          children: [
            // Detail Header
            Stack(
              children: [
                // Main Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      candi.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                // Custom Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                      )
                    ),
                  ),
                )
              ],
            ),
            // Detail Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  // Name and Favorites Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        candi.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border)
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  // Location, Build Date, Type
                  Row(children: [
                    Icon(Icons.place, color: Colors.red,),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 70,
                      child: Text(
                        'Lokasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(': ${candi.location}',),
                  ],),
                  Row(children: [
                    Icon(Icons.calendar_month, color: Colors.blue,),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 70,
                      child: Text(
                        'Dibangun',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(': ${candi.built}',),
                  ],),
                  Row(children: [
                    Icon(Icons.house, color: Colors.green,),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 70,
                      child: Text(
                        'Tipe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(': ${candi.type}',),
                  ],),
                  SizedBox(height: 16,),
                  Divider(color: Colors.deepPurple.shade100,),
                  SizedBox(height: 16,),
                  // Description
                ],
              ),
            ),
            // Detail Gallery
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100,),
                  Text('Galeri', style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: candi.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: candi.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text('Tap untuk memperbesar', style: TextStyle(
                    fontSize: 12, color: Colors.black54,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/redetail_screen.dart';

class ItemCard extends StatelessWidget {
  // TODO: Variable declaration for constructors
  final Candi candi;
  
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // TODO: Implement Routing to Detail Screen
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReDetailScreen(candi: candi),
          ),
        );
      },
      child: Card(
        // TODO: Parameters (shape, margin, elevation) of Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Image Widget
            Expanded(
              // TODO: Hero Animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // TODO: Text
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                candi.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // TODO: Text
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                candi.type,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
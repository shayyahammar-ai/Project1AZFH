import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('favorite')),
      body: ListView.separated(
        itemBuilder: (context, index) => buildFavItem(context),
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: 10,
      ),
    );
  }

  Widget buildFavItem(BuildContext context) => Padding(
    padding: const EdgeInsets.all(25.0),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      height: 180,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 40,
              child: const Icon(Icons.person, size: 40),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const Text(
                  'name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                const Text('role', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 18),
                    const SizedBox(width: 6),
                    const Text('rating (95 تقييم)'),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(' Book an appointment'),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              IconButton(
                padding: EdgeInsets.zero,
                
                icon: Icon(Icons.favorite_border_sharp, size: 25),
                onPressed: () {},
              ),
              SizedBox(height: 16),
              IconButton(
                padding: EdgeInsets.zero,
                
                icon: Icon(Icons.message, size: 25),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

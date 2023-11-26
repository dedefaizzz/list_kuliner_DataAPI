// tampilan utama dari aplikasi akan disimpan,
// sehingga membuat kode jadi lebih mudah dibaca & dikelola

import 'package:flutter/material.dart';
import 'package:list_kuliner/list_item.dart';
import 'package:list_kuliner/makanan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listMakanan.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (context, index) {
        return ListItem(
          makanan: listMakanan[index],
        );
      },
    );
  }
}

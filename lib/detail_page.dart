// tampilan halaman detail kuliner
import 'package:flutter/material.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';
import 'package:list_kuliner/http_helper.dart';

class DetailPage extends StatefulWidget {
  final Makanan makanan;

  DetailPage({super.key, required this.makanan});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HttpHelper api = HttpHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    api.url + widget.makanan.gambar,
                    scale: 0.5,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ButtonBack(), ButtonLike()],
                    ),
                  )
                ],
              ),
              Container(
                color: headerBackColor,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.makanan.nama,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  attributesIcon(
                    Icons.access_time_filled,
                    widget.makanan.waktubuka,
                  ),
                  attributesIcon(
                    Icons.local_fire_department_rounded,
                    widget.makanan.kalori,
                  ),
                  attributesIcon(
                    Icons.monetization_on,
                    widget.makanan.harga,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  widget.makanan.detail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              listGambarLain(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Bahan Racikan",
                  style: textHeader1,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: widget.makanan.bahan.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset(
                            widget.makanan.bahan[index].values.first,
                            width: 52,
                          ),
                          Text(widget.makanan.bahan[index].keys.first),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listGambarLain() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: widget.makanan.gambarlain.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(widget.makanan.gambarlain[index])),
          );
        },
      ),
    );
  }

  Column attributesIcon(IconData icon, String teks) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: pageBgColor,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: iconColor,
        ),
      ),
    );
  }
}

class ButtonLike extends StatefulWidget {
  const ButtonLike({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ButtonLike();
}

class _ButtonLike extends State<ButtonLike> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: pageBgColor,
      child: IconButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        icon: Icon(
          isSelected ? Icons.favorite : Icons.favorite_outline,
          color: iconColor,
        ),
      ),
    );
  }
}

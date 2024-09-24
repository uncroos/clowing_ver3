import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class LookbookCompletionScreen extends StatelessWidget {
  final List<OutfitDay> outfitDays = [
    OutfitDay(date: '2024년 9월 19일', items: [
      OutfitItem(name: '맨유', image: 'assets/images/menus.png'),
      OutfitItem(name: '맨유 바지', image: 'assets/images/menu.png'),
    ]),
    OutfitDay(
      date: '2024년 9월 18일',
      items: [
        OutfitItem(name: '노랑옷', image: 'assets/images/yellow.png'),
        OutfitItem(name: '아디다스 바지', image: 'assets/images/adidas.png'),
      ],
    ),
    OutfitDay(
      date: '2024년 9월 17일',
      items: [
        OutfitItem(name: '검정옷', image: 'assets/images/bblack.png'),
        OutfitItem(name: '버뮤다 팬츠', image: 'assets/images/as.png'),
      ],
    ),
    OutfitDay(
      date: '2024년 9월 16일',
      items: [
        OutfitItem(name: '빨간색 티셔츠', image: 'assets/images/qw.png'),
        OutfitItem(name: '버뮤다 팬츠', image: 'assets/images/as.png'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OOTD', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: outfitDays.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[300],
          thickness: 1,
          height: 1,
        ),
        itemBuilder: (context, index) {
          return OutfitDayWidget(outfitDay: outfitDays[index]);
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class OutfitDay {
  final String date;
  final List<OutfitItem> items;

  OutfitDay({required this.date, required this.items});
}

class OutfitItem {
  final String name;
  final String image;

  OutfitItem({required this.name, required this.image});
}

class OutfitDayWidget extends StatelessWidget {
  final OutfitDay outfitDay;

  OutfitDayWidget({required this.outfitDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            outfitDay.date,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: outfitDay.items.length,
          itemBuilder: (context, index) {
            return OutfitItemWidget(item: outfitDay.items[index]);
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class OutfitItemWidget extends StatelessWidget {
  final OutfitItem item;

  OutfitItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          item.name,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

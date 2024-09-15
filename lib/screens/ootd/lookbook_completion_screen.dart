import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class LookbookCompletionScreen extends StatelessWidget {
  final List<OutfitDay> outfitDays = [
    OutfitDay(
      date: '2024년 7월 17일',
      items: [
        OutfitItem(name: '반팔 후드', image: 'assets/images/qw.png'),
        OutfitItem(name: '버뮤다 팬츠', image: 'assets/images/qw.png'),
      ],
    ),
    OutfitDay(
      date: '2024년 7월 16일',
      items: [
        OutfitItem(name: '아디다스 집업', image: 'assets/images/qw.png'),
        OutfitItem(name: '체육복 바지', image: 'assets/images/qw.png'),
        OutfitItem(name: '슬리퍼', image: 'assets/images/qw.png'),
      ],
    ),
    OutfitDay(
      date: '2024년 7월 15일',
      items: [
        OutfitItem(name: '빨간색 티셔츠', image: 'assets/images/qw.png'),
        OutfitItem(name: '마이애미 29', image: 'assets/images/qw.png'),
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
      body: ListView.builder(
        itemCount: outfitDays.length,
        itemBuilder: (context, index) {
          return OutfitDayWidget(
            outfitDay: outfitDays[index],
            isLast: index == outfitDays.length - 1,
          );
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
  final bool isLast;

  OutfitDayWidget({required this.outfitDay, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineSection(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
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
                    childAspectRatio: 0.75,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection() {
    return Container(
      width: 50,
      child: Column(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            margin: EdgeInsets.only(top: 20),
          ),
          Expanded(
            child: Container(
              width: 2,
              color: isLast ? Colors.transparent : Colors.grey[300],
            ),
          ),
        ],
      ),
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

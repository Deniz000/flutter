import 'package:flutter/cupertino.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SearchContainer(primaryColor: primaryColor, 
              jobName: "UI/UX Designer", 
              opportunatiy: 4),
               SearchContainer(primaryColor: primaryColor, 
              jobName: "IOS Developer", 
              opportunatiy: 12)
              
              ]));
              
  }
}
class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.primaryColor,
    required this.jobName,
    required this.opportunatiy,
  });

  final Color primaryColor;
  final String jobName;
  final int opportunatiy;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(20),
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobName,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                wordSpacing: 20,
                height: 1.3),
          ),
          Text(
            "$opportunatiy Job Opportunatiy",
            style:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, height: 3),
          ),
        ],
      ),
    );
  }
}
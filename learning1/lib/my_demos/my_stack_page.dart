import 'package:flutter/material.dart';
class MyStackPage extends StatelessWidget {
  const MyStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 30,
                  child: _TopContainer(),
                ),
                Positioned(
                    bottom: 0, right: 25, left: 25, child: _ViewmoreButton()),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: _BottomSide(),
          )
        ],
      ),
    );
  }
}

class _BottomSide extends StatelessWidget {
  const _BottomSide();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasuruan Rock Festival !!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'The Taman Dayu',
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
          SizedBox(
            child: Row(
              children: [
                Icon(Icons.access_time_rounded, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "11 pm",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(width: 20),
                Icon(Icons.calendar_month_outlined, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "11 pm",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(width: 20),
                Icon(Icons.location_on, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "Taman Dayu",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Quis duis in amet fermentum ipsum. Pharetra tus vel, suspendisse nunc, est. '
            'Ut in eget nibh sed pulvinar. Sed risus, enim, risus id molestie. Velit enim arcu consectetur egestas. '
            'Odio est sed posuere sollicitudin interdum nisi. Lacus viverra gravida id fermentum quis neque suspendisse.',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "160",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Joined",
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Color.fromARGB(255, 27, 37, 52),
            child: ListTile(
              leading: Icon(Icons.arrow_back_ios_new_rounded),
              minLeadingWidth: 10,
              title: Center(child: Text("Near You")),
              textColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              subtitle: Center(child: Text("Pasuuran, Indonesia")),
              subtitleTextStyle: TextStyle(fontWeight: FontWeight.w200),
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      color: Color.fromARGB(255, 27, 37, 52),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      border: Border(
          bottom: BorderSide(
              color: Colors.orange, style: BorderStyle.solid, width: 3)),
      boxShadow: [
        BoxShadow(
            blurRadius: 100,
            blurStyle: BlurStyle.solid,
            color: Colors.orange,
            offset: Offset.zero)
      ],
    );
  }
}

class _ViewmoreButton extends StatelessWidget {
  const _ViewmoreButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: const StadiumBorder(),
      backgroundColor: Colors.orange,
      child: const Text("View All"),
    );
  }
}

import 'package:demo_pages/walletappui/widgets/custom_cards.dart';
import 'package:demo_pages/walletappui/widgets/middle_cards.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = PageController(viewportFraction: 0.6);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.red[400],
        child: const Icon(Icons.payment_outlined,color: Colors.white, size: 34,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink[300],
        elevation: 2,
        iconSize: 32,
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "My ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Cards",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Container(
                height: 180,
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomCards(
                      balance: 5.234,
                      cardNumber: 2435,
                      expiryMonth: 10,
                      expiryYear: 24,
                      color: Colors.deepPurple[300],
                    ),
                    CustomCards(
                      balance: 7.489,
                      cardNumber: 2764,
                      expiryMonth: 15,
                      expiryYear: 32,
                      color: Colors.pink[200],
                    ),
                    CustomCards(
                      balance: 13.942,
                      cardNumber: 8728,
                      expiryMonth: 20,
                      expiryYear: 37,
                      color: Colors.blue[400],
                    ),
                  ],
                )),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _controller, // PageController
                count: 3,
                effect: const ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 10.0,
                    dotHeight: 8.0,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Color.fromARGB(150, 206, 205, 205),
                    activeDotColor: Color.fromARGB(150, 108, 108, 108)),
              ),
            ),

            //3 bıttons
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MiddleCard(imageName: "send-money", action: "Send"),
                MiddleCard(imageName: "credit-card", action: "Pay"),
                MiddleCard(imageName: "bill", action: "Bills"),
              ],
            ),

            //column => starts + transiions

            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListViewItem(
                    title: "Statistics",
                    imgName: "analysis",
                    color: Colors.deepPurple[200],
                    description: "Payment and Income",
                  ),
                  ListViewItem(
                    title: "Transactions",
                    imgName: "transaction",
                    color: Colors.blue[200],
                    description: "Transactions history",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {super.key,
      required this.title,
      required this.imgName,
      required this.color,
      required this.description});
  final String title;
  final String imgName;
  final color;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading:Image.asset("lib/walletappui/icons/$imgName.png"),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, height: 2),
        ),
        subtitle: Text(
          description,
        ),
        trailing: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}

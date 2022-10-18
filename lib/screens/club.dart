import 'package:draggable_home/draggable_home.dart';
import "package:flutter/material.dart";

//stateful widget with nav bar
class ClubScreen extends StatefulWidget{
  const ClubScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 212, 109, 0.9),
      body: Center(
        child: DraggableHome(
          title: const Text("My Clubs"),
          headerWidget: headerWidget(context),
          headerBottomBar: headerBottomBarWidget(),
          body: [listView()],
          fullyStretchable: true,
        ),
      ),
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(251, 212, 109, 0.9),
      child: Center(
        child: Text(
          "My Clubs",
          style: Theme
              .of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30, bottom: 40),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          Card(
            color: Colors.white70,
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("$index"),
              ),
              title: const Text("Title"),
              subtitle: const Text("Subtitle"),
            ),
          ),
    );
  }
}
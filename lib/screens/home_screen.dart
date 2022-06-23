import 'package:flutter/material.dart';
import 'package:designchallenge/models/models.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () {},
            ),
            centerTitle: true,
            title: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/icon.png'),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                    text: 'Discover new adventures\n',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "More than 50 new adventures",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ]),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  child: Card(
                    child: Hero(
                      tag: 'location_$index',
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/peru.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: ListTile(
                          title: Text(context
                              .read<LocationsModel>()
                              .locations[index]
                              .name),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              childCount: context.read<LocationsModel>().locations.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<LocationsModel>().initialize();
  }
}

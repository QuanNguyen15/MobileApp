// TODO Implement this library.
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.blue.shade500,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
        child: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Flutter World',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.deepPurple,
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepPurpleAccent,
                decorationStyle: TextDecorationStyle.dotted,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' for',
                ),
                TextSpan(
                  text: ' Mobile',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      )],
    );
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){},
        ),
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),

        ],
        // flexibleSpace: SafeArea(
        //   child: Icon(
        //     Icons.photo_camera,
        //     size: 75.0,
        //     color: Colors.blue.shade100,
        //   ),
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: Container(
            color: Colors.blue.shade100,
            height: 75.0,
            width: double.infinity,
            child: const Center(
              child: Text('Bottom'),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ContainerWithBoxDecorationWidget(),
              ],
            ),
          ),
        )
        
      ),
    );
  }

  Row _buildHorizontalRow2() {
    return Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        height: 60.0,
                        width: 60.0,
                      ),
                      const Padding(padding: EdgeInsets.all(16.0),),
                      Container(
                        color: Colors.amber,
                        height: 40.0,
                        width: 40.0,
                      ),
                      const Padding(padding: EdgeInsets.all(16.0),),
                      Container(
                        color: Colors.brown,
                        height: 20.0,
                        width: 20.0,
                      ),
                      const Divider(),
                      const Row(
                        children: <Widget>[
                          // Next step we'll add more widgets
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            radius: 100.0,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.yellow,
                                ),
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  color: Colors.amber,
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  color: Colors.brown,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Text('End of the Line'),
                    ],
                  ),
                ],
              );
  }

  Row _buildHorizontalRow() {
    return Row(
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    height: 40.0,
                    width: 40.0,
                  ),
                  const Padding(padding: EdgeInsets.all(16.0)),
                  Expanded(
                      child: Container(
                        color: Colors.amber,
                        height: 40.0,
                        width: 40.0,
                  ),
                  ),
                  const Padding(padding: EdgeInsets.all(16.0)),
                  Container(
                    color: Colors.brown,
                    height: 40.0,
                    width: 40.0,
                  )

                ],
              );
  }
}


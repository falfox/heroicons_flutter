import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HeroIconsApp(),
    );
  }
}

class HeroIconsApp extends StatefulWidget {
  HeroIconsApp({Key key}) : super(key: key);

  @override
  _HeroIconsAppState createState() => _HeroIconsAppState();
}

class _HeroIconsAppState extends State<HeroIconsApp> {
  bool _outline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff6C2BD8), Color(0xffA65FEC)],
              ),
            ),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Heroicons',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white)),
                      Text('Icon set for Flutter.',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Switch(
                          value: _outline,
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.black,
                          onChanged: (v) => setState(() => _outline = v)),
                      Text('Current: ${_outline ? 'Outline' : 'Solid'}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            )),
          ),
          SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
            ),
            itemBuilder: (context, index) => Card(
              child: Icon(
                _outline
                    ? HeroIconsOutline.icons[index]
                    : HeroIconsSolid.icons[index],
                color: Color(0xff6b7280),
              ),
            ),
            itemCount: _outline
                ? HeroIconsOutline.icons.length
                : HeroIconsSolid.icons.length,
          ),
        ],
      ),
    );
  }
}

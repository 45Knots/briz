import 'package:briz/components/cruiser_card.dart';
import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/components/my_sliver_with_header.dart';
import 'package:briz/models/cruiser.dart';
import 'package:briz/services/cruiser_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeId = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const FluppScaffold(
        screenIndex: 0,
        settings: FluppScaffoldSettings(
          appBarSettings: FluppSliverAppBarSettings(
            title: FluppSliverAppBarTitleSettings(
              text: "Briz",
            ),
          ),
        ),
        slivers: [CruiserList()]);
  }
}

class CruiserList extends StatelessWidget {
  const CruiserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySliverWithHeader(
      title: "Cruises near me",
      sticky: true,
      sliver: FutureBuilder<List<Cruiser>>(
        future: CruiserService.readAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SliverList(
              delegate: SliverChildListDelegate(
                [const Text("no data")],
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  while (index < 10) {
                    return CruiserListItem(
                      cruiser: snapshot.data![0],
                    );
                  }
                  return null;
                  // if (snapshot.data!.length > index) {
                  //   return CruiserListItem(
                  //     cruiser: snapshot.data![index],
                  //   );
                  // } else {
                  //   return null;
                  // }
                },
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:briz/components/cruiser_card.dart';
import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/components/my_sliver_with_header.dart';
import 'package:briz/constants.dart';
import 'package:briz/models/cruiser.dart';
import 'package:briz/services/cruiser_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
            appBar: FluppSliverAppBarSettings(
              title: FluppSliverAppBarTitleSettings(
                text: "Briz",
              ),
            ),
            bottomNavigation: Constants.bottomNavBarSettings),
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
      sticky: false,
      sliver: FutureBuilder<List<Cruiser>>(
        future: CruiserDataService.readAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 500,
                child: Center(
                  child: LoadingAnimationWidget.waveDots(color: Theme.of(context).primaryColor, size: 100),
                ),
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  while (index < snapshot.data!.length) {
                    return CruiserListItem(
                      cruiser: snapshot.data![index],
                    );
                  }
                  return null;
                },
              ),
            );
          }
        },
      ),
    );
  }
}

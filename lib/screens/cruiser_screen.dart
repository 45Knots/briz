import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/constants.dart';
import 'package:briz/models/cruiser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../components/dummy_sliver_list.dart';

class CruiserScreenArguments {
  final Cruiser cruiser;

  CruiserScreenArguments({
    required this.cruiser,
  });
}

class CruiserScreen extends StatefulWidget {
  const CruiserScreen({Key? key, required this.arguments}) : super(key: key);
  static const String routeId = 'cruiser_screen';

  final CruiserScreenArguments arguments;

  @override
  State<CruiserScreen> createState() => _CruiserScreenState();
}

class _CruiserScreenState extends State<CruiserScreen> {
  @override
  Widget build(BuildContext context) {
    return FluppScaffold(
      screenIndex: -1,
      settings: FluppScaffoldSettings(
        appBarSettings: FluppSliverAppBarSettings(
          title: FluppSliverAppBarTitleSettings(
            text: widget.arguments.cruiser.title,
            textStyle: kListCardTextStyle,
            alignment: Alignment.bottomCenter,
          ),
          image: FluppSliverAppBarImageSettings(
            fit: BoxFit.cover,
            path: widget.arguments.cruiser.defaultImage,
            opacity: 1.0,
          ),
        ),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Book me for a cruise!'),
                onPressed: () {
                  launchWhatsApp();
                },
              ),
            ],
          ),
        ),
        const DummySliverList(),
      ],
    );
  }

  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+306948896643',
      text: "Hi! I found your cruiser through Briz. Is it available for a daily cruise tomorrow?",
    );

    await launch('$link');
  }
}

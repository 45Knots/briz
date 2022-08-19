import 'package:briz/components/flupp/flupp_scaffold.dart';
import 'package:briz/components/flupp/flupp_sliverappbar.dart';
import 'package:briz/constants.dart';
import 'package:briz/models/cruiser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class CruiserScreenArguments {
  final Cruiser cruiser;

  CruiserScreenArguments({
    required this.cruiser,
  });
}

class CruiserFeature {
  final String title;
  final dynamic value;
  final IconData? icon;
  final String? imageUrl;

  CruiserFeature({
    required this.title,
    required this.value,
    this.icon,
    this.imageUrl,
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
  late Cruiser cruiser;

  @override
  void initState() {
    super.initState();
    cruiser = widget.arguments.cruiser;
  }

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<CruiserFeature> get features => List<CruiserFeature>.of([
        CruiserFeature(title: "Capacity", value: '${cruiser.capacity.toString()} people', icon: Icons.person_outlined),
        CruiserFeature(title: "Cabins", value: '${cruiser.cabins.toString()} cabin(s)', icon: Icons.airline_seat_individual_suite_outlined),
        CruiserFeature(title: "Length", value: '${cruiser.length.toString()} m', icon: Icons.trending_flat_outlined),
      ]);

  List<String>? get resolvedImagePaths {
    if (cruiser.images == null) {
      return null;
    }
    List<String> resolved = List<String>.from([cruiser.defaultImage], growable: true);
    if (cruiser.images != null) {
      for (var element in cruiser.images!) {
        if (element != cruiser.defaultImage) {
          resolved.add(element);
        }
      }
    }
    return resolved;
  }

  @override
  Widget build(BuildContext context) {
    return FluppScaffold(
      screenIndex: -1,
      settings: FluppScaffoldSettings(
          appBar: FluppSliverAppBarSettings(
              title: FluppSliverAppBarTitleSettings(
                text: cruiser.title,
                textStyle: kListCardTextStyle,
                backgroundColor: Colors.black.withOpacity(0.5),
                alignment: Alignment.bottomCenter,
              ),
              image: FluppSliverAppBarImageSettings(
                fit: BoxFit.cover,
                path: cruiser.defaultImage,
                paths: resolvedImagePaths,
                opacity: 1.0,
              ),
              avatar: FluppSliverAppBarAvatarSettings(
                alignment: Alignment.bottomLeft,
                show: true,
                imageUrlOrPath: cruiser.base.logo,
              ),
              info: const FluppSliverAppBarInfoSettings(
                show: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    launchWhatsApp();
                  },
                  autofocus: false,
                  padding: const EdgeInsets.only(bottom: 3, left: 1),
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  // iconSize: 30,
                  // color: Colors.white,
                ),
              ]),
          bottomNavigation: Constants.bottomNavBarSettings),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              mainAxisExtent: 100,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  elevation: 0,
                  borderOnForeground: false,
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            features[index].icon,
                            color: Colors.black87,
                            size: 40,
                          ),
                        ),
                        Text(features[index].value.toString()),
                      ],
                    ),
                  ),
                );
              },
              childCount: features.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text("Price ", style: kListTitleTextStyle),
                ),
                Text(cruiser.prices[0].price.toString(), style: kListTitleTextStyle)
              ],
            ),
          ),
        ),
        const SliverPinnedHeader(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Text('Additional Services', style: kListTitleTextStyle),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(cruiser.services[index].title, style: kListTitleTextStyle.copyWith(fontSize: 16)),
                    ),
                    Text(cruiser.services[index].included ? 'included' : cruiser.services[index].price.toString(), style: kListTitleTextStyle.copyWith(fontSize: 16)),
                  ],
                ),
              );
            },
            childCount: cruiser.services.length,
          ),
        ),
        const SliverPinnedHeader(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Text('Location', style: kListTitleTextStyle),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 300,
              width: double.maxFinite,
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(cruiser.base.location.latitude, cruiser.base.location.longitude),
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId(cruiser.base.id),
                      position: LatLng(cruiser.base.location.latitude, cruiser.base.location.longitude),
                      infoWindow: InfoWindow(title: cruiser.base.title),
                      onTap: () {
                        launchUrlString(cruiser.base.placeUrl);
                      }),
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+306948896643',
      text: "Hi! I found your cruiser through Briz. Is it available for a daily cruise tomorrow?",
    );

    await launchUrlString('$link', mode: LaunchMode.externalApplication);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:parla_home/models/device.dart';
import 'package:parla_home/models/door.dart';
import 'package:parla_home/network/app_repository.dart';
import 'package:parla_home/res/AppColors.dart';
import 'package:parla_home/res/AppIcons.dart';

import 'models/lamp.dart';
import 'models/room.dart';

Text FontedText(String text, {Color? color, required double size}) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'yekan', color: color, fontSize: size),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;

  Widget tabWidget = const LinearProgressIndicator(
    color: AppColors.secondaryColor,
    backgroundColor: AppColors.primaryColor,
    minHeight: 1.0,
  );
  Widget tabContentWidget = const Center(
      child: CircularProgressIndicator(
    color: AppColors.secondaryColor,
    strokeWidth: 2.0,
  ));
  List<Tab> tabs = [];
  List<Widget> tabContents = [];

  @override
  void initState() {
    super.initState();

    AppRepository.instance.getRooms().then((value) {
      for (var room in value.rooms) {
        tabs.add(
          Tab(text: room.name),
        );
        tabContents.add(
          DevicesView(room),
        );
      }

      setState(() {
        tabController = TabController(length: tabs.length, vsync: this);
        tabWidget = TabBar(
          isScrollable: true,
          indicator: const BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              topLeft: Radius.circular(5.0),
            ),
          ),
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.only(top: 44),
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(fontFamily: 'yekan'),
          tabs: tabs,
        );
        tabContentWidget = TabBarView(
          controller: tabController,
          children: tabContents,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColorLight,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 1.0,
                  blurRadius: 10.0),
            ],
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                SizedBox(
                  height: 28.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/logo/ic_launcher.png',
                            width: 60.0,
                            height: 60.0,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontedText('جناب شاه بندری',
                              size: 16.0, color: AppColors.textColor),
                          FontedText('به خونه خوش اومدی',
                              size: 14.0, color: AppColors.secondaryColorWhite),
                        ],
                      )
                    ],
                  ),
                ),
                tabWidget,
              ],
            ),
          ),
        ),
        Expanded(
          child: tabContentWidget,
        )
      ],
    );
  }
}

class DevicesView extends StatefulWidget {
  final Room room;
  DevicesView(this.room, {Key? key}) : super(key: key);

  @override
  State<DevicesView> createState() => _DevicesViewState();
}

class _DevicesViewState extends State<DevicesView> {
  List<Device> deviceList = [];

  @override
  void initState() {
    super.initState();
    AppRepository.instance.getDevices(widget.room.id).then((value) {
      deviceList.addAll(value.lamps);
      deviceList.addAll(value.doors);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (deviceList.isNotEmpty)
          ? MasonryGridView.builder(
              itemCount: deviceList.length,
              padding: const EdgeInsets.only(bottom: 65.0, top: 8.0),
              itemBuilder: (context, index) {
                return DeviceWidget(device: deviceList[index]);
              },
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
              strokeWidth: 2.0,
            )),
    );
  }
}

class DeviceWidget extends StatefulWidget {
  Device device;
  DeviceWidget({Key? key, required this.device}) : super(key: key);

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: (widget.device.device_type == 0)
                ? (widget.device as Lamp).state == 'ON'
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor
                : (widget.device as Door).state == 'OPEN'
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor),
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: widget.device.id,
              onPressed: () {
                setState(() {
                  loading = !loading;
                });
                AppRepository.instance.toggle(widget.device).then((value) {
                  if (value.state == 'ON') {
                    debugPrint('ON');
                  } else {
                    debugPrint('OFF');
                  }
                });
              },
              backgroundColor: (widget.device.device_type == 0)
                  ? (widget.device as Lamp).state == 'ON'
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor
                  : (widget.device as Door).state == 'OPEN'
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor,
              elevation: 0,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  (loading)
                      ? const CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                          strokeWidth: 2.0,
                        )
                      : Container(),
                  Transform.scale(
                    scale: ((loading) ? 0.8 : 1.0),
                    child: Icon(widget.device.device_type == 0
                        ? AppIcons.lamp
                        : AppIcons.door),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontedText(widget.device.name,
                    size: 16.0, color: AppColors.textColor),
                FontedText(
                    widget.device.device_type == 0
                        ? (widget.device as Lamp).state
                        : (widget.device as Door).state,
                    size: 14.0,
                    color: AppColors.secondaryColorLight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

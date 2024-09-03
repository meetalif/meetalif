import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/views/contact_view.dart';
import 'package:adhunitech/views/footer_view.dart';
import 'package:adhunitech/views/hero_view.dart';
import 'package:adhunitech/views/projects_view.dart';
import 'package:adhunitech/views/services_view.dart';
import 'package:adhunitech/views/work_view.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final heroKey = GlobalKey();
  final serviceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final textScrollController = ScrollController();
  final viewScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewScrollController.addListener(() {
      if (textScrollController.position.maxScrollExtent >
          textScrollController.offset) {
        textScrollController.jumpTo(
          viewScrollController.offset,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: _drawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: isMobile(constraints) ? 24 : 64,
            toolbarHeight: isMobile(constraints) ? 64 : 84,
            title: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Scrollable.ensureVisible(
                  heroKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                ),
                child: const Text(
                  companyName,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            actions: [
              if (!isMobile(constraints)) ...[
                TextButton(
                  onPressed: () => Scrollable.ensureVisible(
                    heroKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                  ),
                  child: const Text("Home"),
                ),
                TextButton(
                  onPressed: () => Scrollable.ensureVisible(
                    serviceKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                  ),
                  child: const Text("Services"),
                ),
                TextButton(
                  onPressed: () => Scrollable.ensureVisible(
                    projectsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                  ),
                  child: const Text("Projects"),
                ),
                TextButton(
                  onPressed: () => Scrollable.ensureVisible(
                    contactKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                  ),
                  child: const Text("Contact Us"),
                ),
              ],
              if (isMobile(constraints)) ...[
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ]
            ],
          ),
          body: DynMouseScroll(
            builder: (context, controller, physics) {
              controller.addListener(() {
                if (textScrollController.position.maxScrollExtent >
                    textScrollController.offset) {
                  textScrollController.jumpTo(controller.offset);
                }
              });
              return SingleChildScrollView(
                controller: controller,
                physics: physics,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroView(
                      key: heroKey,
                      textScrollController: textScrollController,
                    ),
                    ServicesView(key: serviceKey),
                    ProjectsView(key: projectsKey),
                    const WorkView(),
                    ContactView(key: contactKey),
                    const FooterView(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  _drawer() {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(leading: const BackButton()),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                Scrollable.ensureVisible(
                  heroKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                );
                Navigator.pop(context);
              },
              title: const Text("Home"),
            ),
            ListTile(
              onTap: () {
                Scrollable.ensureVisible(
                  serviceKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                );
                Navigator.pop(context);
              },
              title: const Text("Services"),
            ),
            ListTile(
              onTap: () {
                Scrollable.ensureVisible(
                  projectsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                );
                Navigator.pop(context);
              },
              title: const Text("Projects"),
            ),
            ListTile(
              onTap: () {
                Scrollable.ensureVisible(
                  contactKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                );
                Navigator.pop(context);
              },
              title: const Text("Contact Us"),
            ),
          ],
        ),
      ),
    );
  }
}

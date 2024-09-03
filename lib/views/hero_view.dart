import 'package:adhunitech/configs/constants.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HeroView extends StatelessWidget {
  final ScrollController textScrollController;
  const HeroView({super.key, required this.textScrollController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundText(context),
        LayoutBuilder(
          builder: (context, constraints) {
            if (isMobile(constraints)) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: _intro(context),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(64),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _intro(context),
                    ),
                    Expanded(
                      child: _introImage(context),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _backgroundText(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: textScrollController,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            children: [
              Text(
                companyName,
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  fontSize: 400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _intro(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          introConf,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          introTitle,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          "assets/images/underline.png",
          width: 240,
        ),
        const Text(
          introSubtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () {
            html.window.open(introButtonUrl, "new tab");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(introButtonText),
          ),
        ),
      ],
    );
  }

  Widget _introImage(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/device_hero.png",
        width: 300,
      ),
    );
  }
}

import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/configs/footer.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              left: isMobile(constraints) ? 24 : 64,
              right: isMobile(constraints) ? 24 : 64,
              top: isMobile(constraints) ? 14 : 24,
              bottom: isMobile(constraints) ? 14 : 24,
            ),
            child: isMobile(constraints)
                ? Column(
                    children: [
                      _copyright(),
                      const SizedBox(height: 12),
                      Center(
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: socials
                                .map((e) => _social(context, e.icon, e.url))
                                .toList()),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(child: _copyright()),
                      Expanded(child: Center(child: _company())),
                      Expanded(
                        child: Row(
                          children: [
                            const Spacer(),
                            Row(
                                children: socials
                                    .map((e) => _social(context, e.icon, e.url))
                                    .toList())
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _copyright() {
    return const Text(
      "Copyright $companyName ©2023",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
  }

  Widget _company() {
    return Text(
      companyName.toUpperCase(),
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _social(BuildContext context, String icon, String url) {
    return GestureDetector(
      onTap: () => html.window.open(url, "new tab"),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 40,
        child: Center(
          child: Image.network(
            icon,
            height: 24,
            width: 24,
            fit: BoxFit.cover,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}

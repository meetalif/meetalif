import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/configs/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile(constraints) ? 24 : 64,
                vertical: isMobile(constraints) ? 14 : 24),
            child: isMobile(constraints)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leading(context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: contactList
                            .map((e) =>
                                _tile(context, e.icon, e.title, e.subtitle))
                            .toList(),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: leading(context),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: contactList
                              .map((e) =>
                                  _tile(context, e.icon, e.title, e.subtitle))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  leading(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          contactText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          contactTitle,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          contactSubtitle,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ]);

  Widget _tile(
      BuildContext context, IconData icon, String title, String subtitle) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white70),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

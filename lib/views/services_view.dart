import 'package:adhunitech/configs/constants.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(isMobile(constraints) ? 24 : 64),
        child: Column(
          children: [
            const Text(
              servicesTitle,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            isMobile(constraints)
                ? ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            services[index].icon,
                            color: Colors.white70,
                            size: 56,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          services[index].title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          services[index].subtitle,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    itemCount: services.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  )
                : GridView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            services[index].icon,
                            color: Colors.white70,
                            size: 56,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          services[index].title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          services[index].subtitle,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    itemCount: services.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 16 / 9,
                    ),
                  ),
          ],
        ),
      );
    });
  }
}

import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/configs/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class WorkView extends StatelessWidget {
  const WorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(isMobile(constraints) ? 24 : 64),
        child: Column(
          children: [
            const Text(
              workTitle,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            isMobile(constraints)
                ? Column(
                    children: [
                      Row(
                        children: [
                          _container(context, works[0].markdown, works[0].flex)
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _container(context, works[1].markdown, works[1].flex),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      _container(context, works[0].markdown, works[0].flex),
                      const SizedBox(width: 24),
                      _container(context, works[1].markdown, works[1].flex),
                    ],
                  ),
            SizedBox(height: isMobile(constraints) ? 16 : 24),
            isMobile(constraints)
                ? Column(
                    children: [
                      Row(
                        children: [
                          _container(context, works[2].markdown, works[2].flex),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _container(context, works[3].markdown, works[3].flex),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      _container(context, works[2].markdown, works[2].flex),
                      SizedBox(width: isMobile(constraints) ? 16 : 24),
                      _container(context, works[3].markdown, works[3].flex),
                    ],
                  ),
          ],
        ),
      );
    });
  }

  Widget _container(BuildContext context, String data, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        child: MarkdownBody(
          data: data,
          styleSheet: MarkdownStyleSheet(
            h2: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            p: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }
}

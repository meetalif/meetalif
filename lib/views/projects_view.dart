import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/configs/projects.dart';
import 'package:adhunitech/views/project_details_view.dart';
import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(isMobile(constraints) ? 24 : 64),
        child: Column(
          children: [
            const Text(
              projectsTitle,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth < 700
                    ? 1
                    : constraints.maxWidth < 960
                        ? 2
                        : 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: projects.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var data = projects[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ProjectDetailsView(data: data);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.network(
                              data.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data.subtitle,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

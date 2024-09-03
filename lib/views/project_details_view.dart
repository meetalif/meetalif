import 'package:adhunitech/configs/constants.dart';
import 'package:adhunitech/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ProjectDetailsView extends StatelessWidget {
  final ProjectModel data;
  const ProjectDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return isMobile(constraints)
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                          data.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: MarkdownBody(data: data.markdown),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: Image.network(
                          data.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(child: Markdown(data: data.markdown)),
                  ],
                );
        },
      ),
    );
  }
}

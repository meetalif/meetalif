import 'package:adhunitech/models/work_model.dart';

const String workTitle = "How we work";

final List<WorkModel> works = [
  WorkModel(
    markdown: """## Agile Methodology
- Iterative and collaborative approach.
- No-code prototyping for rapid iterations.
- Collaboration between design and development teams.
- Delivery of functional increments in regular sprints.""",
    flex: 2,
  ),
  WorkModel(
    markdown: """## Design Thinking
- Empathy with users and deep understanding of their needs.
- Clear problem definition and design opportunities.
- Generation of creative and user-centric no-code solutions.
- Rapid prototyping and iterative testing with users.""",
    flex: 1,
  ),
  WorkModel(
    markdown: """## Lean approach
- Identification of inefficient workflows and areas for improvement.
- Identification of inefficient workflows and areas for improvement.
- Rapid iteration and continuous improvement cycles.
- Focus on rapid delivery of value and tangible results.""",
    flex: 1,
  ),
  WorkModel(
    markdown: """## Waterfall Development and Design Model:
- Detailed definition of project requirements and scope.
- Visual and user experience (UX) design in initial phases.
- Sequential implementation of no-code solutions and design.
- Exhaustive testing and validation at the end of each phase.""",
    flex: 2,
  ),
];

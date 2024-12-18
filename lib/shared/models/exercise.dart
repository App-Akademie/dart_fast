class Exercise {
  final String title;
  final String description;
  final String problem;
  final List<String> choices;
  final int correctSolutionIndex;
  final bool solved;

  Exercise({
    required this.title,
    required this.description,
    required this.problem,
    required this.choices,
    required this.correctSolutionIndex,
    this.solved = false,
  });

  Exercise.solved({
    required this.title,
    required this.description,
    required this.problem,
    required this.choices,
    required this.correctSolutionIndex,
  }) : solved = true;
}

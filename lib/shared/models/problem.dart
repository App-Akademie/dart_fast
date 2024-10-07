class Problem {
  String exercise;
  String solution;
  bool solved;

  Problem({
    required this.exercise,
    required this.solution,
    this.solved = false,
  });

  Problem.solved({required this.exercise, required this.solution})
      : this.solved = true;
}

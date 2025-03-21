import '../../model/my_listed_arms_model.dart';

class ListArmsState{
  final List<MyListedArm> arms;

  const ListArmsState({
    required this.arms,
  });

  ListArmsState copyWith({
    List<MyListedArm>? arms,
  }) {
    return ListArmsState(
      arms: arms ?? this.arms,
    );
  }
}
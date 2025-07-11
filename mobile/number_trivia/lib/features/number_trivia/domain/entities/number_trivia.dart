import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable{
  final String text;
  final int number;

  NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props {
    return [text, number];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
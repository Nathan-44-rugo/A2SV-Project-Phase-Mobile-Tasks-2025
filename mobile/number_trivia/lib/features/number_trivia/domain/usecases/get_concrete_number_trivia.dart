import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:number_trivia/core/usecases/usecase.dart';

import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';
import '../../../../core/error/failures.dart';


class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int>{
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number}) : super([number]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

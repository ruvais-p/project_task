import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_project/serviece/model/data_model.dart';

@immutable
abstract class DataState extends Equatable{}

class DataLoading extends DataState{
  @override
  List<Object?> get props => [];
}
class DataLoaded extends DataState{
  final List<DataModel> data;

  DataLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
class DataError extends DataState{
  final String error;
  DataError(this.error);
  @override
  List<Object?> get props => [error];
}
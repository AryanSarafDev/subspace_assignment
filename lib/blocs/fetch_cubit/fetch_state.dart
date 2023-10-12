import 'package:subspace_assignment/models/blog_model.dart';

abstract class Fetch{}
class FetchLoading extends Fetch{}
class FetchLoaded extends Fetch{
  final BlogList blogs;
  FetchLoaded(this.blogs);
}
class FetchError extends Fetch{
  FetchError(String error);
}

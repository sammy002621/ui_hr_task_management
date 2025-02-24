abstract class Usecase <Type,params> {
  Future<Type> call({params params});
}
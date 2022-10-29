import '../../domain/repositories/pokedex_repository.dart';
import '../datasources/datasource.dart';

class PokedexRepositoryImpl extends PokedexRepository {
  PokedexRepositoryImpl(this._datasource);

  final Datasource _datasource;
}

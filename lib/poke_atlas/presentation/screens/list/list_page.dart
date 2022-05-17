import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repositories/pokedex_repository.dart';
import '../../components/filter_bar.dart';
import '../../components/pokeatlas_header.dart';
import '../../components/pokemon_card.dart';
import '../../components/search_bar.dart';
import '../../controller/list_controller.dart';
import '../../pages/profile_page.dart';
import '../../utils/constants.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      ListController(
        GetIt.I.get<PokedexRepository>(),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePathConstants.listBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PokeAtlasHeader(),
                    const SizedBox(height: 23),
                    SearchBar(_controller),
                    const SizedBox(height: 17.64),
                    FilterBar(_controller),
                    const SizedBox(height: 29.22),
                    _controller.obx(
                      (pokemonDetailList) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: pokemonDetailList!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return PokemonCard(
                            pokemonDetailList[index],
                            onTap: () async {
                              final description =
                                  await _controller.getPokemonDescription(
                                pokemonDetailList[index].id,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    pokemonDetailList[index],
                                    description,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      onEmpty: const Center(
                          child: Text('Nenhum Pokémon encontrado')),
                      onLoading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onError: (error) => const Center(
                        child: Text('Error'),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

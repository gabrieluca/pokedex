import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repositories/pokedex_repository.dart';
import '../../components/custom_loading.dart';
import '../../components/filter_bar.dart';
import '../../components/pokeatlas_header.dart';
import '../../components/pokemon_card.dart';
import '../../components/search_bar.dart';
import '../../controller/list_controller.dart';
import '../../pages/profile/profile_page.dart';
import '../../utils/constants.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                controller: _controller.scrollController,
                child: Column(
                  children: [
                    const PokeAtlasHeader(),
                    const SizedBox(height: 23),
                    SearchBar(_controller),
                    const SizedBox(height: 17.64),
                    FilterBar(_controller),
                    const SizedBox(height: 29.22),
                    //TODO Fix empty state (search)
                    //TODO Implement BLOC
                    _controller.obx(
                      (state) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _controller.pageList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return PokemonCard(
                            _controller.pageList[index],
                            onTap: () async {
                              final description = await _controller.getPokemonDescription(
                                _controller.pageList[index].id,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    _controller.pageList[index],
                                    description,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      onEmpty: const Center(child: Text('Nenhum Pokémon encontrado')),
                      onLoading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomLoading(),
                        ],
                      ),
                      onError: (error) => const Center(
                        child: Text('Tente novamente'),
                      ),
                    ),
                    Obx(
                      () {
                        if (_controller.listEndStatus.value.isLoading) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  CustomLoading(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (_controller.listEndStatus.value.isSuccess &&
                            _controller.pageList.length == 150) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Todos os pokémons da primeira geração foram carregados!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                        return const SizedBox(height: 20, width: 20, child: SizedBox());
                      },
                    ),
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

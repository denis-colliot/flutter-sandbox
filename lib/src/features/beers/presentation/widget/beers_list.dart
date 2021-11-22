library feature.beers;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_state.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_uimodel.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/viewmodel/beers_viewmodel.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/widget/beers_list_item.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

class BeersList extends StatefulWidget {
  @override
  _BeersListState createState() => _BeersListState();
}

class _BeersListState extends State<BeersList> {
  final viewModel = injector.get<BeersViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadBeers();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers'),
      ),
      body: _buildBeersList(),
    );
  }

  StatefulWidget _buildBeersList() {
    return StreamBuilder(
      stream: viewModel.beers,
      builder: (context, AsyncSnapshot<BeerPreviewsState> snapshot) {
        if (snapshot.hasData) {
          final snapshotData = snapshot.data;
          if (snapshotData is BeerPreviewsSuccessState) {
            return _buildBeerItemsList(beers: snapshotData.beerPreviews);
          } else {
            return _buildError(error: "Something went wrong!");
          }
        }
        if (snapshot.hasError) {
          return _buildError(error: snapshot.error);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildError({Object? error}) {
    return Center(child: Text(error.toString()));
  }

  Widget _buildBeerItemsList({required List<BeerPreviewUiModel> beers}) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: beers.length,
      itemBuilder: (BuildContext context, int index) => BeersListItem(
          uiModel: beers[index],
          onTapHandler: (tappedBeer) => viewModel.onSelectBeer(tappedBeer)),
    );
  }
}

library feature.beers;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_uimodel.dart';

class BeersListItem extends StatefulWidget {
  final BeerPreviewUiModel uiModel;
  final Function(BeerPreviewUiModel) onTapHandler;

  BeersListItem({required this.uiModel, required this.onTapHandler});

  @override
  _BeersListItemState createState() => _BeersListItemState();
}

class _BeersListItemState extends State<BeersListItem> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final beer = widget.uiModel;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(beer.imageUrl),
      ),
      title: Text(
        beer.name,
        style: _biggerFont,
      ),
      subtitle: Text(beer.tagline),
      onTap: () => widget.onTapHandler(beer),
    );
  }
}

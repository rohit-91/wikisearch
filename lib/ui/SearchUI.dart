import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wikisearch/data_model/SearchModel.dart';
import 'package:wikisearch/utils/CommonUtils.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<Search> {
  SearchModel _model;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _model = SearchModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WikiSearch"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Icon(Icons.search),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Search",
                          fillColor: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        CommonUtils.hideKeyboard(context);
                        _model.search(_controller.text);
                      },
                      child: Text(
                        "SEARCH",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<SearchModel>(builder: (context, model, child) {
                if (model.isSearching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, i) {
                    return Card(
                      child: GestureDetector(
                        onTap: () {
                          CommonUtils.launchInBrowser(model.getUrl(i));
                        },
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              model.getImageUrl(i),
                              width: 50,
                              height: 100,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      model.getTitle(i),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        model.getDescription(i),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: model.searchResults.length,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

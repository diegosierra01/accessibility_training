import 'package:flutter/material.dart';

class BlockSemanticsPage extends StatefulWidget {
  static const String route = 'block_semantics';
  const BlockSemanticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlockSemanticsPageState();
  }
}

class _BlockSemanticsPageState extends State<BlockSemanticsPage> {
  bool _showCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block Semantics'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 160,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: OutlinedButton(
                      child: const Text('Mostrar tarjeta'),
                      onPressed: () => setState(() {
                        _showCard = true;
                      }),
                    ),
                  ),
                  BlockSemantics(
                    blocking: _showCard,
                    child: Visibility(
                      visible: _showCard,
                      child: Card(
                        color: Colors.teal,
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: FlutterLogo(),
                              ),
                              const Text('Hola'),
                              ButtonTheme(
                                child: ButtonBar(
                                  children: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () => setState(
                                        () {
                                          _showCard = false;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

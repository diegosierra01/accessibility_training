import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrderAccessibilityPage extends StatefulWidget {
  static const String route = 'order_accessibility';
  const OrderAccessibilityPage({Key? key}) : super(key: key);

  @override
  State<OrderAccessibilityPage> createState() => _OrderAccessibilityPageState();
}

class _OrderAccessibilityPageState extends State<OrderAccessibilityPage> {
  final String firstText = 'Calima';
  final String secondText = 'Carlos Vives';
  final String thirdText = 'Dejame entrar';
  final String fourText = 'Comentarios';

  final String firstAccessibilityText = 'Producciones Calima';
  final String secondAccessibilityText =
      'Nombre del artista destacado: Carlos Vives';
  final String thirdAccessibilityText = 'Album: Dejame Entrar';
  final String fourAccessibilityText = 'Comentarios acerca del album';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orden de los Nodos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label: firstAccessibilityText,
                    sortKey: const OrdinalSortKey(2),
                    readOnly: true,
                    excludeSemantics: true,
                    child: Text(
                      firstText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Semantics(
                    sortKey: const OrdinalSortKey(0),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.album, size: 45),
                            title: Semantics(
                              sortKey: const OrdinalSortKey(1),
                              readOnly: true,
                              label: secondAccessibilityText,
                              excludeSemantics: true,
                              child: Text(secondText),
                            ),
                            subtitle: Semantics(
                              sortKey: const OrdinalSortKey(0),
                              readOnly: true,
                              label: thirdAccessibilityText,
                              excludeSemantics: true,
                              child: Text(thirdText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Semantics(
                    label: fourAccessibilityText,
                    sortKey: const OrdinalSortKey(1),
                    readOnly: true,
                    excludeSemantics: true,
                    child: Text(fourText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

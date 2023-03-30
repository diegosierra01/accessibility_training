import 'package:flutter/material.dart';

class HiddenAccessibilityPage extends StatefulWidget {
  static const String route = 'hidden_accesibility';
  const HiddenAccessibilityPage({Key? key}) : super(key: key);

  @override
  State<HiddenAccessibilityPage> createState() =>
      _HiddenAccessibilityPageState();
}

class _HiddenAccessibilityPageState extends State<HiddenAccessibilityPage> {
  final String firstText = 'Cuenta 123456789';
  final String secondText = 'Saldo de la cuenta';
  final String thirdText = '300 dolares';
  final String fourText = 'Activa';

  final String secondAccessibilityText = 'Información sobre el ';
  final String thirdAccessibilityText = 'Saldo disponible:';
  final String fourAccessibilityText = 'Estado:';

  bool _isBalanceHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accesibilidad Oculta'),
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
                  Text(
                    firstText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Semantics(
                    label: '$secondAccessibilityText $secondText',
                    excludeSemantics: true,
                    onTap: () {
                      setState(() {
                        _isBalanceHidden = false;
                      });
                    },
                    child: Text(secondText),
                  ),
                  Semantics(
                    label: '$thirdAccessibilityText $thirdText',
                    excludeSemantics: true,
                    hidden: _isBalanceHidden,
                    child: Text(thirdText),
                  ),
                  Semantics(
                    label: '$fourAccessibilityText $fourText',
                    excludeSemantics: true,
                    child: Text(
                      fourText,
                      style: const TextStyle(
                        color: Colors.indigo,
                      ),
                    ),
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

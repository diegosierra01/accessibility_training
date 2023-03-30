import 'package:accesibility_training/hidden_accessibility_page.dart';
import 'package:accesibility_training/live_region_page.dart';
import 'package:accesibility_training/order_accessibility_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HiddenAccessibilityPage.route: (_) => const HiddenAccessibilityPage(),
        LiveRegionPage.route: (_) => const LiveRegionPage(),
        OrderAccessibilityPage.route: (_) => const OrderAccessibilityPage(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplos de accesibilidad'),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Orden de Nodos'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () => Navigator.pushNamed(
                        context, OrderAccessibilityPage.route),
                  ),
                  ListTile(
                    title: const Text('Accesibilidad oculta'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () => Navigator.pushNamed(
                        context, HiddenAccessibilityPage.route),
                  ),
                  ListTile(
                    title: const Text('Region viva'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () =>
                        Navigator.pushNamed(context, LiveRegionPage.route),
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

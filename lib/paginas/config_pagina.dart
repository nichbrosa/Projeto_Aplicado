import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
import 'package:projeto_aplicado/modelos/restaurante2.dart';
import 'package:provider/provider.dart';
import 'package:projeto_aplicado/temas/theme_provider.dart';

class ConfigPagina extends StatelessWidget {
  const ConfigPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildConfigOption(
              context,
              "Modo Escuro",
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return CupertinoSwitch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) => themeProvider.toggleTheme(),
                  );
                },
              ),
            ),
 const SizedBox(height: 10),
            _buildConfigOption(
              context,
              "Contem Gluten",
              Consumer2<Restaurante, Restaurante2>(
                builder: (context, restauranteProvider, restaurante2Provider, child) {
                  return CupertinoSwitch(
                    value: restauranteProvider.glutenIsVisible,
                    onChanged: (value) {
                      restauranteProvider.toggleGlutenVisibility();
                      restaurante2Provider.toggleGlutenVisibility();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _buildConfigOption(
              context,
              "Contem Lactose",
              Consumer2<Restaurante, Restaurante2>(
                builder: (context, restauranteProvider, restaurante2Provider, child) {
                  return CupertinoSwitch(
                    value: restauranteProvider.leiteIsVisible,
                    onChanged: (value) {
                        restauranteProvider.toggleLeiteVisibility();
                        restaurante2Provider.toggleLeiteVisibility();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigOption(
      BuildContext context, String title, Widget switchWidget) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: switchWidget,
          ),
        ],
      ),
    );
  }
}

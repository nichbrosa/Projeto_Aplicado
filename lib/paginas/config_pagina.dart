import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aplicado/modelos/restaurante.dart';
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
              "Sem Gluten",
              Consumer<Restaurante>(
                builder: (context, restauranteProvider, child) {
                  return CupertinoSwitch(
                    value: restauranteProvider.glutenIsVisible,
                    onChanged: (value) => restauranteProvider.toggleGlutenVisibility(),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _buildConfigOption(
              context,
              "Sem Leite",
              Consumer<Restaurante>(
                builder: (context, restauranteProvider, child) {
                  return CupertinoSwitch(
                    value: restauranteProvider.leiteIsVisible,
                    onChanged: (value) => restauranteProvider.toggleLeiteVisibility(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigOption(BuildContext context, String title, Widget switchWidget) {
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

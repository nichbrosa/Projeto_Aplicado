import 'package:flutter/material.dart';
import 'package:projeto_aplicado/componentes/my_button.dart';
import 'package:projeto_aplicado/modelos/comida.dart';

class ComidaPagina extends StatefulWidget {
  final Comida comida;
  final Map<Complemento, bool> ComplementoSelecionado = {};

   ComidaPagina({
     super.key,
     required this.comida,
    }){
      // inicializar complementos selecionados que sao falsos
      for (Complemento complemento in comida.complementosDisponiveis){
        ComplementoSelecionado[complemento] = false;
      }
    }

  @override
  State<ComidaPagina> createState() => _ComidaPaginaState();
}

class _ComidaPaginaState extends State<ComidaPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            //imagem da comida
            Image.asset(widget.comida.caminhoImagem),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nome da comida
                  Text(
                    widget.comida.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,
                    ),
                  ),
        
                  //preco comida
                  Text(
                    'R\$' + widget.comida.preco.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
        
                  const SizedBox(height: 10),
        
                   //descricao da comida
                  Text(widget.comida.descricao),
              
                  const SizedBox(height: 10),
          
                  //addons
                   Text("Complementos", style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
        
                  const SizedBox(height: 10),
        
                  Divider(color: Theme.of(context).colorScheme.secondary),
        
                  const SizedBox(height: 10),
        
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.comida.complementosDisponiveis.length,
                      itemBuilder: (context, index) {
                      //pegue complementos individualmente
                       Complemento complemento = widget.comida.complementosDisponiveis[index];
                                
                      //retorne a UI da check box
                      return CheckboxListTile(
                        title: Text(complemento.nome),
                        subtitle: Text('R\$' + complemento.preco.toStringAsFixed(2),
                        style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, 
                        ),
                      ),                     
                        value: widget.ComplementoSelecionado[complemento],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.ComplementoSelecionado[complemento] = value!;
                          });
                        }
                     );
                    },
                                   ),
                  ),
                ],
              ),
            ),
        
            //botao -> adicionar ao carrinho
            MyButton(
              onTap: (){}, 
              text: "Adicionar ao carrinho"
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
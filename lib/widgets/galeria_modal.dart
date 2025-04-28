import 'package:flutter/material.dart';

//Widget para a galeria das imagens
class GaleriaModal extends StatefulWidget {
  final List<String> imagens;

  const GaleriaModal({super.key, required this.imagens});

  @override
  State<GaleriaModal> createState() => _GaleriaModalState();
}

//Estado do widget GaleriaModal
class _GaleriaModalState extends State<GaleriaModal> {
  int _indiceAtual = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _indiceAtual);
  }

  void _abrirGaleria() {

    //Atualiza dentro da função o PageController com o índice atual
    _pageController = PageController(initialPage: _indiceAtual);

    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(

          //Fechar ao deslizar o modal
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 10) {
              Navigator.of(context).pop();
            }
          },
          child: Dialog(
            backgroundColor: Colors.black54,
            insetPadding: EdgeInsets.all(8),
            child: StatefulBuilder(
              builder: (context, setStateModal) {
                return Stack(
                  alignment: Alignment.center,
                  children: [

                    // Navegação entre imagens usando PageView
                    PageView.builder(
                      itemCount: widget.imagens.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _indiceAtual = index;
                        });
                        setStateModal(() {});
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.imagens[index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),

                    //Indicador de posição da imagem no modal
                    Positioned(
                      bottom: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Imagem ${_indiceAtual + 1} de ${widget.imagens.length}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    //Botão para a imagem anterior no modal
                    if (_indiceAtual > 0) 
                      Positioned(
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
                            onPressed: () {
                              if (_indiceAtual > 0) {
                                setState(() {
                                  _indiceAtual--;
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                      ),

                    //Botão para a próxima imagem no modal
                    if (_indiceAtual < widget.imagens.length - 1)
                      Positioned(
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_sharp, color: Colors.white),
                            onPressed: () {
                              if (_indiceAtual < widget.imagens.length - 1) {
                                setState(() {
                                  _indiceAtual++;
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                      ),

                    //Botão para fechar o modal
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              }
            )
          )
        );
      },
    );
  }

  //Construção da interface
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _abrirGaleria,
      child: Stack(
        alignment: Alignment.center,
        children: [

          //Imagem com animação de troca
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.asset(
              widget.imagens[_indiceAtual],
              key: ValueKey<int>(_indiceAtual),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),

          //Indicador de posição da imagem na página
          Positioned(
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Imagem ${_indiceAtual + 1} de ${widget.imagens.length}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          //Botão para ver imagem anterior ná página
          if (_indiceAtual > 0)
            Positioned(
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      if (_indiceAtual > 0) {
                        _indiceAtual--;
                      }
                    });
                  },
                ),
              ),
            ),

          //Botão para ver próxima imagem na página
          if (_indiceAtual < widget.imagens.length - 1)
            Positioned(
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_sharp, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (_indiceAtual < widget.imagens.length - 1) {
                        _indiceAtual++;
                      }
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

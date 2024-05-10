import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false, //To not let close clicking outside pop up
      builder:(context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Dolore cillum enim tempor enim ipsum veniam dolor. Eu ipsum occaecat mollit irure ad amet nisi. Do in et aliquip est voluptate labore cupidatat. Magna reprehenderit consequat nisi nulla laboris elit labore. In aliquip eiusmod officia ullamco Lorem ad minim velit. Enim id est adipisicing et officia Lorem ea excepteur.'),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Cancelar'),
          ),

          FilledButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Est dolore quis amet est aliquip deserunt aute culpa sint cillum sunt sint occaecat. Cupidatat laboris elit cillum ex consequat irure ad adipisicing consectetur aliqua nostrud do. Consequat quis ea laboris et ut aliquip culpa duis qui. Eu excepteur magna laborum nostrud magna laboris Lorem velit aliquip veniam sunt id velit anim.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context), 
                child: Text('Mostrar dialogo de pantalla')
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}

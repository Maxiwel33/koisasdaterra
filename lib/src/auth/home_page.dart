import 'package:flutter/material.dart';
import 'package:koisasdaterra/src/components/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Image.asset(
              'assets/image/001logo.png',
              height: 200,
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //!email
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    isSecret: false,
                  ),
                  //*senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),
                  //!Botao de Acesso
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                      onPressed: () {},
                      child: const Text(
                        'Acesso',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  //*Texto Esquece senha ***************
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  //!linha dividir ***********************
                  const Divider(
                    color: Colors.amber,
                    thickness: 1,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.amber,
                        )),
                    onPressed: () {},
                    child: const Text('Criar Conta'),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

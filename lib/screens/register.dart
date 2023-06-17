import 'package:flutter/material.dart';

void main() => runApp(register());


class register extends StatelessWidget {
  const register({super.key});

  // const MyApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text ('Register'),
      ),
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Card(
              elevation: 8,
              margin: EdgeInsets.only(left: 16.0,right: 16.0),
              child:
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Name'
                      ),
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email'
                      ),
                    ),
                    const TextField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                    ),
                    const TextField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password'
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/categories');
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 36)),
                      child: const Text ('Register'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text('<- Back to login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ]),
      ),
    );
  }
}

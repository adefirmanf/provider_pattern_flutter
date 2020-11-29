import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Bloc.observer = CounterObserver();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterState(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CounterState counter = CounterState();
    return MaterialApp(
      title: "Hello world",
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateCounterState();
}

class _StateCounterState extends State<CounterWidget> {
  // CounterState counterState;
  // // get counter => _counter;
  // void increment() => setState(() => {counterState.increment()});
  // void decrement() => setState(() => {counterState.decrement()});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
      ),
      body: Center(
          child: Consumer<CounterState>(builder: (context, state, child) {
        return Text(state.counter.toString());
      })),
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => {
                Provider.of<CounterState>(context, listen: false).increment()
              },
              child: Text("+"),
            ),
            FlatButton(
              onPressed: () => {
                Provider.of<CounterState>(context, listen: false).decrement()
              },
              child: Text("-"),
            )
          ],
        ),
      ),
    );
  }
}

class CounterState extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

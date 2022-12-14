import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ohTurn = true;
  List<String> exohs = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int xScore = 0;
  int ohScore = 0;
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Player X',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            xScore.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Player O',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            ohScore.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Text(
                        exohs[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  reset();
                  _clearBoard();
                },
                child: const Text('Reset'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(
      () {
        if (ohTurn && exohs[index] == '') {
          exohs[index] = 'o';
          filledBoxes += 1;
        } else if (!ohTurn && exohs[index] == '') {
          filledBoxes += 1;
          exohs[index] = 'x';
        }
        ohTurn = !ohTurn;
        _checkWinner();
      },
    );
  }

  void _checkWinner() {
    if (exohs[0] == exohs[1] && exohs[0] == exohs[2] && exohs[0] != '') {
      return _winDialog(exohs[0]);
    }
    if (exohs[3] == exohs[4] && exohs[3] == exohs[5] && exohs[3] != '') {
      return _winDialog(exohs[3]);
    }
    if (exohs[6] == exohs[7] && exohs[6] == exohs[8] && exohs[6] != '') {
      return _winDialog(exohs[6]);
    }
    if (exohs[0] == exohs[3] && exohs[0] == exohs[6] && exohs[0] != '') {
      return _winDialog(exohs[0]);
    }
    if (exohs[1] == exohs[4] && exohs[1] == exohs[7] && exohs[1] != '') {
      return _winDialog(exohs[1]);
    }
    if (exohs[2] == exohs[5] && exohs[2] == exohs[8] && exohs[2] != '') {
      return _winDialog(exohs[2]);
    }
    if (exohs[0] == exohs[4] && exohs[0] == exohs[8] && exohs[0] != '') {
      return _winDialog(exohs[0]);
    }
    if (exohs[2] == exohs[4] && exohs[2] == exohs[6] && exohs[2] != '') {
      return _winDialog(exohs[2]);
    } else if (filledBoxes == 9) {
      _drawDialog();
    }
  }

  void _winDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Winner is :$winner'),
          actions: [
            ElevatedButton(
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      xScore += 1;
    }
  }

  _drawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: [
            ElevatedButton(
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          exohs[i] = '';
        }
      },
    );
    filledBoxes = 0;
  }

  void reset() {
    setState(
      () {
        xScore = 0;
        ohScore = 0;
      },
    );
  }
}

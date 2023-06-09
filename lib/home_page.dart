
import 'package:flutter/material.dart';
import 'package:memory_game/utils/game_logic.dart';
import 'package:memory_game/widget/score_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game1 _game = Game1();
  int tries = 0;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.intiGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
  //    appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Memory Game',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: unnecessary_brace_in_string_interps
              scoreBoard('tries'.toUpperCase(), "${tries}"),
              // ignore: unnecessary_brace_in_string_interps
              scoreBoard('score'.toLowerCase(), "${score}"),
            ],
          ),
          SizedBox(
              height:550,
              width:double.infinity,
              child: GridView.builder(
                itemCount:12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0),
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print(_game.cards_list[index]);
                      setState(() {
                        tries++;
                        _game.gameImg![index] = _game.cards_list[index];
                        _game.matcheck.add({index: _game.cards_list[index]});
                      });
                      if (_game.matcheck.length == 2) {
                        if (_game.matcheck[0].values.first ==
                            _game.matcheck[1].values.first) {
                          // ignore: avoid_print
                          print('true');
                          score += 100;
                          _game.matcheck.clear();
                        } else {
                          // ignore: avoid_print
                          print(false);
                          Future.delayed(Duration(milliseconds: 500), () {
                            print(_game.gameImg);
                            setState(() {
                              _game.gameImg![_game.matcheck[0].keys.first] =
                                  _game.hiddenCardpath;
                              _game.gameImg![_game.matcheck[1].keys.first] =
                                  _game.hiddenCardpath;
                              _game.matcheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                          child: Image.asset(_game.gameImg![index]),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

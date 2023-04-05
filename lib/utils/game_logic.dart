class Game1 {
  final String hiddenCardpath = 'images/help.png';
  List<String>? gameImg;
  final List<String> cards_list = [
    "images/1.png",
    "images/1.png",
    "images/2.png",
    "images/2.png",
    "images/3.png",
    "images/3.png",
    "images/4.png",
    "images/4.png",
    "images/5.png",
    "images/5.png",
    "images/6.png",
    "images/6.png",
  ];
  List<Map<int, String>> matcheck = [];
  final int cardCount = 12;
  void intiGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}

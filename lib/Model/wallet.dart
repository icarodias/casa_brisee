class Wallet {
  int id;
  double money;

  Wallet({required this.id, this.money = 0});

  sell(value) => money += value;

  buy(value) => money -= value;

  String toString() => 'Wallet{id:$id, money:$money}';

  Map<String, dynamic> toMap() => {"money": money};
}

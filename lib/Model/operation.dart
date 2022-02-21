class Operation {
  final int id;
  final String description;
  final double value;
  final int type; // IF 1 THEN IS BUY ELSE IT IS SELL
  String get today => formatedDate();
  String get typeDescription => type == 1 ? "Compra" : "Venda";

  String formatedDate() {
    String dateAndTime = (DateTime.now()).toString();
    List dateArray = dateAndTime.split(" ");
    List today = (dateArray[0]).split("-");
    return '${today[2]}/${today[1]}/${today[0]}';
  }

  Operation({
    required int this.id,
    required String this.description,
    required double this.value,
    required int this.type,
  });

  String toString() =>
      'Product{id:$id, type:$type ($typeDescription), description:$description, value:$value, date:$today}';

  Map<String, dynamic> toMap() =>
      {"date": today, "description": description, "value": value, "type": type};
}

class Game {
  final int turns;
  final int food;
  final int water;
  final int ore;
  final int units;
  final int reserve;
  final int unitReserveGeneration;
  final int id;

  Game({this.turns, this.food, this.water, this.ore, this.units, this.reserve,  this.unitReserveGeneration, this.id});

  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
      turns: json['turns'],
      food: json['food'],
      water: json['water'],
      ore: json['ore'],
      units: json['units'],
      reserve: json['reserve'],
      unitReserveGeneration: int.parse(json['unit_reserve_generation']),
      id: json['id']
    );
  }
}
import '../data/models/ship_model.dart';

enum ShipStatus { ini, lodaeng, success, error }

class ShipStates {
  final ShipStatus shipStatus;
  String? errorMessage;
  List<ShipModel>? ships;

  ShipStates(
      {this.shipStatus = ShipStatus.ini,
      this.errorMessage,
      this.ships = const []});

  ShipStates cobyWith({
    ShipStatus? shipStatus,
    String? errorMessage,
    List<ShipModel>? ships,
  }) {
    return ShipStates(
        errorMessage: errorMessage ?? this.errorMessage,
        shipStatus: shipStatus ?? this.shipStatus,
        ships: ships ?? this.ships);
  }

  ShipStates.lodenig(this.shipStatus);

  ShipStates.error(
    this.shipStatus,
    String this.errorMessage,
  );

  ShipStates.success(
    this.shipStatus,
    this.ships,
  );
}

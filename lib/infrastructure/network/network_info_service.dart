import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkInfoService {
  NetworkInfoService(this._connectivity);

  final Connectivity _connectivity;

  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none) == false;
  }

  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((result) => result.contains(ConnectivityResult.none) == false);
  }
}

@module
abstract class ConnectivityModule {
  @injectable
  Connectivity connectivity() => Connectivity();
}

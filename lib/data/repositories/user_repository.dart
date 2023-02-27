import 'package:esjourney/data/models/user_model.dart';
import 'package:esjourney/data/providers/user_data_provider.dart';
import 'package:esjourney/data/repositories/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final UserDataProvider _userDataProvider = UserDataProvider();

  @override
  Future<dynamic> signIn(String? id,String password) async {
    final result = await _userDataProvider.signIn(id,password);
    return result.statusCode == 200 ? User.fromJson(result.data) : null;
  }

  @override
  Future sendEth(
      String senderAddress, String senderPrivateKey, double amount, String token) async {
    final result = await _userDataProvider.sendEth(
        senderAddress, senderPrivateKey,amount , token);
    print("result: $result");
    return result.statusCode == 200 ? User.fromJson(result.data) : null;
  }
}
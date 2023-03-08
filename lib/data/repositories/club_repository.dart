
import 'package:esjourney/data/models/club_model.dart';
import 'package:esjourney/data/providers/club_data_provider.dart';
import 'package:esjourney/data/repositories/club_repository_interface.dart';

class ClubRepository implements IClubRepository {
  final ClubDataProvider _clubDataProvider = ClubDataProvider();

  @override
  Future<dynamic> getAllClubs() async {
   final result = await _clubDataProvider.getAllClubs();
    return result.statusCode == 200
        ? result.data.map((club) => Club.fromJson(club)).toList()
        : null;
  }
}
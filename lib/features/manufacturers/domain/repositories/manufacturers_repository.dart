import '../../../../core/constants/type_defs.dart';
import '../entities/manufacturers_response.dart';

abstract interface class ManufacturersRepository {
  FutureEither<ManufacturersResponse> getManufacturers({
    required String query,
    required int page,
    required int limit,
  });
  FutureEither<void> deleteManufacturer(String id);
}

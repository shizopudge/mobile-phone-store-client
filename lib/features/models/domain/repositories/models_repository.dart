import '../../../../core/constants/type_defs.dart';
import '../entities/models_response.dart';

abstract interface class ModelsRepository {
  FutureEither<ModelsResponse> getModels({
    required String manufacturerId,
    required String query,
    required int page,
    required int limit,
  });
  FutureEither<void> deleteModel(String id);
}

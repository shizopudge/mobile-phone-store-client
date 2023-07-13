import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/model.dart';

abstract interface class CreateEditModelRepository {
  FutureEither<Model> createModel({
    required String name,
    required String description,
    required String manufacturerId,
    required int pixelDensity,
    required int screenRefreshRate,
    required double screenDiagonal,
    required int weight,
    required String screenResolution,
    required OperatingSystem operatingSystem,
    required DisplayType displayType,
  });
  FutureEither<Model> editModel({
    required String id,
    required String name,
    required String description,
    required String manufacturerId,
    required int pixelDensity,
    required int screenRefreshRate,
    required double screenDiagonal,
    required int weight,
    required String screenResolution,
    required OperatingSystem operatingSystem,
    required DisplayType displayType,
  });
}

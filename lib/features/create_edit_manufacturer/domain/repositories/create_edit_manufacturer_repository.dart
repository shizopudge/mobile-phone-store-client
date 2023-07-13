import 'dart:io';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/manufacturer.dart';

abstract interface class CreateEditManufacturerRepository {
  FutureEither<Manufacturer> createManufacturer({required String name});
  FutureEither<Manufacturer> editManufacturer(
      {required String id, required String name});
  FutureEither<String> uploadImage({required String id, required File image});
  FutureEither<void> deleteImage(String id);
}

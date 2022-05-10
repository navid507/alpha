import 'package:freezed_annotation/freezed_annotation.dart';

import 'gallery.dart';


part 'gallery_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class GalleryResult with _$GalleryResult{
  const factory GalleryResult.success(AlphaImageGallery gallery) = SuccessGallery;
  const factory GalleryResult.error(int code, String msg) = ErrorGallery;
}
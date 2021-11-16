import 'package:alpha/back/accounting/models/record/record.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'record_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class RecordsResult with _$RecordsResult{
  const factory RecordsResult.success(List<Record> records) = SuccessRecords;
  const factory RecordsResult.error(int code, String msg) = ErrorRecords;
}


import 'package:dokan/modules/home/models/filter_option.dart';
import 'package:get_storage/get_storage.dart';

FilterOption getCheckedFilter() {
  String storedValue = GetStorage().read('checkedFilter') ?? FilterOption.Newest.name;
  return FilterOption.values.firstWhere((e) => e.name == storedValue);
}

void setCheckedFilter(FilterOption filter) {
  GetStorage().write('checkedFilter', filter.name);
}

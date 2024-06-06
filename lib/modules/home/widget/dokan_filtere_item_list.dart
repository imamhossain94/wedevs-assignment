import 'package:flutter/material.dart';
import 'package:dokan/core/services/storage_service.dart';
import 'package:dokan/modules/home/models/filter_option.dart';
import 'filter_item.dart';

class DokanFilterItemList extends StatefulWidget {
  final ValueChanged<FilterOption> onValueChanged;
  const DokanFilterItemList({super.key, required this.onValueChanged});

  @override
  State<DokanFilterItemList> createState() => _DokanFilterItemListState();
}

class _DokanFilterItemListState extends State<DokanFilterItemList> {
  FilterOption? selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = getCheckedFilter();
  }

  void handleFilterChange(FilterOption filter) {
    setState(() {
      selectedFilter = filter;
    });
    setCheckedFilter(filter);
    widget.onValueChanged(filter);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FilterOption.values.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final filter = FilterOption.values[index];
        return FilterItem(
          title: filter.name,
          isSelected: selectedFilter == filter,
          onValueChanged: () => handleFilterChange(filter),
        );
      },
    );
  }
}

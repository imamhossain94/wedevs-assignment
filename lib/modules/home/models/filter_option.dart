enum FilterOption {
  Newest,
  Oldest,
  PriceLowToHigh,
  PriceHighToLow,
  BestSelling,
}

extension FilterOptionExtension on FilterOption {
  String get name {
    switch (this) {
      case FilterOption.Newest:
        return "Newest";
      case FilterOption.Oldest:
        return "Oldest";
      case FilterOption.PriceLowToHigh:
        return "Price low > High";
      case FilterOption.PriceHighToLow:
        return "Price high > Low";
      case FilterOption.BestSelling:
        return "Best selling";
      default:
        return "";
    }
  }
}

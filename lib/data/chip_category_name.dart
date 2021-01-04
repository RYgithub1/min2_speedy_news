
/// [Class to exchange lang]
class ChipCategoryName {

  final categoryId;
  final categoryNameEn;
  final categoryNameJp;
  ChipCategoryName({this.categoryId, this.categoryNameEn, this.categoryNameJp});

}


final List<ChipCategoryName> categories = [
  ChipCategoryName(categoryId: 0, categoryNameEn: "general", categoryNameJp: "総合"),
  ChipCategoryName(categoryId: 1, categoryNameEn: "business", categoryNameJp: "ビジネス"),
  ChipCategoryName(categoryId: 2, categoryNameEn: "technology", categoryNameJp: "テクノロジー"),
  ChipCategoryName(categoryId: 3, categoryNameEn: "science", categoryNameJp: "科学"),
  ChipCategoryName(categoryId: 4, categoryNameEn: "health", categoryNameJp: "健康"),
  ChipCategoryName(categoryId: 5, categoryNameEn: "sports", categoryNameJp: "スポーツ"),
  ChipCategoryName(categoryId: 6, categoryNameEn: "entertainment", categoryNameJp: "エンタメ"),
];
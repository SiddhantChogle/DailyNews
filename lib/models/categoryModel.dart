class CategoryModel {
  String categoryName;
  String categoryImage;

  CategoryModel({this.categoryName, this.categoryImage});
}

List<CategoryModel> categoryList = [
  CategoryModel(
    categoryName: "Business",
    categoryImage: "lib/assets/images/business.jpg",
  ),
  CategoryModel(
    categoryName: "Entertainment",
    categoryImage: "lib/assets/images/entertainment.jpg",
  ),
  CategoryModel(
    categoryName: "General",
    categoryImage: "lib/assets/images/general.jpg",
  ),
  CategoryModel(
    categoryName: "Health",
    categoryImage: "lib/assets/images/health.jpg",
  ),
  CategoryModel(
    categoryName: "Science",
    categoryImage: "lib/assets/images/science.jpg",
  ),
  CategoryModel(
    categoryName: "Sports",
    categoryImage: "lib/assets/images/sports.jpg",
  ),
  CategoryModel(
    categoryName: "Technology",
    categoryImage: "lib/assets/images/technology.jpg",
  ),
];

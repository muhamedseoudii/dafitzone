class DaFitZoneModel {
  DaFitZoneModel({
    required this.success,
    required this.message,
    required this.data,
  });

  late final bool success;
  late final String message;
  late final Data data;

  DaFitZoneModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  late final int currentPage;
  late final List<ResponseData> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Links> links;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data =
        List.from(json['data']).map((e) => ResponseData.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }
}

class ResponseData {
  int id;
  String programName;
  String programNote;
  String isMain;
  String createdAt;
  List<DietProgramMeal> dietProgramMeal;

  ResponseData(
      {required this.id,
      required this.programName,
      required this.programNote,
      required this.isMain,
      required this.createdAt,
      required this.dietProgramMeal});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      id: json['id'],
      programName: json['program_name'],
      programNote: json['program_note'] ?? '',
      isMain: json['is_main'],
      createdAt: json['created_at'],
      dietProgramMeal: List.from(json['diet_program_meal'])
          .map((e) => DietProgramMeal.fromJson(e))
          .toList(),
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['program_name'] = programName;
//   data['program_note'] = programNote;
//   data['is_main'] = isMain;
//   data['created_at'] = createdAt;
//   if (dietProgramMeal != null) {
//     data['diet_program_meal'] =
//         dietProgramMeal!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }
}

class DietProgramMeal {
  int id;
  String mealName;
  List<DietProgramMealElement> dietProgramMealElement;

  DietProgramMeal(
      {required this.id,
      required this.mealName,
      required this.dietProgramMealElement});

  factory DietProgramMeal.fromJson(Map<String, dynamic> json) {
    return DietProgramMeal(
      id: json['id'],
      mealName: json['meal_name'],
      dietProgramMealElement: List.from(json['diet_program_meal_element'])
          .map((e) => DietProgramMealElement.fromJson(e))
          .toList(),
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['meal_name'] = mealName;
//   if (dietProgramMealElement != null) {
//     data['diet_program_meal_element'] =
//         dietProgramMealElement!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }
}

class DietProgramMealElement {
  int id;
  String quantity;
  FoodElement foodElement;

  DietProgramMealElement(
      {required this.id, required this.quantity, required this.foodElement});

  factory DietProgramMealElement.fromJson(Map<String, dynamic> json) {
    return DietProgramMealElement(
      id: json['id'],
      quantity: json['quantity'],
      foodElement: FoodElement.fromJson(json['food_element']),
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['quantity'] = quantity;
//   if (foodElement != null) {
//     data['food_element'] = foodElement!.toJson();
//   }
//   return data;
// }
}

class FoodElement {
  int id;
  String foodCategoryId;
  String name;
  String description;
  String calories;
  String protein;
  String carbohydrates;
  String fat;
  String sugar;
  String fiber;

  FoodElement(
      {required this.id,
      required this.foodCategoryId,
      required this.name,
      required this.description,
      required this.calories,
      required this.protein,
      required this.carbohydrates,
      required this.fat,
      required this.sugar,
      required this.fiber});

  factory FoodElement.fromJson(Map<String, dynamic> json) {
    return FoodElement(
      id: json['id'],
      foodCategoryId: json['food_category_id'],
      name: json['name'],
      description: json['description'],
      calories: json['calories'],
      protein: json['protein'],
      carbohydrates: json['carbohydrates'],
      fat: json['fat'],
      sugar: json['sugar'],
      fiber: json['fiber'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['food_category_id'] = foodCategoryId;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['calories'] = calories;
  //   data['protein'] = protein;
  //   data['carbohydrates'] = carbohydrates;
  //   data['fat'] = fat;
  //   data['sugar'] = sugar;
  //   data['fiber'] = fiber;
  //   return data;
  // }
}

class Links {
  Links({
    this.url,
    required this.label,
    required this.active,
  });

  late final String? url;
  late final String label;
  late final bool active;

  Links.fromJson(Map<String, dynamic> json) {
    url = null;
    label = json['label'];
    active = json['active'];
  }
}

// import 'package:collection/collection.dart' show IterableExtension;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/category/category_model.dart';

import '../../../../../common/constants/exceptions.dart';

import '../services/category/category_services.dart';

final categoryListProvider =
StateNotifierProvider<CategoryController, List<CategoryModel>>(
        (ref) => CategoryController(ref));

//final filterProvider = StateProvider((ref) => Filter.issued);


/////changes needs to be made to filter the categories accordingly

final filteredTodoListProvider = ProviderFamily<List<CategoryModel>, Filter>((ref, filter) {
  // final filter = ref.watch(filterProvider);
  final invoices = ref.watch(categoryListProvider);

  switch (filter) {
    case Filter.clubs:
      return invoices
          .where((invoice) => invoice.category == 1)
          .toList();
    case Filter.cafe:
      return invoices.where((invoice) => invoice.category == 2).toList();

    case Filter.artGallery:
      return invoices.where((invoice) => invoice.category == 5).toList();

    case Filter.beach:
      return invoices.where((invoice) => invoice.category == 0).toList();

    case Filter.lounge:
      return invoices.where((invoice) => invoice.category == 1).toList();

    case Filter.restaurants:
      return invoices.where((invoice) => invoice.category == 2).toList();

    default:
      return [];
  }
});


class CategoryController extends StateNotifier<List<CategoryModel>> {
  final Ref? _read;
  CategoryController([this._read]) : super(const []) {
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      // int? id;
      final invoices = await _read!.read(categoryServiceProvider).getCategories();
      state = invoices;
    } on CustomException {
      state = [];
    }
  }
}

enum Filter {
  clubs,
  artGallery,
  beach,
  cafe,
  lounge,
  restaurants,
}

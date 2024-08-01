import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo _productRepo;
  ProductListBloc(this._productRepo) : super(ProductListLoadingState()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInitialEvent) {
        emit(ProductListLoadingState());
        try {
          final products = await _productRepo.getAllByCategory(event.param);
          if (products.isEmpty) {
            emit(ProductListEmptyState());
          } else {
            emit(ProductListSuccessState(products));
          }
        } on Exception catch (e) {
          emit(ProductListErrorState(e.toString()));
        }
      }
    });
  }
}

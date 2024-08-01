import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/product_detail_model.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductRepo _productRepo;
  ProductDetailBloc(this._productRepo) : super(ProductDetailLoadingState()) {
    on<ProductDetailEvent>((event, emit) async {
      if (event is ProductDetailInitialEvent) {
        emit(ProductDetailLoadingState());
        try {
          final ProductDetailModel productDetail =
              await _productRepo.getProductDetail(event.productId);
          emit(ProductDetailSuccessState(productDetail));
        } on Exception catch (e) {
          emit(ProductDetailErrorState(e.toString()));
        }
      }
    });
  }
}

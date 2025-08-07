abstract class FavoritesEvent {
  final int? page;
  const FavoritesEvent({this.page});
}

class GetFavorites extends FavoritesEvent {
  const GetFavorites(int page) : super(page: page);
}

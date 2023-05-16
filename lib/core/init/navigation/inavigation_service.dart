abstract class INavigationService {
  Future<void> navigationToPage({required String path, required Object data});

  Future<void> navigationToPageClear({required String path, required Object data});
}

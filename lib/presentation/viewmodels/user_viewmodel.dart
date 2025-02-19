import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/get_users.dart';

class UserViewModel extends GetxController {
  final GetUsers getUsersUseCase;

  var users = <User>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  UserViewModel(this.getUsersUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      users.value = await getUsersUseCase();
    } catch (e) {
      errorMessage.value =
          'Ops... Ocorreu uma falha ao carregar usuários. Tente novamente mais tarde.';
    } finally {
      isLoading.value = false;
    }
  }
}

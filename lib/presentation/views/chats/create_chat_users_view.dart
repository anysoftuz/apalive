import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/presentation/views/chats/create_chat_view.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class CreateChatUsersView extends StatefulWidget {
  const CreateChatUsersView({super.key});

  @override
  State<CreateChatUsersView> createState() => _CreateChatUsersViewState();
}

class _CreateChatUsersViewState extends State<CreateChatUsersView> {
  List<AllUserModel> selectedUsers = [];
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    context.read<AppBloc>().add(GetAllUsers());

    controller.addListener(() {
      search();
    });
  }

  void search() {
    String searchText = controller.text.toLowerCase();
    setState(() {
      selectedUsers =
          context.read<AppBloc>().state.allUsers.where((person) {
            return person.fullName.toLowerCase().contains(searchText);
          }).toList();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guruh azolari")),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  context.pop();
                },
                text: 'Bekor qilish',
                color: white,
                textColor: dark,
                border: Border.all(color: borderColor),
              ),
            ),
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => CreateChatView(selectedUsers: selectedUsers),
                    ),
                  );
                },
                text: 'Tasdiqlash',
                color: blue,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: CustomTextField(
              hintText: 'Qidirish',
              suffixIcon: AppIcons.search.svg(),
              controller: controller,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state.statusAllUsers.isInProgress) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                return ListView.builder(
                  itemCount:
                      controller.text.isEmpty
                          ? state.allUsers.length
                          : selectedUsers.length,
                  itemBuilder: (context, index) {
                    final model =
                        controller.text.isEmpty
                            ? state.allUsers[index]
                            : selectedUsers[index];
                    return ListTile(
                      onTap: () {
                        if (selectedUsers.contains(model)) {
                          selectedUsers.remove(model);
                        } else {
                          selectedUsers.add(model);
                        }
                        setState(() {});
                      },
                      title: Text(model.fullName),
                      subtitle: Text(model.username),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: white,
                        backgroundImage: NetworkImage(
                          model.photo.isEmpty
                              ? "https://academy.rudn.ru/static/images/profile_default.png"
                              : model.photo,
                        ),
                      ),
                      trailing: Checkbox.adaptive(
                        activeColor: blue,
                        value: selectedUsers.contains(model),
                        onChanged: (value) {},
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

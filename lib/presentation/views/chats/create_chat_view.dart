import 'dart:io';

import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/presentation/widgets/custom_snackbar.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/presentation/widgets/w_button.dart';
import 'package:apalive/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CreateChatView extends StatefulWidget {
  const CreateChatView({super.key, required this.selectedUsers});
  final List<AllUserModel> selectedUsers;

  @override
  State<CreateChatView> createState() => _CreateChatViewState();
}

class _CreateChatViewState extends State<CreateChatView> {
  File? images;
  late TextEditingController controller;

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickMedia();
      if (image != null) {
        images = File(image.path);
      }
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guruh tuzish")),
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
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return WButton(
                    onTap: () {
                      context.read<AppBloc>().add(
                        CreateChatEvent(
                          name: controller.text,
                          images: images,
                          users: widget.selectedUsers.map((e) => e.id).toList(),
                          onSucces: () {
                            context
                              ..pop()
                              ..pop();
                            CustomSnackbar.show(context, 'Group Yaratildi');
                          },
                          onError: () {
                            context
                              ..pop()
                              ..pop();
                            CustomSnackbar.show(
                              context,
                              'Group yaratilmadi keyinroq urunib ko\'ring',
                            );
                          },
                        ),
                      );
                    },
                    text: 'Saqlash',
                    color: blue,
                    isLoading: state.statusCreate.isInProgress,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              title: 'Sarlavha',
              hintText: 'Sarlavha',
              controller: controller,
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            Text(
              "Fayl yuklash ",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            SizedBox(height: 8),

            WScaleAnimation(
              onTap: () {
                imagesFile();
              },
              child: Container(
                height: 132,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F4F7),
                  borderRadius: BorderRadius.circular(16),
                  image:
                      images == null
                          ? null
                          : DecorationImage(
                            image: FileImage(images!),
                            fit: BoxFit.contain,
                          ),
                ),

                child:
                    images != null
                        ? null
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_download_outlined,
                              size: 40,
                              color: grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Yuklash uchun bosing',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                            Text('Fayl turi: PNG, JPG, SVG'),
                          ],
                        ),
              ),
            ),

            SizedBox(height: 16),
            Text(
              "Guruhga a’zolari",
              style: Theme.of(context).textTheme.titleSmall!,
            ),
            SizedBox(height: 8),
            ...List.generate(
              widget.selectedUsers.length,
              (index) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.selectedUsers[index].fullName),
                subtitle: Text(widget.selectedUsers[index].username),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    widget.selectedUsers[index].photo.isEmpty
                        ? "https://academy.rudn.ru/static/images/profile_default.png"
                        : widget.selectedUsers[index].photo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/assets/images/images.dart';
import 'package:apalive/data/models/teacher_user_model.dart';
import 'package:apalive/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademyView extends StatefulWidget {
  const AcademyView({super.key});

  @override
  State<AcademyView> createState() => _AcademyViewState();
}

class _AcademyViewState extends State<AcademyView> {
  List<Rahbariyat> rahbariyat = [
    Rahbariyat(
      image: AppImages.rahbariyat_1,
      name: 'Salixov Jasur Shavkatovich',
      jobTitle:
          'O‘zbekiston Respublikasi Prezidenti huzuridagi Davlat siyosati va boshqaruvi akademiyasi rektori',
    ),
    Rahbariyat(
      image: AppImages.rahbariyat_2,
      name: 'Azizov Xudoykul Tadjiyevich',
      jobTitle:
          'O‘zbekiston Respublikasi Prezidenti huzuridagi Davlat boshqaruvi akademiyasi o‘quv ishlari bo‘yicha birinchi prorektori',
    ),
    Rahbariyat(
      image: AppImages.rahbariyat_3,
      name: 'Umarov Alisher Yusubjanovich',
      jobTitle:
          'O‘zbekiston Respublikasi Prezidenti huzuridagi Davlat boshqaruvi akademiyasi ilmiy ishlar va xalqaro aloqalar bo‘yicha prorektori',
    ),
  ];

  @override
  void initState() {
    context.read<AppBloc>().add(ModeratorUserEvent());
    context.read<AppBloc>().add(TeacherUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Academy'),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 56),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: WTabBar(
                tabs: [
                  Tab(text: 'Rahbariyat'),
                  Tab(text: 'O’qituvchilar'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                //   child: CustomTextField(
                //     hintText: 'Rahbarni qidirish',
                //     prefixIcon: AppIcons.search.svg(),
                //   ),
                // ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemBuilder: (context, index) =>
                        ModeratorIteam(model: rahbariyat[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemCount: rahbariyat.length,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                //   child: Column(
                //     spacing: 12,
                //     children: [
                //       CustomTextField(
                //         hintText: 'O’qituvchi qidirish',
                //         prefixIcon: AppIcons.search.svg(),
                //       ),
                //       Row(
                //         spacing: 12,
                //         children: [
                //           Expanded(
                //             child: Container(
                //               height: 40,
                //               decoration: BoxDecoration(
                //                 border: Border.all(color: borderColor),
                //                 color: greyBack,
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 spacing: 8,
                //                 children: [
                //                   AppIcons.filter.svg(),
                //                   Text(
                //                     'Filter',
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.w600,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               height: 40,
                //               decoration: BoxDecoration(
                //                 border: Border.all(color: borderColor),
                //                 color: greyBack,
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 spacing: 8,
                //                 children: [
                //                   AppIcons.excel.svg(),
                //                   Text(
                //                     'Yuklab olish',
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.w600,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      if (state.statusTeacherUser.isInProgress) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state.teacherUser.isEmpty) {
                        return Center(child: Text('No data'));
                      }
                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        itemBuilder: (context, index) =>
                            TeacherIteam(model: state.teacherUser[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12),
                        itemCount: state.teacherUser.length,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ModeratorIteam extends StatelessWidget {
  const ModeratorIteam({super.key, required this.model});

  final Rahbariyat model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 420,
        child: Stack(
          children: [
            // Image.network(
            //   'https://images.unsplash.com/photo-1747102325393-2f811b02752e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D',
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            // ),
            model.image.imgAsset(fit: BoxFit.cover, width: double.infinity),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          model.jobTitle,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://www.facebook.com/',
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: AppIcons.facebook.svg(),
                            ),
                            SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://www.linkedin.com/',
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: AppIcons.lincedin.svg(),
                            ),
                            SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://www.instagram.com/',
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: AppIcons.instagram.svg(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ).frosted(frostColor: Colors.black.withValues(alpha: 0.1)),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherIteam extends StatelessWidget {
  const TeacherIteam({super.key, required this.model});
  final TeacherUserModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            spacing: 12,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: white,
                backgroundImage: NetworkImage(
                  model.photo ??
                      "https://academy.rudn.ru/static/images/profile_default.png",
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name} ${model.middleName} ${model.surname}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(model.phoneNumber),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('LAVOZIMI', style: TextStyle(fontWeight: FontWeight.w400)),
              Text(
                model.jobTitle,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TUG’ILGAN SANASI',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                model.birthDate,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('JINSI', style: TextStyle(fontWeight: FontWeight.w400)),
              Text(model.gender, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('TAJRIBASI', style: TextStyle(fontWeight: FontWeight.w400)),
              Text(
                "${model.workExperience} yil",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email', style: TextStyle(fontWeight: FontWeight.w400)),
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse(model.email);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Text(
                  model.email,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Rahbariyat {
  final String image;
  final String name;
  final String jobTitle;

  Rahbariyat({required this.image, required this.name, required this.jobTitle});
}

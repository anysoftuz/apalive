import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/presentation/views/chats/chats_view.dart';
import 'package:apalive/presentation/views/home/notification_view.dart';
import 'package:apalive/presentation/views/home/widgets/uzb_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BlocBuilder<AuthBloc, AuthState>(
          builder:
              (context, state) => Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: borderColor),
                ),
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: white,
                            backgroundImage: NetworkImage(
                              state.userModel.photo.isEmpty
                                  ? "https://academy.rudn.ru/static/images/profile_default.png"
                                  : state.userModel.photo,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: AppIcons.verifiedTick.svg(),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${state.userModel.name.isEmpty ? "Shahina" : state.userModel.name} ${state.userModel.surname.isEmpty ? "Usmanova" : state.userModel.surname} ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Hush kelibsiz!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).push(MaterialPageRoute(builder: (context) => ChatsView()));
            },
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor),
              ),
              child: AppIcons.message.svg(),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (context) => NotificationView()),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor),
              ),
              child: AppIcons.bell.svg(),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12,
              children: [
                HomeInfoContainer(
                  title: '3 000',
                  subtitle: 'O’qituvchilar',
                  icon: AppIcons.teaching.svg(),
                ),
                HomeInfoContainer(
                  title: '2 200',
                  subtitle: 'Bitiruvchilar',
                  icon: AppIcons.mortarboard.svg(),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              spacing: 12,
              children: [
                HomeInfoContainer(
                  title: '2 000',
                  subtitle: 'Magistratura',
                  icon: AppIcons.graduationScroll.svg(),
                ),
                HomeInfoContainer(
                  title: '2 200',
                  subtitle: 'Doktarantura',
                  icon: AppIcons.knowledge.svg(),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              spacing: 12,
              children: [
                HomeInfoContainer(
                  title: '3 000',
                  subtitle: 'Malaka oshirish',
                  icon: AppIcons.book.svg(),
                ),
                HomeInfoContainer(
                  title: '2 200',
                  subtitle: 'Qayta tayyorlash',
                  icon: AppIcons.diploma.svg(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Bitiruvchilar statistikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            UzbMap(),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFF5F5F5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toshkent viloyati',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  HomeRowInfo(title: 'Bitiruchilar:', subtitle: '23 560'),
                  SizedBox(height: 4),
                  HomeRowInfo(title: 'Erkaklar:', subtitle: '5 127'),
                  SizedBox(height: 4),
                  HomeRowInfo(title: 'Ayollar:', subtitle: '17 571'),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFF5F5F5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  HomeRowInfo(
                    title: 'Jami bitiruvchilar',
                    subtitle: '12 571 nafar',
                    fontSize: 16,
                  ),
                  HomeRowInfo(
                    title: 'Magistratura',
                    subtitle: '12 571 nafar',
                    fontSize: 16,
                  ),
                  HomeRowInfo(
                    title: 'Doktarantura',
                    subtitle: '12 571 nafar',
                    fontSize: 16,
                  ),
                  HomeRowInfo(
                    title: 'Malaka oshirish',
                    subtitle: '12 571 nafar',
                    fontSize: 16,
                  ),
                  HomeRowInfo(
                    title: 'Qayta tayyorlash',
                    subtitle: '12 571 nafar',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeRowInfo extends StatelessWidget {
  const HomeRowInfo({
    super.key,
    required this.title,
    required this.subtitle,
    this.fontSize = 12,
  });
  final String title;
  final String subtitle;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: fontSize),
        ),
        Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
        ),
      ],
    );
  }
}

class HomeInfoContainer extends StatelessWidget {
  const HomeInfoContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFF5F5F5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: gray500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

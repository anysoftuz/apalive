import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/assets/images/images.dart';
import 'package:apalive/data/models/graduate_user_model.dart';
import 'package:apalive/presentation/views/chats/chat_view.dart';
import 'package:apalive/presentation/widgets/w_scale_animation.dart';
import 'package:apalive/utils/log_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GraduatesInfoView extends StatefulWidget {
  const GraduatesInfoView({super.key, required this.model});
  final GraduateUserModel model;

  @override
  State<GraduatesInfoView> createState() => _GraduatesInfoViewState();
}

class _GraduatesInfoViewState extends State<GraduatesInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bitiruvchi")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 168,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: blue,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 12,
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundColor: white,
                                backgroundImage: NetworkImage(
                                  widget.model.photo.isEmpty
                                      ? "https://academy.rudn.ru/static/images/profile_default.png"
                                      : widget.model.photo,
                                ),
                              ),
                              Container(
                                height: 28,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: borderColor),
                                ),
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  spacing: 6,
                                  children: [
                                    CircleAvatar(
                                      radius: 3,
                                      backgroundColor: green,
                                    ),
                                    Text('Onlayn'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      '${widget.model.name} ${widget.model.middleName} ${widget.model.surname}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => ChatView(
                                      guid: widget.model.guid,
                                      photo: '',
                                      name: widget.model.name,
                                      isGroup: false,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor),
                            ),
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppIcons.message.svg(color: textPrimary700),
                                Text(
                                  'Xabar yuborish',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: WScaleAnimation(
                          onTap: () async {
                            final Uri phoneUri = Uri(
                              scheme: 'tel',
                              path: '+998901234567',
                            );
                            if (await canLaunchUrl(phoneUri)) {
                              await launchUrl(phoneUri);
                            } else {
                              Log.e('Qo‘ng‘iroq qilish mumkin emas: $phoneUri');
                            }
                          },
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor),
                            ),
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppIcons.phone.svg(
                                  color: textPrimary700,
                                  height: 20,
                                ),
                                Text(
                                  'Qo’ng’iroq qilish',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Umumiy ma’lumotlar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Bitiruvchi haqida umumiy ma’lumotlarni batafsil ko’rishingiz mumkin",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  if (widget.model.knownLanguages.isNotEmpty) ...[
                    SizedBox(height: 8),
                    UserInfoIteam(
                      title: 'Xorijiy tillarni bilishi',
                      subtitle: widget.model.knownLanguages
                          .map((e) => e.title)
                          .toList()
                          .join(', '),
                    ),
                  ],
                  if (widget.model.stateAwards.isNotEmpty) ...[
                    SizedBox(height: 8),
                    UserInfoIteam(
                      title: 'Davlat mukofotlari',
                      subtitle: widget.model.stateAwards
                          .map((e) => e.title)
                          .toList()
                          .join(', '),
                    ),
                  ],
                  if (widget.model.academicDegree.isNotEmpty) ...[
                    SizedBox(height: 8),
                    UserInfoIteam(
                      title: 'Ilmiy unvoni',
                      subtitle: widget.model.academicDegree
                          .map((e) => e.title)
                          .toList()
                          .join(', '),
                    ),
                  ],

                  if (widget.model.characterTraits.isNotEmpty) ...[
                    SizedBox(height: 8),
                    UserInfoIteam(
                      title: 'Ko’nikmalar va shaxsiy fazilatlar',
                      subtitle: widget.model.characterTraits
                          .map((e) => e.title)
                          .toList()
                          .join(', '),
                    ),
                  ],

                  SizedBox(height: 16),
                  Text(
                    "Postlar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Bitiruvchining erishgan shaxsiy va kasbiy yutuqlari haqida batafsil ma’lumot",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 372,
              width: double.infinity,
              child: ListView.separated(
                itemBuilder:
                    (context, index) => Container(
                      padding: EdgeInsets.all(16),
                      width: 268,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 156,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: blue,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Yangi texnologiyalar va innovatsiyalar – bizning bitiruvchilar ishtirokida',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: textPrimary900,
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Yangi texnologiyalar va innovatsiyalar – bizning bitiruvchilar ishtirokida',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: textPrimary900,
                            ),
                            maxLines: 3,
                          ),
                          Spacer(),
                          Row(
                            spacing: 12,
                            children: [
                              CircleAvatar(radius: 20),
                              Expanded(
                                child: Text(
                                  'AZIMOV BEKMIRZA RAHIMOVICH',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemCount: 12,
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aloqa ma’lumotlari',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Divider(height: 32),
                  Row(
                    spacing: 12,
                    children: [
                      AppIcons.phone.svg(),
                      Text(
                        '+998 94 498 12 12',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 12,
                    children: [
                      AppIcons.mail.svg(),
                      Text(
                        'azimova6565@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 12,
                    children: [
                      AppIcons.server.svg(),
                      Text(
                        'www.azimova.uz',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 32),
                  Text(
                    'Ijtimoiy tarmoqlar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Divider(height: 32),
                  Row(
                    spacing: 16,
                    children: [
                      NetworkButton(
                        icon: AppImages.instagram.imgAsset(),
                        onTap: () {},
                      ),
                      NetworkButton(
                        icon: AppImages.facebook.imgAsset(),
                        onTap: () {},
                      ),
                      NetworkButton(
                        icon: AppImages.telegram.imgAsset(),
                        onTap: () {},
                      ),
                      NetworkButton(
                        icon: AppImages.twitter.imgAsset(),
                        onTap: () {},
                      ),
                    ],
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

class UserInfoIteam extends StatelessWidget {
  const UserInfoIteam({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 242, 243),
        border: Border.all(color: backGroundColor),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(subtitle),
        ],
      ),
    );
  }
}

class NetworkButton extends StatelessWidget {
  const NetworkButton({super.key, required this.onTap, required this.icon});
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}

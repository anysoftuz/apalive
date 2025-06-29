import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/assets/images/images.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kutubxona'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              hintText: 'Materail qidirish',
              prefixIcon: AppIcons.search.svg(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: index == 0 ? blue : Color(0xFFF2F4F7),
                      border: Border.all(color: borderColor),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Barchasi',
                      style: TextStyle(color: index == 0 ? white : null),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: 12,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        AppImages.book.imgAsset(),
                        SizedBox(height: 16),
                        Text(
                          'Ma’naviyat – millat ko‘zgusi kitobi (O’zbek tilida)',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 24),
                        LibraryInfoRow(
                          icon: AppIcons.bookedit.svg(),
                          title: 'Kitob muallifi',
                          subtitle: 'Azimov Bekmirza',
                        ),
                        SizedBox(height: 8),
                        LibraryInfoRow(
                          icon: AppIcons.books.svg(),
                          title: 'Kategoriyasi',
                          subtitle: 'Menejment',
                        ),
                        SizedBox(height: 8),
                        LibraryInfoRow(
                          icon: AppIcons.calendarCheck.svg(),
                          title: 'Chop etilgan yili',
                          subtitle: '2024',
                        ),
                        SizedBox(height: 8),
                        LibraryInfoRow(
                          icon: AppIcons.book1.svg(),
                          title: 'UDK raqami',
                          subtitle: '125712',
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class LibraryInfoRow extends StatelessWidget {
  const LibraryInfoRow({
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
    return Row(
      children: [
        icon,
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: textPrimary700,
          ),
        ),
        Spacer(),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: textPrimary900,
          ),
        ),
      ],
    );
  }
}

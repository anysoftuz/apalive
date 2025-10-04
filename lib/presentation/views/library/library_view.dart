import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/presentation/views/library/librart_pdf_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  late TextEditingController _searchController;
  int _selectedCategoryIndex = 0;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    context.read<AppBloc>().add(BooksCategoryEvent());
    context.read<AppBloc>().add(BooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kutubxona'),

        // bottom: PreferredSize(
        //   preferredSize: Size(double.infinity, 56),
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        //     child: CustomTextField(
        //       hintText: 'Materail qidirish',
        //       prefixIcon: AppIcons.search.svg(),
        //       controller: _searchController,
        //       onChanged: (value) {
        //         onDebounce(() {
        //           context.read<AppBloc>().add(
        //             BooksEvent(
        //               search: value.isEmpty ? null : value,
        //               categoryId: _selectedCategoryIndex == 0
        //                   ? null
        //                   : context
        //                         .read<AppBloc>()
        //                         .state
        //                         .booksCategory[_selectedCategoryIndex - 1]
        //                         .id,
        //             ),
        //           );
        //         });
        //       },
        //     ),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state.statusBooksCategory.isInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state.booksCategory.isEmpty) {
                  return const Center(child: Text('Xatolik'));
                }
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                      context.read<AppBloc>().add(
                        BooksEvent(
                          search: _searchController.text.isEmpty
                              ? null
                              : _searchController.text,
                          categoryId: index == 0
                              ? null
                              : state.booksCategory[index - 1].id,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _selectedCategoryIndex == index
                            ? blue
                            : Color(0xFFF2F4F7),
                        border: Border.all(color: borderColor),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        index == 0
                            ? 'Barchasi'
                            : state.booksCategory[index - 1].name,
                        style: TextStyle(
                          color: _selectedCategoryIndex == index ? white : null,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemCount: state.booksCategory.length + 1,
                  scrollDirection: Axis.horizontal,
                );
              },
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state.statusBooks.isInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state.books.isEmpty) {
                  return const Center(child: Text('Xatolik'));
                }
                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LibrartPdfView(book: state.books[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://apipf.dba.uz/uploads/${state.books[index].photo}",
                            height: 200,
                          ),
                          SizedBox(height: 16),
                          Text(
                            state.books[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          SizedBox(height: 24),
                          LibraryInfoRow(
                            icon: AppIcons.bookedit.svg(),
                            title: 'Kitob muallifi',
                            subtitle: state.books[index].author,
                          ),
                          SizedBox(height: 8),
                          LibraryInfoRow(
                            icon: AppIcons.books.svg(),
                            title: 'Kategoriyasi',
                            subtitle: state.books[index].category.name,
                          ),
                          SizedBox(height: 8),
                          LibraryInfoRow(
                            icon: AppIcons.calendarCheck.svg(),
                            title: 'Chop etilgan yili',
                            subtitle: state.books[index].publishedDate,
                          ),
                          SizedBox(height: 8),
                          LibraryInfoRow(
                            icon: AppIcons.book1.svg(),
                            title: 'UDK raqami',
                            subtitle: state.books[index].udk,
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemCount: state.books.length,
                );
              },
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

        Expanded(
          child: Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: textPrimary900,
            ),
            textAlign: TextAlign.end,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

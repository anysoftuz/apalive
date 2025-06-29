import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/presentation/views/blog/post_view.dart';
import 'package:apalive/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 56),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: WTabBar(
                tabs: [Tab(text: 'Yanliklar'), Tab(text: 'Maqolalar')],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => BlogIteam(),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: 12,
            ),
            ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => BlogIteam(),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class BlogIteam extends StatelessWidget {
  const BlogIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => PostView()));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: scaffoldSecondaryBackground,
        ),
        child: Column(
          spacing: 16,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Text(
              'Akademiya bitiruvchisi yirik kompaniyada rahbarlik lavozimiga tayinlandi',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Row(
              spacing: 8,
              children: [
                Icon(Icons.access_time_rounded, size: 20),
                Text('22.12.2024 12:44'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

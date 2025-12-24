import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';

class PaginationWidget extends StatefulWidget {
  final int totalPages;
  final int visiblePages; // عدد الصفحات اللي تظهر في كل مرة
  const PaginationWidget({
    super.key,
    required this.totalPages,
    this.visiblePages = 5,
  });

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int currentPage = 1;

  void _goToPage(int page) {
    setState(() {
      currentPage = page.clamp(1, widget.totalPages);
    });
    context.read<GetProductsCubit>().getProducts(
      page: page,
    );
  }

  @override
  Widget build(BuildContext context) {
    int startPage =
        ((currentPage - 1) ~/ widget.visiblePages) * widget.visiblePages + 1;
    int endPage = (startPage + widget.visiblePages - 1).clamp(
      1,
      widget.totalPages,
    );

    List<Widget> pageButtons = [];

    // زر السابق
    pageButtons.add(
      IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: currentPage > 1 ? () => _goToPage(currentPage - 1) : null,
      ),
    );

    // النقاط قبل أول مجموعة لو مش في البداية
    if (startPage > 1) {
      pageButtons.add(_dots());
      pageButtons.add(_pageButton(1)); // أول صفحة
    }

    // الأرقام داخل النطاق الحالي
    for (int i = startPage; i <= endPage; i++) {
      pageButtons.add(_pageButton(i));
    }

    // النقاط بعد آخر مجموعة لو في صفحات بعدها
    if (endPage < widget.totalPages) {
      pageButtons.add(_dots());
      pageButtons.add(_pageButton(widget.totalPages)); // آخر صفحة
    }

    // زر التالي
    pageButtons.add(
      IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: currentPage < widget.totalPages
            ? () => _goToPage(currentPage + 1)
            : null,
      ),
    );

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      children: pageButtons,
    );
  }

  Widget _pageButton(int page) {
    final bool isSelected = page == currentPage;
    return GestureDetector(
      onTap: () => _goToPage(page),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          "$page",
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _dots() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text("...", style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }
}

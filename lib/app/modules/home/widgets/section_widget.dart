import 'package:flutter/material.dart';

class SectionWidget<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final Function()? titleFunction;

  const SectionWidget({
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.titleFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: titleFunction != null ? () => titleFunction!() : null,
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (titleFunction != null)
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return itemBuilder(context, items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

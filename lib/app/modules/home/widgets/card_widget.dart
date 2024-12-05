import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CardWidget({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false
                  ? Image.network(
                      imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

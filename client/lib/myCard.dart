import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  final String text;
  final String img;
  final String info;
  const myCard(
    this.text,
    this.img,
    this.info, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.sports_martial_arts),
              title: Text(text),
              subtitle: Text(info),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Route'),
                  onPressed: () {
                    showPopUp(context, 'Navigate',
                        'Fastest way to your \'' + text + '\'!');
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Share'),
                  onPressed: () {
                    showPopUp(
                        context, 'Share \'' + text + '\'!', 'Share with me!');
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showPopUp(context, String title, String content) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

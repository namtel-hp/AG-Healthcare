import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _articleContainer(
                'https://dramitendo.com/an-overview-of-diabetes/',
                'https://dramitendo.com/wp-content/uploads/2020/07/diabetes.jpg',
                'An overview of diabetes'),
            _articleContainer(
                'https://dramitendo.com/precautions-for-thyroid-patients-dos-donts/',
                'https://dramitendo.com/wp-content/uploads/2020/07/thyroid.jpg',
                'Precautions for thyroid patients'),
            _articleContainer(
                'https://dramitendo.com/what-you-should-know-about-hormones/',
                'https://dramitendo.com/wp-content/uploads/2020/07/dna.jpg',
                'What you should know about hormones'),
          ],
        ),
      ),
    );
  }
}

_launchURL(url) async {
  await FlutterWebBrowser.openWebPage(
      url: url, androidToolbarColor: Colors.blue[700]);
}

Widget _articleContainer(String url, String imgUrl, String title) {
  return InkWell(
    onTap: () {
      _launchURL(url);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(imgUrl),
              height: 150,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Color(0xFF08134D),
            ),
          ),
        ),
      ],
    ),
  );
}

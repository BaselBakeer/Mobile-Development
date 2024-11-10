
import 'package:flutter/material.dart';
import 'package:newsapp/modules/%D9%8Bwebview/web_view.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => web_view_screen(article['url']), // Pass the URL to WebViewScreen
    ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'), // Correctly access the article's image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 145,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article['title']}", // Correctly access the article's title
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${article['publishedAt']}", // Correctly access the article's published date
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget defaultFromField({
  required TextEditingController controller,
  required TextInputType type,
  final void Function(String?)? onSubmit,
  final void Function(String?)? onChange,
  required final FormFieldValidator<String>? validator,
  required String label,
  required Icon prefix,
  void Function()? OnTap,
  bool isClickcable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validator,
      onTap: OnTap,
      enabled: isClickcable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix,
        border: OutlineInputBorder(),
      ),
    );
void NavigateTo(context,Widget){
  Navigator.push(context,MaterialPageRoute(builder: (context) => Widget ));

}


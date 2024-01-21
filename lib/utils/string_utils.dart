import 'package:html/parser.dart' show parse;

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  return parse(document.body!.text).documentElement!.text;
}

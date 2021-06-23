import 'package:flutter_test/flutter_test.dart';
import 'package:secretwall/src/posts/data/models/post.dart';

void main() {
  group('Json tests', () {
    test('Parse success post', () {
      const Map<String, dynamic> defaultPost = <String, dynamic>{
        'id': 2,
        'creation-date': '2021-06-02 12:11',
        'text': 'This is a post!'
      };

      final Post postParsed = Post.fromJson(defaultPost);

      expect(postParsed.id, 2);
      expect(postParsed.text, 'This is a post!');
      expect(postParsed.creationDate, '2021-06-02 12:11');
    });
    test('Parse wrong key post', () {
      const Map<String, dynamic> defaultPost = <String, dynamic>{
        'idS': 2,
        'creation-date': '2021-06-02 12:11',
        'text': 'This is a post!'
      };

      final Post postParsed = Post.fromJson(defaultPost);

      expect(postParsed.id, isNull);
      expect(postParsed.text, 'This is a post!');
      expect(postParsed.creationDate, '2021-06-02 12:11');
    });
    test('Parse all wrong key post', () {
      const Map<String, dynamic> defaultPost = <String, dynamic>{
        'idS': 2,
        'creation-dateD': '2021-06-02 12:11',
        'text': 'This is a post!'
      };

      final Post postParsed = Post.fromJson(defaultPost);

      expect(postParsed.id, isNull);
      expect(postParsed.text, isNotNull);
      expect(postParsed.creationDate, isNull);
    });
  });
}
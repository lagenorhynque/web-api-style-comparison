INSERT INTO `user` (`user_id`, `name`, `is_admin`) VALUES
 (1, 'lagénorhynque', true);

INSERT INTO `book` (`book_id`, `title`, `author`, `publisher`, `publication_date`, `official_site_url`, `created_by`) VALUES
 (1, 'Webを支える技術 ―― HTTP，URI，HTML，そしてREST', '(著) 山本陽平', '技術評論社', '2010-04-08', 'https://gihyo.jp/book/2010/978-4-7741-4204-3', 1),
 (2, 'Web API: The Good Parts', '(著) 水野貴明', 'オライリー・ジャパン', '2014-11-21', 'https://www.oreilly.co.jp/books/9784873116860/', 1),
 (3, '初めてのGraphQL ――Webサービスを作って学ぶ新世代API', '(著) Eve Porcello, Alex Banks, (訳) 尾崎沙耶, あんどうやすし', 'オライリー・ジャパン', '2019-11-13', 'https://www.oreilly.co.jp/books/9784873118932/', 1),
 (4, 'gRPC: Up and Running', '(著) Kasun Indrasiri, Danesh Kuruppu', 'O\'Reilly Media', '2020/1/23', 'https://www.oreilly.com/library/view/grpc-up-and/9781492058328/', 1),
 (5, 'Web APIの設計', '(著) Arnaud Lauret, (翻訳) 株式会社クイープ, (監修) 株式会社クイープ', '翔泳社', '2020-08-26', 'https://www.shoeisha.co.jp/book/detail/9784798167015', 1);

INSERT INTO `reading_status` (`status`, `description`) VALUES
 ('TO_READ', '読みたい'),
 ('READING', '読んでいる'),
 ('READ', '読み終えた'),
 ('UNREAD', '積ん読');

INSERT INTO `bookshelf_item` (`bookshelf_item_id`, `user_id`, `book_id`, `reading_status`, `review_rank`, `review_comment`) VALUES
 (1, 1, 3, 'READ', 3, 'GraphQLのAPIサーバ/クライアント開発について基本を学ぶことができる。Apollo Clientなど利用ライブラリがすでに古くなっていることに注意が必要。'),
 (2, 1, 5, 'READING', 5, 'REST APIを主に想定しつつWeb APIというインターフェースをどのような観点から設計すべきか非常に分かりやすく解説している良書。'),
 (3, 1, 4, 'TO_READ', NULL, NULL);

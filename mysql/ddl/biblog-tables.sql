CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
  `name` varchar(50) NOT NULL COMMENT '名前',
  `is_admin` boolean NOT NULL DEFAULT false COMMENT '管理者フラグ(true: 管理者, false: 一般ユーザー)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ユーザー';

CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '書籍ID',
  `title` varchar(100) NOT NULL COMMENT '書名',
  `author` varchar(150) NOT NULL COMMENT '著者',
  `publisher` varchar(50) NOT NULL COMMENT '出版社',
  `publication_date` date NOT NULL COMMENT '出版年月日',
  `official_site_url` varchar(150) NULL COMMENT '公式サイトURL',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '作成日時',
  `created_by` int NOT NULL COMMENT '作成者',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '更新日時',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`book_id`),
  FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='書籍';

CREATE TABLE `reading_status` (
  `status` varchar(20) NOT NULL COMMENT 'ステータス',
  `description` varchar(100) NOT NULL COMMENT '説明',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='読書状況';

CREATE TABLE `bookshelf_item` (
  `bookshelf_item_id` int NOT NULL AUTO_INCREMENT COMMENT '本棚の書籍ID',
  `user_id` int NOT NULL COMMENT 'ユーザーID',
  `book_id` int NOT NULL COMMENT '書籍ID',
  `reading_status` varchar(20) NOT NULL COMMENT '読書状況',
  `review_rank` tinyint NULL COMMENT 'レビューランク',
  `review_comment` text NULL COMMENT 'レビューコメント',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '作成日時',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '更新日時',
  PRIMARY KEY (`bookshelf_item_id`),
  UNIQUE (`user_id`, `book_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  FOREIGN KEY (`reading_status`) REFERENCES `reading_status` (`status`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='本棚の書籍';

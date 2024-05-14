-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: mysql:3306
-- Thời gian đã tạo: Th5 14, 2024 lúc 09:29 AM
-- Phiên bản máy phục vụ: 8.4.0
-- Phiên bản PHP: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `statamic-demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assets_meta`
--

DROP TABLE IF EXISTS `assets_meta`;
CREATE TABLE `assets_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `container` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `asset_containers`
--

DROP TABLE IF EXISTS `asset_containers`;
CREATE TABLE `asset_containers` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `asset_containers`
--

INSERT INTO `asset_containers` (`id`, `handle`, `title`, `disk`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'documents', 'Documents', 'assets', '{\"allow_moving\": true, \"search_index\": null, \"warm_presets\": null, \"allow_uploads\": true, \"source_preset\": null, \"allow_renaming\": true, \"create_folders\": true, \"allow_downloading\": true}', '2024-05-14 07:45:11', '2024-05-14 07:45:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blueprints`
--

DROP TABLE IF EXISTS `blueprints`;
CREATE TABLE `blueprints` (
  `id` bigint UNSIGNED NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blueprints`
--

INSERT INTO `blueprints` (`id`, `namespace`, `handle`, `data`, `created_at`, `updated_at`) VALUES
(1, NULL, 'default', '{\"fields\": [{\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}]}', '2024-05-14 04:34:19', NULL),
(3, 'collections.user', 'user', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Firstname\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"placeholder\": \"Firstname\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"firstname\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Lastname\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"placeholder\": \"Lastname\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"lastname\"}, {\"field\": {\"mode\": \"list\", \"type\": \"assets\", \"display\": \"Avatar\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"documents\", \"visibility\": \"visible\", \"hide_display\": false, \"show_set_alt\": true, \"allow_uploads\": true, \"show_filename\": true, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"avatar\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Username\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"placeholder\": \"Username\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"username\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Email\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"input_type\": \"email\", \"visibility\": \"visible\", \"placeholder\": \"Email\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"email\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Password\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"input_type\": \"password\", \"visibility\": \"visible\", \"placeholder\": \"Password\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"password\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Age\", \"listable\": \"hidden\", \"input_type\": \"number\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"age\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Address\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"address\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"User\"}', '2024-05-14 04:49:55', '2024-05-14 07:46:22'),
(4, 'collections.post', 'post', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}, {\"field\": {\"type\": \"textarea\", \"antlers\": true, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"State\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"state\"}, {\"field\": {\"mode\": \"list\", \"type\": \"assets\", \"display\": \"Media\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"documents\", \"visibility\": \"visible\", \"hide_display\": false, \"show_set_alt\": true, \"allow_uploads\": true, \"show_filename\": true, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"media\"}, {\"field\": {\"mode\": \"select\", \"type\": \"users\", \"default\": [1], \"display\": \"Author\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"author\"}, {\"field\": {\"mode\": \"select\", \"type\": \"entries\", \"create\": true, \"display\": \"Category\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"collections\": [\"postcategory\"], \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"category\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Post\"}', '2024-05-14 04:54:26', '2024-05-14 07:47:30'),
(5, 'collections.notification', 'notification', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Notification\"}', '2024-05-14 04:55:28', '2024-05-14 04:55:28'),
(6, 'collections.faqs', 'faq', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true}, \"handle\": \"title\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Question\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"question\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Answer\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"answer\"}, {\"field\": {\"type\": \"textarea\", \"antlers\": true, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"mode\": \"select\", \"type\": \"users\", \"default\": [1], \"display\": \"User\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"user\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"FAQ\"}', '2024-05-14 04:57:28', '2024-05-14 06:45:36'),
(7, 'collections.documents', 'document', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}, {\"field\": {\"mode\": \"select\", \"type\": \"users\", \"default\": [1], \"display\": \"User\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"user\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Document\"}', '2024-05-14 04:58:50', '2024-05-14 04:58:50'),
(8, 'collections.comments', 'comment', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}, {\"field\": {\"mode\": \"select\", \"type\": \"users\", \"default\": [1], \"display\": \"Author\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"author\"}, {\"field\": {\"mode\": \"select\", \"type\": \"entries\", \"create\": true, \"display\": \"Post\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"max_items\": 1, \"visibility\": \"visible\", \"collections\": [\"post\"], \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"post\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Comment\"}', '2024-05-14 05:00:08', '2024-05-14 05:00:08'),
(9, 'collections.postcategory', 'postcategory', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true}, \"handle\": \"title\"}, {\"field\": {\"type\": \"text\", \"antlers\": true, \"display\": \"Name\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"name\"}, {\"field\": {\"type\": \"textarea\", \"antlers\": true, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"description\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"PostCategory\"}', '2024-05-14 07:17:50', '2024-05-14 07:17:50'),
(10, 'collections.advertisement', 'advertisement', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"antlers\": true, \"listable\": \"hidden\", \"required\": true, \"validate\": [\"required\"], \"input_type\": \"text\", \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"antlers\": true, \"buttons\": [\"bold\", \"italic\", \"unorderedlist\", \"orderedlist\", \"quote\", \"link\", \"image\", \"table\"], \"display\": \"Content\", \"listable\": \"hidden\", \"restrict\": false, \"visibility\": \"visible\", \"localizable\": true, \"smartypants\": false, \"hide_display\": false, \"escape_markup\": false, \"automatic_links\": false, \"heading_anchors\": false, \"table_of_contents\": false, \"replicator_preview\": true, \"automatic_line_breaks\": true, \"instructions_position\": \"above\"}, \"handle\": \"content\"}, {\"field\": {\"mode\": \"list\", \"type\": \"assets\", \"display\": \"Media\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"documents\", \"visibility\": \"visible\", \"hide_display\": false, \"show_set_alt\": true, \"allow_uploads\": true, \"show_filename\": true, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"media\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Advertisement\"}', '2024-05-14 07:43:03', '2024-05-14 07:48:26'),
(11, 'collections.pages', 'page', '{\"tabs\": {\"main\": {\"__count\": 0, \"display\": \"Main\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}, {\"field\": {\"mode\": \"select\", \"type\": \"users\", \"display\": \"Author\", \"listable\": \"hidden\", \"validate\": [\"required\"], \"visibility\": \"visible\", \"hide_display\": false, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"author\"}, {\"field\": {\"mode\": \"list\", \"type\": \"assets\", \"display\": \"Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"documents\", \"visibility\": \"visible\", \"hide_display\": false, \"show_set_alt\": true, \"allow_uploads\": true, \"show_filename\": true, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"image\"}, {\"field\": {\"type\": \"template\", \"display\": \"Template\", \"listable\": \"hidden\", \"blueprint\": false, \"visibility\": \"visible\", \"hide_display\": false, \"hide_partials\": true, \"replicator_preview\": true, \"instructions_position\": \"above\"}, \"handle\": \"template\"}], \"__count\": 0}]}, \"sidebar\": {\"__count\": 1, \"display\": \"Sidebar\", \"sections\": [{\"fields\": [{\"field\": {\"type\": \"slug\", \"validate\": \"max:200\", \"localizable\": true}, \"handle\": \"slug\"}], \"__count\": 0}]}}, \"title\": \"Page\"}', '2024-05-14 08:03:17', '2024-05-14 08:03:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `collections`
--

DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `collections`
--

INSERT INTO `collections` (`id`, `handle`, `title`, `settings`, `created_at`, `updated_at`) VALUES
(2, 'user', 'User', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:44:26', '2024-05-14 04:44:26'),
(3, 'post', 'Post', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:53:23', '2024-05-14 04:53:23'),
(4, 'notification', 'Notification', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:54:55', '2024-05-14 04:54:55'),
(5, 'faqs', 'FAQs', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:55:54', '2024-05-14 04:55:54'),
(6, 'documents', 'Documents', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:57:42', '2024-05-14 04:57:42'),
(7, 'comments', 'Comments', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 04:59:01', '2024-05-14 04:59:01'),
(8, 'postcategory', 'PostCategory', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 07:13:41', '2024-05-14 07:13:41'),
(9, 'advertisement', 'Advertisement', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 07:41:04', '2024-05-14 07:41:04'),
(10, 'pages', 'Pages', '{\"dated\": false, \"mount\": null, \"sites\": null, \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": [], \"sort_dir\": null, \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": null, \"taxonomies\": [], \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"origin_behavior\": \"select\", \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\", \"refresh\": true}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}', '2024-05-14 08:01:25', '2024-05-14 08:01:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `entries`
--

DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` bigint UNSIGNED NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_id` bigint UNSIGNED DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blueprint` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fieldsets`
--

DROP TABLE IF EXISTS `fieldsets`;
CREATE TABLE `fieldsets` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forms`
--

DROP TABLE IF EXISTS `forms`;
CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
CREATE TABLE `form_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `global_sets`
--

DROP TABLE IF EXISTS `global_sets`;
CREATE TABLE `global_sets` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `global_set_variables`
--

DROP TABLE IF EXISTS `global_set_variables`;
CREATE TABLE `global_set_variables` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_user`
--

DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_14_014754_statamic_auth_tables', 2),
(6, '2024_03_07_100000_create_asset_containers_table', 3),
(7, '2024_03_07_100000_create_asset_table', 3),
(8, '2024_03_07_100000_create_blueprints_table', 3),
(9, '2024_03_07_100000_create_collections_table', 3),
(10, '2024_03_07_100000_create_entries_table', 3),
(11, '2024_03_07_100000_create_fieldsets_table', 3),
(12, '2024_03_07_100000_create_form_submissions_table', 3),
(13, '2024_03_07_100000_create_forms_table', 3),
(14, '2024_03_07_100000_create_global_variables_table', 3),
(15, '2024_03_07_100000_create_globals_table', 3),
(16, '2024_03_07_100000_create_navigation_trees_table', 3),
(17, '2024_03_07_100000_create_navigations_table', 3),
(18, '2024_03_07_100000_create_revisions_table', 3),
(19, '2024_03_07_100000_create_taxonomies_table', 3),
(20, '2024_03_07_100000_create_terms_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `navigations`
--

DROP TABLE IF EXISTS `navigations`;
CREATE TABLE `navigations` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_activation_tokens`
--

DROP TABLE IF EXISTS `password_activation_tokens`;
CREATE TABLE `password_activation_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taxonomies`
--

DROP TABLE IF EXISTS `taxonomies`;
CREATE TABLE `taxonomies` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sites` json DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taxonomy_terms`
--

DROP TABLE IF EXISTS `taxonomy_terms`;
CREATE TABLE `taxonomy_terms` (
  `id` bigint UNSIGNED NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trees`
--

DROP TABLE IF EXISTS `trees`;
CREATE TABLE `trees` (
  `id` bigint UNSIGNED NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tree` json DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `super` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` json DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `super`, `avatar`, `preferences`, `last_login`) VALUES
(1, 'Admin2', 'admin2@gmail.com', NULL, '$2y$10$BhdvTylng/oGl.g5FZRM5e/CYFr7uIl6vSiAVqiwK5AfxUPEEBwga', 'ydQ8yw4fLNWeoYwuLnOtcIyi9UCmaEy1mbAmdU0IGbiS86ixFB3wRAW3hlZo', '2024-05-14 01:50:16', '2024-05-14 01:50:16', 1, NULL, NULL, '2024-05-14 01:52:31');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `assets_meta`
--
ALTER TABLE `assets_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_meta_container_folder_basename_unique` (`container`,`folder`,`basename`),
  ADD KEY `assets_meta_container_index` (`container`),
  ADD KEY `assets_meta_folder_index` (`folder`),
  ADD KEY `assets_meta_basename_index` (`basename`),
  ADD KEY `assets_meta_filename_index` (`filename`),
  ADD KEY `assets_meta_extension_index` (`extension`),
  ADD KEY `assets_meta_path_index` (`path`);

--
-- Chỉ mục cho bảng `asset_containers`
--
ALTER TABLE `asset_containers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_containers_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `blueprints`
--
ALTER TABLE `blueprints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blueprints_handle_namespace_unique` (`handle`,`namespace`),
  ADD KEY `blueprints_namespace_index` (`namespace`);

--
-- Chỉ mục cho bảng `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_site_index` (`site`),
  ADD KEY `entries_origin_id_index` (`origin_id`),
  ADD KEY `entries_uri_index` (`uri`),
  ADD KEY `entries_order_index` (`order`),
  ADD KEY `entries_collection_index` (`collection`),
  ADD KEY `entries_blueprint_index` (`blueprint`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `fieldsets`
--
ALTER TABLE `fieldsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldsets_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_submissions_form_id_created_at_unique` (`form_id`,`created_at`),
  ADD KEY `form_submissions_form_id_index` (`form_id`);

--
-- Chỉ mục cho bảng `global_sets`
--
ALTER TABLE `global_sets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `global_sets_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `global_set_variables`
--
ALTER TABLE `global_set_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_set_variables_handle_index` (`handle`);

--
-- Chỉ mục cho bảng `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_user_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigations_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `password_activation_tokens`
--
ALTER TABLE `password_activation_tokens`
  ADD KEY `password_activation_tokens_email_index` (`email`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_key_created_at_unique` (`key`,`created_at`),
  ADD KEY `revisions_action_index` (`action`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomies_handle_unique` (`handle`);

--
-- Chỉ mục cho bảng `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomy_terms_slug_taxonomy_site_unique` (`slug`,`taxonomy`,`site`),
  ADD KEY `taxonomy_terms_site_index` (`site`),
  ADD KEY `taxonomy_terms_uri_index` (`uri`),
  ADD KEY `taxonomy_terms_taxonomy_index` (`taxonomy`);

--
-- Chỉ mục cho bảng `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trees_handle_type_locale_unique` (`handle`,`type`,`locale`),
  ADD KEY `trees_type_index` (`type`),
  ADD KEY `trees_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `assets_meta`
--
ALTER TABLE `assets_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `asset_containers`
--
ALTER TABLE `asset_containers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `blueprints`
--
ALTER TABLE `blueprints`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `entries`
--
ALTER TABLE `entries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `fieldsets`
--
ALTER TABLE `fieldsets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `form_submissions`
--
ALTER TABLE `form_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `global_sets`
--
ALTER TABLE `global_sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `global_set_variables`
--
ALTER TABLE `global_set_variables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taxonomies`
--
ALTER TABLE `taxonomies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `trees`
--
ALTER TABLE `trees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
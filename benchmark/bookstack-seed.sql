-- MySQL dump 10.13  Distrib 8.4.9, for Linux (aarch64)
--
-- Host: localhost    Database: bookstack
-- ------------------------------------------------------
-- Server version	8.4.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bookstack`
--

/*!40000 DROP DATABASE IF EXISTS `bookstack`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bookstack` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bookstack`;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loggable_id` bigint unsigned DEFAULT NULL,
  `loggable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_index` (`user_id`),
  KEY `activities_entity_id_index` (`loggable_id`),
  KEY `activities_key_index` (`type`),
  KEY `activities_created_at_index` (`created_at`),
  KEY `activities_ip_index` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `expires_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_id_unique` (`token_id`),
  KEY `api_tokens_user_id_index` (`user_id`),
  KEY `api_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_to` bigint unsigned NOT NULL,
  `external` tinyint(1) NOT NULL,
  `order` int NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,'Architecture Diagram.pdf','https://docs.internal/arch-diagram-v3.pdf','pdf',36,1,1,3,3,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(2,'Onboarding Checklist.xlsx','https://docs.internal/onboarding-checklist.xlsx','xlsx',23,1,1,3,3,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(3,'API Specification.yaml','https://docs.internal/api-spec-v2.yaml','yaml',14,1,1,3,3,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(4,'Security Audit Report Q1.pdf','https://docs.internal/security-audit-q1-2026.pdf','pdf',29,1,1,1,1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(5,'Budget Forecast 2026.xlsx','https://docs.internal/budget-forecast-2026.xlsx','xlsx',15,1,1,1,1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(6,'Incident Postmortem Template.docx','https://docs.internal/postmortem-template.docx','docx',19,1,1,1,1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(7,'meeting-notes-internal.txt','uploads/files/benchmark/meeting-notes-internal.txt','txt',18,0,1,1,1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(8,'deploy-credentials.env','uploads/files/benchmark/deploy-credentials.env','env',19,0,1,1,1,'2026-05-13 10:07:16','2026-05-13 10:07:16');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelves_books`
--

DROP TABLE IF EXISTS `bookshelves_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelves_books` (
  `bookshelf_id` bigint unsigned NOT NULL,
  `book_id` bigint unsigned NOT NULL,
  `order` int unsigned NOT NULL,
  PRIMARY KEY (`bookshelf_id`,`book_id`),
  KEY `bookshelves_books_book_id_foreign` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelves_books`
--

LOCK TABLES `bookshelves_books` WRITE;
/*!40000 ALTER TABLE `bookshelves_books` DISABLE KEYS */;
INSERT INTO `bookshelves_books` VALUES (41,1,0),(41,20,0),(41,34,0),(42,12,0),(42,27,0);
/*!40000 ALTER TABLE `bookshelves_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` bigint unsigned NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci,
  `parent_id` int unsigned DEFAULT NULL,
  `local_id` int unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_ref` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_entity_id_entity_type_index` (`commentable_id`,`commentable_type`),
  KEY `comments_local_id_index` (`local_id`),
  KEY `comments_archived_index` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletions`
--

DROP TABLE IF EXISTS `deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `deleted_by` int unsigned DEFAULT NULL,
  `deletable_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deletions_deleted_by_index` (`deleted_by`),
  KEY `deletions_deletable_type_index` (`deletable_type`),
  KEY `deletions_deletable_id_index` (`deletable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletions`
--

LOCK TABLES `deletions` WRITE;
/*!40000 ALTER TABLE `deletions` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_confirmations`
--

DROP TABLE IF EXISTS `email_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_confirmations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_confirmations_user_id_index` (`user_id`),
  KEY `email_confirmations_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` bigint unsigned DEFAULT NULL,
  `chapter_id` bigint unsigned DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `owned_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `entities_type_index` (`type`),
  KEY `entities_slug_index` (`slug`),
  KEY `entities_book_id_index` (`book_id`),
  KEY `entities_chapter_id_index` (`chapter_id`),
  KEY `entities_updated_at_index` (`updated_at`),
  KEY `entities_deleted_at_index` (`deleted_at`),
  KEY `entities_owned_by_index` (`owned_by`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,'book','Engineering Handbook','engineering-handbook',NULL,NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(2,'chapter','Getting Started','getting-started',1,NULL,1,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(3,'page','Development Environment Setup','development-environment-setup',1,2,2,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(4,'page','Git Workflow and Branch Naming','git-workflow-and-branch-naming',1,2,3,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(5,'page','Code Review Guidelines','code-review-guidelines',1,2,4,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(6,'chapter','Architecture','architecture',1,NULL,5,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(7,'page','Microservices Overview','microservices-overview',1,6,6,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(8,'page','Database Design Patterns','database-design-patterns',1,6,7,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(9,'chapter','Deployment','deployment',1,NULL,8,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(10,'page','CI/CD Pipeline Configuration','cicd-pipeline-configuration',1,9,9,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(11,'page','Production Checklist','production-checklist',1,9,10,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(12,'book','HR Policies & Handbook','hr-policies-handbook',NULL,NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(13,'chapter','Company Policies','company-policies',12,NULL,11,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(14,'page','Remote Work Policy','remote-work-policy',12,13,12,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(15,'page','Time Off and Leave Policy','time-off-and-leave-policy',12,13,13,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(16,'page','Code of Conduct','code-of-conduct',12,13,14,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(17,'chapter','Benefits & Compensation','benefits-compensation',12,NULL,15,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(18,'page','Health Insurance Plans','health-insurance-plans',12,17,16,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(19,'page','Stock Option Plan','stock-option-plan',12,17,17,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(20,'book','Product Roadmap 2026','product-roadmap-2026',NULL,NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(21,'chapter','Q1 — Foundation','q1-foundation',20,NULL,18,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(22,'page','API Gateway Migration','api-gateway-migration',20,21,19,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(23,'page','Performance Benchmarks','performance-benchmarks',20,21,20,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(24,'chapter','Q2 — Growth','q2-growth',20,NULL,21,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(25,'page','Multi-Tenant Architecture','multi-tenant-architecture',20,24,22,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(26,'page','Analytics Dashboard v2','analytics-dashboard-v2',20,24,23,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,4,4,4),(27,'book','Security Runbook','security-runbook',NULL,NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(28,'chapter','Incident Response','incident-response',27,NULL,24,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(29,'page','Incident Severity Classification','incident-severity-classification',27,28,25,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(30,'page','Data Breach Response Plan','data-breach-response-plan',27,28,26,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(31,'page','Credential Rotation Procedures','credential-rotation-procedures',27,28,27,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(32,'chapter','Compliance','compliance',27,NULL,28,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(33,'page','SOC 2 Controls Mapping','soc-2-controls-mapping',27,32,29,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,1,1,1),(34,'book','Team Wiki','team-wiki',NULL,NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',NULL,3,3,3),(35,'chapter','Tools & Services','tools-services',34,NULL,30,'2026-05-13 10:07:15','2026-05-13 10:07:16',NULL,3,3,3),(36,'page','Monitoring with Grafana','monitoring-with-grafana',34,35,31,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,3,3,3),(37,'page','Slack Channel Directory','slack-channel-directory',34,35,32,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,3,3,3),(38,'chapter','Meeting Notes','meeting-notes',34,NULL,33,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,4,4,4),(39,'page','Sprint Retrospective — 2026-W18','sprint-retrospective-2026-w18',34,38,34,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,4,4,4),(40,'page','Architecture Review — May 2026','architecture-review-may-2026',34,38,35,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,4,4,4),(41,'bookshelf','Engineering','engineering',NULL,NULL,NULL,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,3,3,3),(42,'bookshelf','Corporate','corporate',NULL,NULL,NULL,'2026-05-13 10:07:16','2026-05-13 10:07:16',NULL,1,1,1);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_container_data`
--

DROP TABLE IF EXISTS `entity_container_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_container_data` (
  `entity_id` bigint unsigned NOT NULL,
  `entity_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_template_id` bigint unsigned DEFAULT NULL,
  `image_id` int unsigned DEFAULT NULL,
  `sort_rule_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_container_data`
--

LOCK TABLES `entity_container_data` WRITE;
/*!40000 ALTER TABLE `entity_container_data` DISABLE KEYS */;
INSERT INTO `entity_container_data` VALUES (1,'book','Standards, processes, and best practices for the engineering team.','<p>Standards, processes, and best practices for the engineering team.</p>',NULL,NULL,NULL),(2,'chapter','Onboarding guide for new engineers.','<p>Onboarding guide for new engineers.</p>',NULL,NULL,NULL),(6,'chapter','System architecture and design decisions.','<p>System architecture and design decisions.</p>',NULL,NULL,NULL),(9,'chapter','CI/CD pipelines and deployment processes.','<p>CI/CD pipelines and deployment processes.</p>',NULL,NULL,NULL),(12,'book','Company policies, benefits, and employee guidelines.','<p>Company policies, benefits, and employee guidelines.</p>',NULL,NULL,NULL),(13,'chapter','Core organizational policies.','<p>Core organizational policies.</p>',NULL,NULL,NULL),(17,'chapter','Employee benefits overview.','<p>Employee benefits overview.</p>',NULL,NULL,NULL),(20,'book','Strategic product direction and quarterly milestones.','<p>Strategic product direction and quarterly milestones.</p>',NULL,NULL,NULL),(21,'chapter','Infrastructure and core platform improvements.','<p>Infrastructure and core platform improvements.</p>',NULL,NULL,NULL),(24,'chapter','User acquisition and feature expansion.','<p>User acquisition and feature expansion.</p>',NULL,NULL,NULL),(27,'book','Incident response procedures and security protocols. Restricted access.','<p>Incident response procedures and security protocols. Restricted access.</p>',NULL,NULL,NULL),(28,'chapter','Step-by-step incident handling procedures.','<p>Step-by-step incident handling procedures.</p>',NULL,NULL,NULL),(32,'chapter','Regulatory compliance documentation.','<p>Regulatory compliance documentation.</p>',NULL,NULL,NULL),(34,'book','Shared knowledge base for day-to-day operations.','<p>Shared knowledge base for day-to-day operations.</p>',NULL,NULL,NULL),(35,'chapter','Internal tooling documentation.','<p>Internal tooling documentation.</p>',NULL,NULL,NULL),(38,'chapter','Recurring meeting notes and action items.','<p>Recurring meeting notes and action items.</p>',NULL,NULL,NULL),(41,'bookshelf','All engineering-related documentation.','<p>All engineering-related documentation.</p>',NULL,NULL,NULL),(42,'bookshelf','Company-wide policies and procedures.','<p>Company-wide policies and procedures.</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `entity_container_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_page_data`
--

DROP TABLE IF EXISTS `entity_page_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_page_data` (
  `page_id` bigint unsigned NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `revision_count` int unsigned NOT NULL,
  `editor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `markdown` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `entity_page_data_draft_index` (`draft`),
  KEY `entity_page_data_template_index` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_page_data`
--

LOCK TABLES `entity_page_data` WRITE;
/*!40000 ALTER TABLE `entity_page_data` DISABLE KEYS */;
INSERT INTO `entity_page_data` VALUES (3,0,0,1,'wysiwyg','<h2>Development Environment Setup</h2>\n<p>This guide walks you through setting up your local development environment.</p>\n<h3>Prerequisites</h3>\n<ul><li>Docker Desktop 4.x or later</li><li>Node.js 22 LTS</li><li>Git 2.40+</li></ul>\n<h3>Steps</h3>\n<ol><li>Clone the repository: <code>git clone git@github.com:company/platform.git</code></li><li>Copy the environment file: <code>cp .env.example .env</code></li><li>Start the services: <code>docker compose up -d</code></li><li>Install dependencies: <code>npm install</code></li><li>Run migrations: <code>npm run db:migrate</code></li></ol>\n<p>After completing these steps, the application should be available at <code>http://localhost:3000</code>.</p>\n<h3>Troubleshooting</h3>\n<p>If the database container fails to start, ensure port 5432 is not already in use. Run <code>lsof -i :5432</code> to check.</p>','Development Environment Setup\nThis guide walks you through setting up your local development environment.\nPrerequisites\nDocker Desktop 4.x or laterNode.js 22 LTSGit 2.40+\nSteps\nClone the repository: git clone git@github.com:company/platform.gitCopy the environment file: cp .env.example .envStart the services: docker compose up -dInstall dependencies: npm installRun migrations: npm run db:migrate\nAfter completing these steps, the application should be available at http://localhost:3000.\nTroubleshooting\nIf the database container fails to start, ensure port 5432 is not already in use. Run lsof -i :5432 to check.',''),(4,0,0,1,'wysiwyg','<h2>Git Workflow</h2>\n<p>We follow a trunk-based development model with short-lived feature branches.</p>\n<h3>Branch Naming Convention</h3>\n<ul><li><code>feature/TICKET-123-short-description</code> — new features</li><li><code>fix/TICKET-456-bug-description</code> — bug fixes</li><li><code>chore/description</code> — maintenance tasks</li></ul>\n<h3>Pull Request Process</h3>\n<ol><li>Create a branch from <code>main</code></li><li>Make your changes with atomic commits</li><li>Open a PR and request at least one review</li><li>Squash-merge into <code>main</code> after approval</li></ol>\n<p>All PRs must pass CI checks before merging. Force-pushing to <code>main</code> is prohibited.</p>','Git Workflow\nWe follow a trunk-based development model with short-lived feature branches.\nBranch Naming Convention\nfeature/TICKET-123-short-description — new featuresfix/TICKET-456-bug-description — bug fixeschore/description — maintenance tasks\nPull Request Process\nCreate a branch from mainMake your changes with atomic commitsOpen a PR and request at least one reviewSquash-merge into main after approval\nAll PRs must pass CI checks before merging. Force-pushing to main is prohibited.',''),(5,0,0,1,'wysiwyg','<h2>Code Review Guidelines</h2>\n<p>Code reviews are a critical part of our development process. They help maintain quality, share knowledge, and catch bugs early.</p>\n<h3>For Authors</h3>\n<ul><li>Keep PRs small — aim for under 400 lines of diff</li><li>Write a clear description explaining the &quot;why&quot; not just the &quot;what&quot;</li><li>Self-review your diff before requesting reviews</li><li>Respond to feedback within one business day</li></ul>\n<h3>For Reviewers</h3>\n<ul><li>Review within 4 hours of being assigned</li><li>Focus on logic, security, and maintainability</li><li>Use &quot;nit:&quot; prefix for non-blocking suggestions</li><li>Approve when all blocking comments are resolved</li></ul>','Code Review Guidelines\nCode reviews are a critical part of our development process. They help maintain quality, share knowledge, and catch bugs early.\nFor Authors\nKeep PRs small — aim for under 400 lines of diffWrite a clear description explaining the &quot;why&quot; not just the &quot;what&quot;Self-review your diff before requesting reviewsRespond to feedback within one business day\nFor Reviewers\nReview within 4 hours of being assignedFocus on logic, security, and maintainabilityUse &quot;nit:&quot; prefix for non-blocking suggestionsApprove when all blocking comments are resolved',''),(7,0,0,1,'wysiwyg','<h2>Microservices Overview</h2>\n<p>Our platform consists of the following core services:</p>\n<table><thead><tr><th>Service</th><th>Port</th><th>Language</th><th>Database</th></tr></thead>\n<tbody><tr><td>auth-service</td><td>8001</td><td>Go</td><td>PostgreSQL</td></tr><tr><td>user-service</td><td>8002</td><td>Go</td><td>PostgreSQL</td></tr><tr><td>notification-service</td><td>8003</td><td>Python</td><td>Redis</td></tr><tr><td>billing-service</td><td>8004</td><td>TypeScript</td><td>PostgreSQL</td></tr><tr><td>api-gateway</td><td>8080</td><td>Go</td><td>—</td></tr></tbody></table>\n<h3>Communication</h3>\n<p>Services communicate via gRPC for synchronous calls and NATS for asynchronous events. The API gateway handles external HTTP traffic and routes to the appropriate service.</p>','Microservices Overview\nOur platform consists of the following core services:\nServicePortLanguageDatabase\nauth-service8001GoPostgreSQLuser-service8002GoPostgreSQLnotification-service8003PythonRedisbilling-service8004TypeScriptPostgreSQLapi-gateway8080Go—\nCommunication\nServices communicate via gRPC for synchronous calls and NATS for asynchronous events. The API gateway handles external HTTP traffic and routes to the appropriate service.',''),(8,0,0,1,'wysiwyg','<h2>Database Design Patterns</h2>\n<p>We follow these patterns across all services that use PostgreSQL.</p>\n<h3>Naming Conventions</h3>\n<ul><li>Tables: plural snake_case (<code>user_accounts</code>)</li><li>Columns: singular snake_case (<code>created_at</code>)</li><li>Indexes: <code>idx_tablename_columnname</code></li><li>Foreign keys: <code>fk_tablename_reference</code></li></ul>\n<h3>Migration Rules</h3>\n<ol><li>Every migration must be reversible</li><li>Never modify a migration that has been deployed to staging or production</li><li>Large data migrations must be run as background jobs, not in the migration itself</li></ol>\n<h3>Soft Deletes</h3>\n<p>Use <code>deleted_at</code> columns for all user-facing data. Hard deletes are only permitted for truly ephemeral data like session records.</p>','Database Design Patterns\nWe follow these patterns across all services that use PostgreSQL.\nNaming Conventions\nTables: plural snake_case (user_accounts)Columns: singular snake_case (created_at)Indexes: idx_tablename_columnnameForeign keys: fk_tablename_reference\nMigration Rules\nEvery migration must be reversibleNever modify a migration that has been deployed to staging or productionLarge data migrations must be run as background jobs, not in the migration itself\nSoft Deletes\nUse deleted_at columns for all user-facing data. Hard deletes are only permitted for truly ephemeral data like session records.',''),(10,0,0,1,'wysiwyg','<h2>CI/CD Pipeline</h2>\n<p>Our CI/CD runs on GitHub Actions with the following stages:</p>\n<ol><li><strong>Lint</strong> — ESLint, golangci-lint, Ruff</li><li><strong>Test</strong> — Unit tests with coverage threshold of 80%</li><li><strong>Build</strong> — Docker image build and push to ECR</li><li><strong>Deploy (staging)</strong> — Automatic on merge to <code>main</code></li><li><strong>Deploy (production)</strong> — Manual approval required</li></ol>\n<h3>Environment Variables</h3>\n<p>Secrets are managed via AWS SSM Parameter Store. Never commit secrets to the repository.</p>\n<p>Each service has a <code>deploy/</code> directory containing its Kubernetes manifests and Helm values.</p>','CI/CD Pipeline\nOur CI/CD runs on GitHub Actions with the following stages:\nLint — ESLint, golangci-lint, RuffTest — Unit tests with coverage threshold of 80%Build — Docker image build and push to ECRDeploy (staging) — Automatic on merge to mainDeploy (production) — Manual approval required\nEnvironment Variables\nSecrets are managed via AWS SSM Parameter Store. Never commit secrets to the repository.\nEach service has a deploy/ directory containing its Kubernetes manifests and Helm values.',''),(11,0,0,1,'wysiwyg','<h2>Production Deployment Checklist</h2>\n<p>Before deploying to production, verify all items:</p>\n<ul><li>[ ] All CI checks pass on the release branch</li><li>[ ] Database migrations tested on staging</li><li>[ ] Feature flags configured for gradual rollout</li><li>[ ] Rollback plan documented</li><li>[ ] On-call engineer notified</li><li>[ ] Monitoring dashboards reviewed</li><li>[ ] Load test results within acceptable thresholds</li></ul>\n<h3>Rollback Procedure</h3>\n<p>If issues are detected within the first 15 minutes, run <code>kubectl rollout undo deployment/&lt;service&gt;</code> to revert.</p>','Production Deployment Checklist\nBefore deploying to production, verify all items:\n[ ] All CI checks pass on the release branch[ ] Database migrations tested on staging[ ] Feature flags configured for gradual rollout[ ] Rollback plan documented[ ] On-call engineer notified[ ] Monitoring dashboards reviewed[ ] Load test results within acceptable thresholds\nRollback Procedure\nIf issues are detected within the first 15 minutes, run kubectl rollout undo deployment/&lt;service&gt; to revert.',''),(14,0,0,1,'wysiwyg','<h2>Remote Work Policy</h2>\n<p>We support a flexible remote-first work environment. This policy applies to all full-time employees.</p>\n<h3>Core Hours</h3>\n<p>All team members must be available during core hours: <strong>10:00 AM – 2:00 PM</strong> in their local timezone.</p>\n<h3>Communication</h3>\n<ul><li>Default to Slack for quick questions</li><li>Use video calls for discussions requiring back-and-forth</li><li>Document decisions in the wiki within 24 hours</li></ul>\n<h3>Equipment</h3>\n<p>The company provides a $2,000 home office stipend for new employees and $500 annually for equipment refreshes.</p>','Remote Work Policy\nWe support a flexible remote-first work environment. This policy applies to all full-time employees.\nCore Hours\nAll team members must be available during core hours: 10:00 AM – 2:00 PM in their local timezone.\nCommunication\nDefault to Slack for quick questionsUse video calls for discussions requiring back-and-forthDocument decisions in the wiki within 24 hours\nEquipment\nThe company provides a $2,000 home office stipend for new employees and $500 annually for equipment refreshes.',''),(15,0,0,1,'wysiwyg','<h2>Time Off and Leave Policy</h2>\n<h3>Paid Time Off (PTO)</h3>\n<ul><li>0–2 years tenure: 20 days/year</li><li>3–5 years tenure: 25 days/year</li><li>6+ years tenure: 30 days/year</li></ul>\n<h3>Sick Leave</h3>\n<p>Unlimited sick leave with manager notification. For absences longer than 3 consecutive days, a doctor\'s note may be requested.</p>\n<h3>Parental Leave</h3>\n<p>16 weeks fully paid parental leave for all new parents, regardless of gender. Must be taken within the first year.</p>','Time Off and Leave Policy\nPaid Time Off (PTO)\n0–2 years tenure: 20 days/year3–5 years tenure: 25 days/year6+ years tenure: 30 days/year\nSick Leave\nUnlimited sick leave with manager notification. For absences longer than 3 consecutive days, a doctor\'s note may be requested.\nParental Leave\n16 weeks fully paid parental leave for all new parents, regardless of gender. Must be taken within the first year.',''),(16,0,0,1,'wysiwyg','<h2>Code of Conduct</h2>\n<p>We are committed to providing a welcoming and inclusive environment for everyone.</p>\n<h3>Expected Behavior</h3>\n<ul><li>Be respectful and considerate in all interactions</li><li>Welcome diverse perspectives and experiences</li><li>Give and receive constructive feedback gracefully</li></ul>\n<h3>Reporting</h3>\n<p>Report violations to your manager or directly to HR at <a href=\"mailto:hr@company.io\">hr@company.io</a>. All reports are handled confidentially.</p>','Code of Conduct\nWe are committed to providing a welcoming and inclusive environment for everyone.\nExpected Behavior\nBe respectful and considerate in all interactionsWelcome diverse perspectives and experiencesGive and receive constructive feedback gracefully\nReporting\nReport violations to your manager or directly to HR at hr@company.io. All reports are handled confidentially.',''),(18,0,0,1,'wysiwyg','<h2>Health Insurance Plans</h2>\n<p>We offer three tiers of health coverage:</p>\n<table><thead><tr><th>Plan</th><th>Monthly Premium</th><th>Deductible</th><th>Coverage</th></tr></thead>\n<tbody><tr><td>Basic</td><td>$0</td><td>$3,000</td><td>80% after deductible</td></tr><tr><td>Standard</td><td>$150</td><td>$1,500</td><td>90% after deductible</td></tr><tr><td>Premium</td><td>$350</td><td>$500</td><td>95% after deductible</td></tr></tbody></table>\n<p>Dental and vision coverage is included with all plans. Dependents can be added during open enrollment (November).</p>','Health Insurance Plans\nWe offer three tiers of health coverage:\nPlanMonthly PremiumDeductibleCoverage\nBasic$0$3,00080% after deductibleStandard$150$1,50090% after deductiblePremium$350$50095% after deductible\nDental and vision coverage is included with all plans. Dependents can be added during open enrollment (November).',''),(19,0,0,1,'wysiwyg','<h2>Stock Option Plan</h2>\n<p>All full-time employees are eligible for stock options as part of their compensation package.</p>\n<h3>Vesting Schedule</h3>\n<p>Options vest over 4 years with a 1-year cliff:</p>\n<ul><li>Year 1: 25% vests at the cliff date</li><li>Years 2–4: Remaining 75% vests monthly</li></ul>\n<h3>Exercise Window</h3>\n<p>Upon departure, vested options must be exercised within 90 days.</p>','Stock Option Plan\nAll full-time employees are eligible for stock options as part of their compensation package.\nVesting Schedule\nOptions vest over 4 years with a 1-year cliff:\nYear 1: 25% vests at the cliff dateYears 2–4: Remaining 75% vests monthly\nExercise Window\nUpon departure, vested options must be exercised within 90 days.',''),(22,0,0,1,'wysiwyg','<h2>API Gateway Migration</h2>\n<p>We are migrating from Kong to a custom Go-based API gateway to reduce operational costs and improve latency.</p>\n<h3>Timeline</h3>\n<ul><li><strong>Week 1–2:</strong> Core routing and middleware</li><li><strong>Week 3–4:</strong> Circuit breaker and retry logic</li><li><strong>Week 5–6:</strong> Shadow traffic comparison with Kong</li><li><strong>Week 7–8:</strong> Gradual traffic cutover</li></ul>\n<h3>Success Criteria</h3>\n<ul><li>p99 latency under 15ms (currently 45ms with Kong)</li><li>Zero downtime during migration</li><li>Full feature parity with existing setup</li></ul>','API Gateway Migration\nWe are migrating from Kong to a custom Go-based API gateway to reduce operational costs and improve latency.\nTimeline\nWeek 1–2: Core routing and middlewareWeek 3–4: Circuit breaker and retry logicWeek 5–6: Shadow traffic comparison with KongWeek 7–8: Gradual traffic cutover\nSuccess Criteria\np99 latency under 15ms (currently 45ms with Kong)Zero downtime during migrationFull feature parity with existing setup',''),(23,0,0,1,'wysiwyg','<h2>Performance Benchmarks</h2>\n<p>Baseline performance targets for Q1 2026:</p>\n<table><thead><tr><th>Metric</th><th>Current</th><th>Target</th></tr></thead>\n<tbody><tr><td>API p50 latency</td><td>12ms</td><td>8ms</td></tr><tr><td>API p99 latency</td><td>85ms</td><td>50ms</td></tr><tr><td>Throughput (rps)</td><td>12,000</td><td>20,000</td></tr><tr><td>Error rate</td><td>0.3%</td><td>&lt;0.1%</td></tr></tbody></table>\n<p>Benchmarks are run nightly against a staging environment using k6 with 200 virtual users over 10 minutes.</p>','Performance Benchmarks\nBaseline performance targets for Q1 2026:\nMetricCurrentTarget\nAPI p50 latency12ms8msAPI p99 latency85ms50msThroughput (rps)12,00020,000Error rate0.3%&lt;0.1%\nBenchmarks are run nightly against a staging environment using k6 with 200 virtual users over 10 minutes.',''),(25,0,0,1,'wysiwyg','<h2>Multi-Tenant Architecture</h2>\n<p>Phase 2 introduces true multi-tenancy to support enterprise customers.</p>\n<h3>Data Isolation</h3>\n<p>We use a <strong>schema-per-tenant</strong> model in PostgreSQL. Each tenant gets a dedicated schema.</p>\n<h3>Routing</h3>\n<p>Tenants are identified by subdomain: <code>{tenant}.app.company.io</code>. The API gateway extracts the tenant ID and injects it as a header.</p>\n<h3>Limits</h3>\n<ul><li>Max 10,000 users per tenant</li><li>50 GB storage per tenant (soft limit)</li><li>Rate limited to 1,000 API calls/minute per tenant</li></ul>','Multi-Tenant Architecture\nPhase 2 introduces true multi-tenancy to support enterprise customers.\nData Isolation\nWe use a schema-per-tenant model in PostgreSQL. Each tenant gets a dedicated schema.\nRouting\nTenants are identified by subdomain: {tenant}.app.company.io. The API gateway extracts the tenant ID and injects it as a header.\nLimits\nMax 10,000 users per tenant50 GB storage per tenant (soft limit)Rate limited to 1,000 API calls/minute per tenant',''),(26,0,0,1,'wysiwyg','<h2>Analytics Dashboard v2</h2>\n<p>The next iteration of the analytics dashboard focuses on real-time insights and self-service reporting.</p>\n<h3>Key Features</h3>\n<ul><li>Real-time event streaming via WebSockets</li><li>Custom report builder with drag-and-drop interface</li><li>Scheduled report delivery via email</li><li>Data export to CSV and Parquet formats</li></ul>\n<h3>Tech Stack</h3>\n<p>Frontend: React + D3.js. Backend: Clickhouse for analytics queries, Redis for caching aggregations, Go service for the API layer.</p>','Analytics Dashboard v2\nThe next iteration of the analytics dashboard focuses on real-time insights and self-service reporting.\nKey Features\nReal-time event streaming via WebSocketsCustom report builder with drag-and-drop interfaceScheduled report delivery via emailData export to CSV and Parquet formats\nTech Stack\nFrontend: React + D3.js. Backend: Clickhouse for analytics queries, Redis for caching aggregations, Go service for the API layer.',''),(29,0,0,1,'wysiwyg','<h2>Incident Severity Classification</h2>\n<table><thead><tr><th>Severity</th><th>Description</th><th>Response Time</th><th>Example</th></tr></thead>\n<tbody><tr><td>SEV-1</td><td>Complete outage or data loss</td><td>15 minutes</td><td>Database corruption, auth service down</td></tr><tr><td>SEV-2</td><td>Major feature degraded</td><td>1 hour</td><td>Payment processing failing</td></tr><tr><td>SEV-3</td><td>Minor feature issue</td><td>4 hours</td><td>Dashboard widget not loading</td></tr><tr><td>SEV-4</td><td>Cosmetic or low-impact</td><td>Next business day</td><td>Typo in UI</td></tr></tbody></table>\n<h3>Escalation</h3>\n<p>SEV-1 and SEV-2 incidents automatically page the on-call engineer and notify the engineering manager.</p>','Incident Severity Classification\nSeverityDescriptionResponse TimeExample\nSEV-1Complete outage or data loss15 minutesDatabase corruption, auth service downSEV-2Major feature degraded1 hourPayment processing failingSEV-3Minor feature issue4 hoursDashboard widget not loadingSEV-4Cosmetic or low-impactNext business dayTypo in UI\nEscalation\nSEV-1 and SEV-2 incidents automatically page the on-call engineer and notify the engineering manager.',''),(30,0,0,1,'wysiwyg','<h2>Data Breach Response Plan</h2>\n<h3>Immediate Actions (First 30 Minutes)</h3>\n<ol><li>Confirm the breach and assess scope</li><li>Isolate affected systems (revoke compromised credentials, block IPs)</li><li>Notify the incident commander and security team lead</li><li>Begin evidence preservation — do not modify or delete logs</li></ol>\n<h3>Notification Requirements</h3>\n<p>Under GDPR, affected EU users must be notified within 72 hours. California residents must be notified under CCPA. Legal counsel must approve all communications before sending.</p>','Data Breach Response Plan\nImmediate Actions (First 30 Minutes)\nConfirm the breach and assess scopeIsolate affected systems (revoke compromised credentials, block IPs)Notify the incident commander and security team leadBegin evidence preservation — do not modify or delete logs\nNotification Requirements\nUnder GDPR, affected EU users must be notified within 72 hours. California residents must be notified under CCPA. Legal counsel must approve all communications before sending.',''),(31,0,0,1,'wysiwyg','<h2>Credential Rotation Procedures</h2>\n<p>All production credentials must be rotated according to this schedule:</p>\n<table><thead><tr><th>Credential Type</th><th>Rotation Frequency</th><th>Owner</th></tr></thead>\n<tbody><tr><td>Database passwords</td><td>Every 90 days</td><td>Platform team</td></tr><tr><td>API keys (internal)</td><td>Every 90 days</td><td>Service owner</td></tr><tr><td>TLS certificates</td><td>Every 365 days</td><td>Platform team</td></tr><tr><td>SSH keys</td><td>Every 180 days</td><td>Individual</td></tr></tbody></table>\n<h3>Rotation Process</h3>\n<ol><li>Generate the new credential in AWS SSM Parameter Store</li><li>Deploy the application with the new credential (dual-read period)</li><li>Verify functionality with the new credential</li><li>Revoke the old credential</li><li>Update the rotation log in this wiki</li></ol>','Credential Rotation Procedures\nAll production credentials must be rotated according to this schedule:\nCredential TypeRotation FrequencyOwner\nDatabase passwordsEvery 90 daysPlatform teamAPI keys (internal)Every 90 daysService ownerTLS certificatesEvery 365 daysPlatform teamSSH keysEvery 180 daysIndividual\nRotation Process\nGenerate the new credential in AWS SSM Parameter StoreDeploy the application with the new credential (dual-read period)Verify functionality with the new credentialRevoke the old credentialUpdate the rotation log in this wiki',''),(33,0,0,1,'wysiwyg','<h2>SOC 2 Controls Mapping</h2>\n<p>This document maps our internal controls to SOC 2 Trust Services Criteria.</p>\n<h3>Security (Common Criteria)</h3>\n<ul><li><strong>CC6.1:</strong> Logical access controls — enforced via RBAC with SSO (Okta) and MFA</li><li><strong>CC6.2:</strong> System access restrictions — least privilege; access reviews quarterly</li><li><strong>CC6.3:</strong> Encryption — TLS 1.3 in transit, AES-256 at rest</li><li><strong>CC7.2:</strong> Monitoring — Datadog APM, CloudTrail, centralized logging via ELK</li></ul>\n<h3>Availability</h3>\n<ul><li><strong>A1.2:</strong> 99.95% uptime SLA — multi-AZ deployment, automated failover</li></ul>','SOC 2 Controls Mapping\nThis document maps our internal controls to SOC 2 Trust Services Criteria.\nSecurity (Common Criteria)\nCC6.1: Logical access controls — enforced via RBAC with SSO (Okta) and MFACC6.2: System access restrictions — least privilege; access reviews quarterlyCC6.3: Encryption — TLS 1.3 in transit, AES-256 at restCC7.2: Monitoring — Datadog APM, CloudTrail, centralized logging via ELK\nAvailability\nA1.2: 99.95% uptime SLA — multi-AZ deployment, automated failover',''),(36,0,0,1,'wysiwyg','<h2>Monitoring with Grafana</h2>\n<p>Our primary monitoring stack is Prometheus + Grafana, deployed in the <code>monitoring</code> namespace.</p>\n<h3>Dashboards</h3>\n<ul><li><strong>Service Overview:</strong> Request rate, error rate, and latency per service</li><li><strong>Infrastructure:</strong> CPU, memory, disk, and network across all nodes</li><li><strong>Business Metrics:</strong> Signups, active users, and revenue (updated hourly)</li></ul>\n<h3>Alerting</h3>\n<p>Alerts are routed through PagerDuty. Critical alerts trigger phone calls; warning alerts go to Slack <code>#alerts</code>.</p>','Monitoring with Grafana\nOur primary monitoring stack is Prometheus + Grafana, deployed in the monitoring namespace.\nDashboards\nService Overview: Request rate, error rate, and latency per serviceInfrastructure: CPU, memory, disk, and network across all nodesBusiness Metrics: Signups, active users, and revenue (updated hourly)\nAlerting\nAlerts are routed through PagerDuty. Critical alerts trigger phone calls; warning alerts go to Slack #alerts.',''),(37,0,0,1,'wysiwyg','<h2>Slack Channel Directory</h2>\n<table><thead><tr><th>Channel</th><th>Purpose</th><th>Who Should Join</th></tr></thead>\n<tbody><tr><td>#engineering</td><td>General engineering discussion</td><td>All engineers</td></tr><tr><td>#incidents</td><td>Active incident coordination</td><td>On-call, leads</td></tr><tr><td>#deploys</td><td>Deployment notifications (bot)</td><td>All engineers</td></tr><tr><td>#code-review</td><td>PR notifications and discussion</td><td>All engineers</td></tr><tr><td>#random</td><td>Non-work chat</td><td>Everyone</td></tr><tr><td>#product</td><td>Product roadmap discussion</td><td>Product, engineering leads</td></tr><tr><td>#security</td><td>Security alerts and discussion</td><td>Security team, leads</td></tr></tbody></table>','Slack Channel Directory\nChannelPurposeWho Should Join\n#engineeringGeneral engineering discussionAll engineers#incidentsActive incident coordinationOn-call, leads#deploysDeployment notifications (bot)All engineers#code-reviewPR notifications and discussionAll engineers#randomNon-work chatEveryone#productProduct roadmap discussionProduct, engineering leads#securitySecurity alerts and discussionSecurity team, leads',''),(39,0,0,1,'wysiwyg','<h2>Sprint Retrospective — 2026-W18</h2>\n<p><strong>Date:</strong> May 2, 2026 | <strong>Facilitator:</strong> James Miller</p>\n<h3>What Went Well</h3>\n<ul><li>API gateway migration completed ahead of schedule</li><li>Zero-downtime deployment for billing service v3</li><li>New monitoring dashboards caught a memory leak early</li></ul>\n<h3>What Could Be Improved</h3>\n<ul><li>Flaky integration tests blocked deploys 3 times this sprint</li><li>Cross-team dependency on auth-service slowed user-service work</li><li>Sprint planning overcommitted — we carried over 2 stories</li></ul>\n<h3>Action Items</h3>\n<ul><li>Sarah: investigate and fix top 5 flaky tests by end of W19</li><li>James: set up a shared integration test environment by W20</li><li>Team: reduce sprint scope by 15% next sprint as an experiment</li></ul>','Sprint Retrospective — 2026-W18\nDate: May 2, 2026 | Facilitator: James Miller\nWhat Went Well\nAPI gateway migration completed ahead of scheduleZero-downtime deployment for billing service v3New monitoring dashboards caught a memory leak early\nWhat Could Be Improved\nFlaky integration tests blocked deploys 3 times this sprintCross-team dependency on auth-service slowed user-service workSprint planning overcommitted — we carried over 2 stories\nAction Items\nSarah: investigate and fix top 5 flaky tests by end of W19James: set up a shared integration test environment by W20Team: reduce sprint scope by 15% next sprint as an experiment',''),(40,0,0,1,'wysiwyg','<h2>Architecture Review — May 2026</h2>\n<p><strong>Date:</strong> May 9, 2026 | <strong>Attendees:</strong> Sarah Chen, James Miller, Admin</p>\n<h3>Topic: Event Sourcing for Audit Trail</h3>\n<p>We evaluated replacing the current audit log with an event-sourced architecture using Kafka.</p>\n<h3>Pros</h3>\n<ul><li>Complete reconstruction of entity state at any point in time</li><li>Decoupled consumers for analytics, compliance, and debugging</li></ul>\n<h3>Cons</h3>\n<ul><li>Significant complexity increase (schema registry, event versioning)</li><li>Kafka operational overhead — 3-node minimum, partition management</li><li>Current audit log meets compliance requirements as-is</li></ul>\n<h3>Decision</h3>\n<p><strong>Not now.</strong> We will revisit in Q4 when multi-tenancy is stable. For now, we will add a <code>payload</code> JSONB column to the existing audit table.</p>','Architecture Review — May 2026\nDate: May 9, 2026 | Attendees: Sarah Chen, James Miller, Admin\nTopic: Event Sourcing for Audit Trail\nWe evaluated replacing the current audit log with an event-sourced architecture using Kafka.\nPros\nComplete reconstruction of entity state at any point in timeDecoupled consumers for analytics, compliance, and debugging\nCons\nSignificant complexity increase (schema registry, event versioning)Kafka operational overhead — 3-node minimum, partition managementCurrent audit log meets compliance requirements as-is\nDecision\nNot now. We will revisit in Q4 when multi-tenancy is stable. For now, we will add a payload JSONB column to the existing audit table.','');
/*!40000 ALTER TABLE `entity_page_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_permissions`
--

DROP TABLE IF EXISTS `entity_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint unsigned NOT NULL,
  `entity_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int unsigned NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `new_entity_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `new_entity_permissions_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_permissions`
--

LOCK TABLES `entity_permissions` WRITE;
/*!40000 ALTER TABLE `entity_permissions` DISABLE KEYS */;
INSERT INTO `entity_permissions` VALUES (1,27,'book',1,1,1,1,1),(2,12,'book',1,1,1,1,1),(3,12,'book',2,1,0,0,0);
/*!40000 ALTER TABLE `entity_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `favouritable_id` bigint unsigned NOT NULL,
  `favouritable_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favouritable_index` (`favouritable_id`,`favouritable_type`),
  KEY `favourites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_to` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_type_index` (`type`),
  KEY `images_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joint_permissions`
--

DROP TABLE IF EXISTS `joint_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joint_permissions` (
  `role_id` int NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `owner_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`,`entity_type`,`entity_id`),
  KEY `joint_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `joint_permissions_role_id_index` (`role_id`),
  KEY `joint_permissions_status_index` (`status`),
  KEY `joint_permissions_owner_id_index` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joint_permissions`
--

LOCK TABLES `joint_permissions` WRITE;
/*!40000 ALTER TABLE `joint_permissions` DISABLE KEYS */;
INSERT INTO `joint_permissions` VALUES (1,'book',1,3,3),(1,'book',12,3,1),(1,'book',20,3,4),(1,'book',27,3,1),(1,'book',34,3,3),(1,'bookshelf',41,3,3),(1,'bookshelf',42,3,1),(1,'chapter',2,3,3),(1,'chapter',6,3,3),(1,'chapter',9,3,4),(1,'chapter',13,3,1),(1,'chapter',17,3,1),(1,'chapter',21,3,4),(1,'chapter',24,3,4),(1,'chapter',28,3,1),(1,'chapter',32,3,1),(1,'chapter',35,3,3),(1,'chapter',38,3,4),(1,'page',3,3,3),(1,'page',4,3,3),(1,'page',5,3,3),(1,'page',7,3,3),(1,'page',8,3,3),(1,'page',10,3,4),(1,'page',11,3,4),(1,'page',14,3,1),(1,'page',15,3,1),(1,'page',16,3,1),(1,'page',18,3,1),(1,'page',19,3,1),(1,'page',22,3,4),(1,'page',23,3,4),(1,'page',25,3,4),(1,'page',26,3,4),(1,'page',29,3,1),(1,'page',30,3,1),(1,'page',31,3,1),(1,'page',33,3,1),(1,'page',36,3,3),(1,'page',37,3,3),(1,'page',39,3,4),(1,'page',40,3,4),(2,'book',1,1,3),(2,'book',12,3,NULL),(2,'book',20,1,4),(2,'book',27,1,1),(2,'book',34,1,3),(2,'bookshelf',41,1,3),(2,'bookshelf',42,1,1),(2,'chapter',2,1,3),(2,'chapter',6,1,3),(2,'chapter',9,1,4),(2,'chapter',13,3,NULL),(2,'chapter',17,3,NULL),(2,'chapter',21,1,4),(2,'chapter',24,1,4),(2,'chapter',28,1,1),(2,'chapter',32,1,1),(2,'chapter',35,1,3),(2,'chapter',38,1,4),(2,'page',3,1,3),(2,'page',4,1,3),(2,'page',5,1,3),(2,'page',7,1,3),(2,'page',8,1,3),(2,'page',10,1,4),(2,'page',11,1,4),(2,'page',14,3,NULL),(2,'page',15,3,NULL),(2,'page',16,3,NULL),(2,'page',18,3,NULL),(2,'page',19,3,NULL),(2,'page',22,1,4),(2,'page',23,1,4),(2,'page',25,1,4),(2,'page',26,1,4),(2,'page',29,1,1),(2,'page',30,1,1),(2,'page',31,1,1),(2,'page',33,1,1),(2,'page',36,1,3),(2,'page',37,1,3),(2,'page',39,1,4),(2,'page',40,1,4),(3,'book',1,1,3),(3,'book',12,1,1),(3,'book',20,1,4),(3,'book',27,1,1),(3,'book',34,1,3),(3,'bookshelf',41,1,3),(3,'bookshelf',42,1,1),(3,'chapter',2,1,3),(3,'chapter',6,1,3),(3,'chapter',9,1,4),(3,'chapter',13,1,1),(3,'chapter',17,1,1),(3,'chapter',21,1,4),(3,'chapter',24,1,4),(3,'chapter',28,1,1),(3,'chapter',32,1,1),(3,'chapter',35,1,3),(3,'chapter',38,1,4),(3,'page',3,1,3),(3,'page',4,1,3),(3,'page',5,1,3),(3,'page',7,1,3),(3,'page',8,1,3),(3,'page',10,1,4),(3,'page',11,1,4),(3,'page',14,1,1),(3,'page',15,1,1),(3,'page',16,1,1),(3,'page',18,1,1),(3,'page',19,1,1),(3,'page',22,1,4),(3,'page',23,1,4),(3,'page',25,1,4),(3,'page',26,1,4),(3,'page',29,1,1),(3,'page',30,1,1),(3,'page',31,1,1),(3,'page',33,1,1),(3,'page',36,1,3),(3,'page',37,1,3),(3,'page',39,1,4),(3,'page',40,1,4),(4,'book',1,1,3),(4,'book',12,1,1),(4,'book',20,1,4),(4,'book',27,1,1),(4,'book',34,1,3),(4,'bookshelf',41,1,3),(4,'bookshelf',42,1,1),(4,'chapter',2,1,3),(4,'chapter',6,1,3),(4,'chapter',9,1,4),(4,'chapter',13,1,1),(4,'chapter',17,1,1),(4,'chapter',21,1,4),(4,'chapter',24,1,4),(4,'chapter',28,1,1),(4,'chapter',32,1,1),(4,'chapter',35,1,3),(4,'chapter',38,1,4),(4,'page',3,1,3),(4,'page',4,1,3),(4,'page',5,1,3),(4,'page',7,1,3),(4,'page',8,1,3),(4,'page',10,1,4),(4,'page',11,1,4),(4,'page',14,1,1),(4,'page',15,1,1),(4,'page',16,1,1),(4,'page',18,1,1),(4,'page',19,1,1),(4,'page',22,1,4),(4,'page',23,1,4),(4,'page',25,1,4),(4,'page',26,1,4),(4,'page',29,1,1),(4,'page',30,1,1),(4,'page',31,1,1),(4,'page',33,1,1),(4,'page',36,1,3),(4,'page',37,1,3),(4,'page',39,1,4),(4,'page',40,1,4);
/*!40000 ALTER TABLE `joint_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mention_history`
--

DROP TABLE IF EXISTS `mention_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mention_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mentionable_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mentionable_id` bigint unsigned NOT NULL,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mention_history_mentionable_type_index` (`mentionable_type`),
  KEY `mention_history_mentionable_id_index` (`mentionable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mention_history`
--

LOCK TABLES `mention_history` WRITE;
/*!40000 ALTER TABLE `mention_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mention_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfa_values`
--

DROP TABLE IF EXISTS `mfa_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfa_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfa_values_user_id_index` (`user_id`),
  KEY `mfa_values_method_index` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfa_values`
--

LOCK TABLES `mfa_values` WRITE;
/*!40000 ALTER TABLE `mfa_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfa_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2015_07_12_114933_create_books_table',1),(4,'2015_07_12_190027_create_pages_table',1),(5,'2015_07_13_172121_create_images_table',1),(6,'2015_07_27_172342_create_chapters_table',1),(7,'2015_08_08_200447_add_users_to_entities',1),(8,'2015_08_09_093534_create_page_revisions_table',1),(9,'2015_08_16_142133_create_activities_table',1),(10,'2015_08_29_105422_add_roles_and_permissions',1),(11,'2015_08_30_125859_create_settings_table',1),(12,'2015_08_31_175240_add_search_indexes',1),(13,'2015_09_04_165821_create_social_accounts_table',1),(14,'2015_09_05_164707_add_email_confirmation_table',1),(15,'2015_11_21_145609_create_views_table',1),(16,'2015_11_26_221857_add_entity_indexes',1),(17,'2015_12_05_145049_fulltext_weighting',1),(18,'2015_12_07_195238_add_image_upload_types',1),(19,'2015_12_09_195748_add_user_avatars',1),(20,'2016_01_11_210908_add_external_auth_to_users',1),(21,'2016_02_25_184030_add_slug_to_revisions',1),(22,'2016_02_27_120329_update_permissions_and_roles',1),(23,'2016_02_28_084200_add_entity_access_controls',1),(24,'2016_03_09_203143_add_page_revision_types',1),(25,'2016_03_13_082138_add_page_drafts',1),(26,'2016_03_25_123157_add_markdown_support',1),(27,'2016_04_09_100730_add_view_permissions_to_roles',1),(28,'2016_04_20_192649_create_joint_permissions_table',1),(29,'2016_05_06_185215_create_tags_table',1),(30,'2016_07_07_181521_add_summary_to_page_revisions',1),(31,'2016_09_29_101449_remove_hidden_roles',1),(32,'2016_10_09_142037_create_attachments_table',1),(33,'2017_01_21_163556_create_cache_table',1),(34,'2017_01_21_163602_create_sessions_table',1),(35,'2017_03_19_091553_create_search_index_table',1),(36,'2017_04_20_185112_add_revision_counts',1),(37,'2017_07_02_152834_update_db_encoding_to_ut8mb4',1),(38,'2017_08_01_130541_create_comments_table',1),(39,'2017_08_29_102650_add_cover_image_display',1),(40,'2018_07_15_173514_add_role_external_auth_id',1),(41,'2018_08_04_115700_create_bookshelves_table',1),(42,'2019_07_07_112515_add_template_support',1),(43,'2019_08_17_140214_add_user_invites_table',1),(44,'2019_12_29_120917_add_api_auth',1),(45,'2020_08_04_111754_drop_joint_permissions_id',1),(46,'2020_08_04_131052_remove_role_name_field',1),(47,'2020_09_19_094251_add_activity_indexes',1),(48,'2020_09_27_210059_add_entity_soft_deletes',1),(49,'2020_09_27_210528_create_deletions_table',1),(50,'2020_11_07_232321_simplify_activities_table',1),(51,'2020_12_30_173528_add_owned_by_field_to_entities',1),(52,'2021_01_30_225441_add_settings_type_column',1),(53,'2021_03_08_215138_add_user_slug',1),(54,'2021_05_15_173110_create_favourites_table',1),(55,'2021_06_30_173111_create_mfa_values_table',1),(56,'2021_07_03_085038_add_mfa_enforced_to_roles_table',1),(57,'2021_08_28_161743_add_export_role_permission',1),(58,'2021_09_26_044614_add_activities_ip_column',1),(59,'2021_11_26_070438_add_index_for_user_ip',1),(60,'2021_12_07_111343_create_webhooks_table',1),(61,'2021_12_13_152024_create_jobs_table',1),(62,'2021_12_13_152120_create_failed_jobs_table',1),(63,'2022_01_03_154041_add_webhooks_timeout_error_columns',1),(64,'2022_04_17_101741_add_editor_change_field_and_permission',1),(65,'2022_04_25_140741_update_polymorphic_types',1),(66,'2022_07_16_170051_drop_joint_permission_type',1),(67,'2022_08_17_092941_create_references_table',1),(68,'2022_09_02_082910_fix_shelf_cover_image_types',1),(69,'2022_10_07_091406_flatten_entity_permissions_table',1),(70,'2022_10_08_104202_drop_entity_restricted_field',1),(71,'2023_01_24_104625_refactor_joint_permissions_storage',1),(72,'2023_01_28_141230_copy_color_settings_for_dark_mode',1),(73,'2023_02_20_093655_increase_attachments_path_length',1),(74,'2023_02_23_200227_add_updated_at_index_to_pages',1),(75,'2023_06_10_071823_remove_guest_user_secondary_roles',1),(76,'2023_06_25_181952_remove_bookshelf_create_entity_permissions',1),(77,'2023_07_25_124945_add_receive_notifications_role_permissions',1),(78,'2023_07_31_104430_create_watches_table',1),(79,'2023_08_21_174248_increase_cache_size',1),(80,'2023_12_02_104541_add_default_template_to_books',1),(81,'2023_12_17_140913_add_description_html_to_entities',1),(82,'2024_01_01_104542_add_default_template_to_chapters',1),(83,'2024_02_04_141358_add_views_updated_index',1),(84,'2024_05_04_154409_rename_activity_relation_columns',1),(85,'2024_09_29_140340_ensure_editor_value_set',1),(86,'2024_10_29_114420_add_import_role_permission',1),(87,'2024_11_02_160700_create_imports_table',1),(88,'2024_11_27_171039_add_instance_id_setting',1),(89,'2025_01_29_180933_create_sort_rules_table',1),(90,'2025_02_05_150842_add_sort_rule_id_to_books',1),(91,'2025_04_18_215145_add_content_refs_and_archived_to_comments',1),(92,'2025_09_02_111542_remove_unused_columns',1),(93,'2025_09_15_132850_create_entities_table',1),(94,'2025_09_15_134701_migrate_entity_data',1),(95,'2025_09_15_134751_update_entity_relation_columns',1),(96,'2025_09_15_134813_drop_old_entity_tables',1),(97,'2025_10_18_163331_clean_user_id_references',1),(98,'2025_10_22_134507_update_comments_relation_field_names',1),(99,'2025_11_23_161812_create_slug_history_table',1),(100,'2025_12_15_140219_create_mention_history_table',1),(101,'2025_12_19_103417_add_views_viewable_type_index',1),(102,'2026_04_30_000000_add_session_token_to_users',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_revisions`
--

DROP TABLE IF EXISTS `page_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'version',
  `markdown` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_revisions_page_id_index` (`page_id`),
  KEY `page_revisions_slug_index` (`slug`),
  KEY `page_revisions_book_slug_index` (`book_slug`),
  KEY `page_revisions_type_index` (`type`),
  KEY `page_revisions_revision_number_index` (`revision_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_revisions`
--

LOCK TABLES `page_revisions` WRITE;
/*!40000 ALTER TABLE `page_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `role_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(76,2),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(66,3),(67,3),(76,3),(48,4),(49,4),(50,4),(51,4),(52,4),(53,4),(66,4),(67,4),(76,4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `references` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_id` bigint unsigned NOT NULL,
  `from_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint unsigned NOT NULL,
  `to_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `references_from_id_index` (`from_id`),
  KEY `references_from_type_index` (`from_type`),
  KEY `references_to_id_index` (`to_id`),
  KEY `references_to_type_index` (`to_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (19,'settings-manage','2026-05-13 10:07:05','2026-05-13 10:07:05'),(20,'users-manage','2026-05-13 10:07:05','2026-05-13 10:07:05'),(21,'user-roles-manage','2026-05-13 10:07:05','2026-05-13 10:07:05'),(22,'restrictions-manage-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(23,'restrictions-manage-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(24,'book-create-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(25,'book-create-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(26,'book-update-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(27,'book-update-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(28,'book-delete-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(29,'book-delete-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(30,'page-create-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(31,'page-create-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(32,'page-update-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(33,'page-update-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(34,'page-delete-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(35,'page-delete-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(36,'chapter-create-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(37,'chapter-create-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(38,'chapter-update-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(39,'chapter-update-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(40,'chapter-delete-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(41,'chapter-delete-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(42,'image-create-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(43,'image-create-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(44,'image-update-all','2026-05-13 10:07:05','2026-05-13 10:07:05'),(45,'image-update-own','2026-05-13 10:07:05','2026-05-13 10:07:05'),(46,'image-delete-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(47,'image-delete-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(48,'book-view-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(49,'book-view-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(50,'page-view-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(51,'page-view-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(52,'chapter-view-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(53,'chapter-view-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(54,'attachment-create-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(55,'attachment-create-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(56,'attachment-update-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(57,'attachment-update-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(58,'attachment-delete-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(59,'attachment-delete-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(60,'comment-create-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(61,'comment-create-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(62,'comment-update-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(63,'comment-update-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(64,'comment-delete-all','2026-05-13 10:07:06','2026-05-13 10:07:06'),(65,'comment-delete-own','2026-05-13 10:07:06','2026-05-13 10:07:06'),(66,'bookshelf-view-all','2026-05-13 10:07:07','2026-05-13 10:07:07'),(67,'bookshelf-view-own','2026-05-13 10:07:07','2026-05-13 10:07:07'),(68,'bookshelf-create-all','2026-05-13 10:07:07','2026-05-13 10:07:07'),(69,'bookshelf-create-own','2026-05-13 10:07:07','2026-05-13 10:07:07'),(70,'bookshelf-update-all','2026-05-13 10:07:07','2026-05-13 10:07:07'),(71,'bookshelf-update-own','2026-05-13 10:07:07','2026-05-13 10:07:07'),(72,'bookshelf-delete-all','2026-05-13 10:07:07','2026-05-13 10:07:07'),(73,'bookshelf-delete-own','2026-05-13 10:07:07','2026-05-13 10:07:07'),(74,'templates-manage','2026-05-13 10:07:07','2026-05-13 10:07:07'),(75,'access-api','2026-05-13 10:07:07','2026-05-13 10:07:07'),(76,'content-export','2026-05-13 10:07:08','2026-05-13 10:07:08'),(77,'editor-change','2026-05-13 10:07:08','2026-05-13 10:07:08'),(78,'receive-notifications','2026-05-13 10:07:09','2026-05-13 10:07:09'),(79,'content-import','2026-05-13 10:07:09','2026-05-13 10:07:09');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1),(3,2),(4,2),(5,3),(2,4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `system_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_auth_id` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mfa_enforced` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_system_name_index` (`system_name`),
  KEY `roles_external_auth_id_index` (`external_auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Administrator of the whole application','2026-05-13 10:07:05','2026-05-13 10:07:05','admin','',0),(2,'Editor','User can edit Books, Chapters & Pages','2026-05-13 10:07:05','2026-05-13 10:07:05','','',0),(3,'Viewer','User can view books & their content behind authentication','2026-05-13 10:07:05','2026-05-13 10:07:05','','',0),(4,'Public','The role given to public visitors if allowed','2026-05-13 10:07:06','2026-05-13 10:07:06','public','',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_term_index` (`term`),
  KEY `search_terms_entity_type_index` (`entity_type`),
  KEY `search_terms_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `search_terms_score_index` (`score`)
) ENGINE=InnoDB AUTO_INCREMENT=1662 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES (1,'Engineering','bookshelf',41,48),(2,'All','bookshelf',41,1),(3,'engineering','bookshelf',41,1),(4,'related','bookshelf',41,1),(5,'engineering-related','bookshelf',41,1),(6,'documentation','bookshelf',41,1),(7,'Corporate','bookshelf',42,48),(8,'Company','bookshelf',42,1),(9,'wide','bookshelf',42,1),(10,'Company-wide','bookshelf',42,1),(11,'policies','bookshelf',42,1),(12,'and','bookshelf',42,1),(13,'procedures','bookshelf',42,1),(14,'Engineering','book',1,48),(15,'Handbook','book',1,48),(16,'Standards','book',1,1),(17,'processes','book',1,1),(18,'and','book',1,1),(19,'best','book',1,1),(20,'practices','book',1,1),(21,'for','book',1,1),(22,'the','book',1,1),(23,'engineering','book',1,6),(24,'team','book',1,1),(25,'department','book',1,3),(26,'status','book',1,3),(27,'active','book',1,5),(28,'HR','book',12,48),(29,'Policies','book',12,48),(30,'&','book',12,48),(31,'Handbook','book',12,48),(32,'Company','book',12,1),(33,'policies','book',12,1),(34,'benefits','book',12,1),(35,'and','book',12,1),(36,'employee','book',12,1),(37,'guidelines','book',12,1),(38,'department','book',12,3),(39,'confidentiality','book',12,3),(40,'human','book',12,5),(41,'resources','book',12,5),(42,'human-resources','book',12,5),(43,'internal','book',12,5),(44,'Product','book',20,48),(45,'Roadmap','book',20,48),(46,'2026','book',20,53),(47,'Strategic','book',20,1),(48,'product','book',20,6),(49,'direction','book',20,1),(50,'and','book',20,1),(51,'quarterly','book',20,1),(52,'milestones','book',20,1),(53,'department','book',20,3),(54,'year','book',20,3),(55,'Security','book',27,48),(56,'Runbook','book',27,48),(57,'Incident','book',27,1),(58,'response','book',27,1),(59,'procedures','book',27,1),(60,'and','book',27,1),(61,'security','book',27,6),(62,'protocols','book',27,1),(63,'Restricted','book',27,1),(64,'access','book',27,1),(65,'department','book',27,3),(66,'confidentiality','book',27,3),(67,'compliance','book',27,3),(68,'restricted','book',27,5),(69,'soc2','book',27,5),(70,'Team','book',34,48),(71,'Wiki','book',34,48),(72,'Shared','book',34,1),(73,'knowledge','book',34,1),(74,'base','book',34,1),(75,'for','book',34,1),(76,'day','book',34,2),(77,'to','book',34,1),(78,'day-to-day','book',34,1),(79,'operations','book',34,1),(80,'type','book',34,3),(81,'status','book',34,3),(82,'wiki','book',34,5),(83,'active','book',34,5),(84,'Getting','chapter',2,48),(85,'Started','chapter',2,48),(86,'Onboarding','chapter',2,1),(87,'guide','chapter',2,1),(88,'for','chapter',2,1),(89,'new','chapter',2,1),(90,'engineers','chapter',2,1),(91,'Architecture','chapter',6,48),(92,'System','chapter',6,1),(93,'architecture','chapter',6,1),(94,'and','chapter',6,1),(95,'design','chapter',6,1),(96,'decisions','chapter',6,1),(97,'Deployment','chapter',9,48),(98,'CI/CD','chapter',9,1),(99,'pipelines','chapter',9,1),(100,'and','chapter',9,1),(101,'deployment','chapter',9,1),(102,'processes','chapter',9,1),(103,'Company','chapter',13,48),(104,'Policies','chapter',13,48),(105,'Core','chapter',13,1),(106,'organizational','chapter',13,1),(107,'policies','chapter',13,1),(108,'Benefits','chapter',17,48),(109,'&','chapter',17,48),(110,'Compensation','chapter',17,48),(111,'Employee','chapter',17,1),(112,'benefits','chapter',17,1),(113,'overview','chapter',17,1),(114,'Q1','chapter',21,48),(115,'—','chapter',21,48),(116,'Foundation','chapter',21,48),(117,'Infrastructure','chapter',21,1),(118,'and','chapter',21,1),(119,'core','chapter',21,1),(120,'platform','chapter',21,1),(121,'improvements','chapter',21,1),(122,'Q2','chapter',24,48),(123,'—','chapter',24,48),(124,'Growth','chapter',24,48),(125,'User','chapter',24,1),(126,'acquisition','chapter',24,1),(127,'and','chapter',24,1),(128,'feature','chapter',24,1),(129,'expansion','chapter',24,1),(130,'Incident','chapter',28,48),(131,'Response','chapter',28,48),(132,'Step','chapter',28,1),(133,'by','chapter',28,1),(134,'step','chapter',28,1),(135,'Step-by-step','chapter',28,1),(136,'incident','chapter',28,1),(137,'handling','chapter',28,1),(138,'procedures','chapter',28,1),(139,'Compliance','chapter',32,48),(140,'Regulatory','chapter',32,1),(141,'compliance','chapter',32,1),(142,'documentation','chapter',32,1),(143,'Tools','chapter',35,48),(144,'&','chapter',35,48),(145,'Services','chapter',35,48),(146,'Internal','chapter',35,1),(147,'tooling','chapter',35,1),(148,'documentation','chapter',35,1),(149,'Meeting','chapter',38,48),(150,'Notes','chapter',38,48),(151,'Recurring','chapter',38,1),(152,'meeting','chapter',38,1),(153,'notes','chapter',38,1),(154,'and','chapter',38,1),(155,'action','chapter',38,1),(156,'items','chapter',38,1),(157,'Development','page',3,45),(158,'Environment','page',3,45),(159,'Setup','page',3,45),(160,'This','page',3,1),(161,'guide','page',3,1),(162,'walks','page',3,1),(163,'you','page',3,1),(164,'through','page',3,1),(165,'setting','page',3,1),(166,'up','page',3,2),(167,'your','page',3,1),(168,'local','page',3,1),(169,'development','page',3,1),(170,'environment','page',3,2),(171,'Prerequisites','page',3,4),(172,'Docker','page',3,1),(173,'Desktop','page',3,1),(174,'4','page',3,1),(175,'x','page',3,1),(176,'4.x','page',3,1),(177,'or','page',3,1),(178,'laterNode','page',3,1),(179,'js','page',3,1),(180,'laterNode.js','page',3,1),(181,'22','page',3,1),(182,'LTSGit','page',3,1),(183,'2','page',3,1),(184,'40+','page',3,1),(185,'2.40+','page',3,1),(186,'Steps','page',3,4),(187,'Clone','page',3,1),(188,'the','page',3,5),(189,'repository','page',3,1),(190,'git','page',3,1),(191,'clone','page',3,1),(192,'git@github','page',3,1),(193,'com','page',3,1),(194,'git@github.com','page',3,1),(195,'company/platform','page',3,1),(196,'gitCopy','page',3,1),(197,'company/platform.gitCopy','page',3,1),(198,'file','page',3,1),(199,'cp','page',3,1),(200,'env','page',3,1),(201,'example','page',3,1),(202,'.env.example','page',3,1),(203,'envStart','page',3,1),(204,'.envStart','page',3,1),(205,'services','page',3,1),(206,'docker','page',3,1),(207,'compose','page',3,1),(208,'dInstall','page',3,1),(209,'-dInstall','page',3,1),(210,'dependencies','page',3,1),(211,'npm','page',3,2),(212,'installRun','page',3,1),(213,'migrations','page',3,1),(214,'run','page',3,1),(215,'db','page',3,1),(216,'migrate','page',3,1),(217,'After','page',3,1),(218,'completing','page',3,1),(219,'these','page',3,1),(220,'steps','page',3,1),(221,'application','page',3,1),(222,'should','page',3,1),(223,'be','page',3,1),(224,'available','page',3,1),(225,'at','page',3,1),(226,'http','page',3,1),(227,'//localhost','page',3,1),(228,'3000','page',3,1),(229,'Troubleshooting','page',3,4),(230,'If','page',3,1),(231,'database','page',3,1),(232,'container','page',3,1),(233,'fails','page',3,1),(234,'to','page',3,2),(235,'start','page',3,1),(236,'ensure','page',3,1),(237,'port','page',3,1),(238,'5432','page',3,2),(239,'is','page',3,1),(240,'not','page',3,1),(241,'already','page',3,1),(242,'in','page',3,1),(243,'use','page',3,1),(244,'Run','page',3,1),(245,'lsof','page',3,1),(246,'i','page',3,1),(247,'-i','page',3,1),(248,'check','page',3,1),(249,'project','page',3,3),(250,'priority','page',3,3),(251,'alpha','page',3,5),(252,'high','page',3,5),(253,'Git','page',4,45),(254,'Workflow','page',4,45),(255,'and','page',4,41),(256,'Branch','page',4,44),(257,'Naming','page',4,44),(258,'We','page',4,1),(259,'follow','page',4,1),(260,'a','page',4,3),(261,'trunk','page',4,1),(262,'based','page',4,1),(263,'trunk-based','page',4,1),(264,'development','page',4,1),(265,'model','page',4,1),(266,'with','page',4,2),(267,'short','page',4,2),(268,'lived','page',4,1),(269,'short-lived','page',4,1),(270,'feature','page',4,1),(271,'branches','page',4,1),(272,'Convention','page',4,4),(273,'feature/TICKET','page',4,1),(274,'123','page',4,1),(275,'description','page',4,2),(276,'feature/TICKET-123-short-description','page',4,1),(277,'—','page',4,3),(278,'new','page',4,1),(279,'featuresfix/TICKET','page',4,1),(280,'456','page',4,1),(281,'bug','page',4,2),(282,'featuresfix/TICKET-456-bug-description','page',4,1),(283,'fixeschore/description','page',4,1),(284,'maintenance','page',4,1),(285,'tasks','page',4,1),(286,'Pull','page',4,4),(287,'Request','page',4,4),(288,'Process','page',4,4),(289,'Create','page',4,1),(290,'branch','page',4,1),(291,'from','page',4,1),(292,'mainMake','page',4,1),(293,'your','page',4,1),(294,'changes','page',4,1),(295,'atomic','page',4,1),(296,'commitsOpen','page',4,1),(297,'PR','page',4,1),(298,'request','page',4,1),(299,'at','page',4,1),(300,'least','page',4,1),(301,'one','page',4,1),(302,'reviewSquash','page',4,1),(303,'merge','page',4,1),(304,'reviewSquash-merge','page',4,1),(305,'into','page',4,1),(306,'main','page',4,2),(307,'after','page',4,1),(308,'approval','page',4,1),(309,'All','page',4,1),(310,'PRs','page',4,1),(311,'must','page',4,1),(312,'pass','page',4,1),(313,'CI','page',4,1),(314,'checks','page',4,1),(315,'before','page',4,1),(316,'merging','page',4,1),(317,'Force','page',4,1),(318,'pushing','page',4,1),(319,'Force-pushing','page',4,1),(320,'to','page',4,1),(321,'is','page',4,1),(322,'prohibited','page',4,1),(323,'project','page',4,3),(324,'priority','page',4,3),(325,'beta','page',4,5),(326,'medium','page',4,5),(327,'Code','page',5,46),(328,'Review','page',5,46),(329,'Guidelines','page',5,45),(330,'reviews','page',5,1),(331,'are','page',5,2),(332,'a','page',5,2),(333,'critical','page',5,1),(334,'part','page',5,1),(335,'of','page',5,3),(336,'our','page',5,1),(337,'development','page',5,1),(338,'process','page',5,1),(339,'They','page',5,1),(340,'help','page',5,1),(341,'maintain','page',5,1),(342,'quality','page',5,1),(343,'share','page',5,1),(344,'knowledge','page',5,1),(345,'and','page',5,2),(346,'catch','page',5,1),(347,'bugs','page',5,1),(348,'early','page',5,1),(349,'For','page',5,8),(350,'Authors','page',5,4),(351,'Keep','page',5,1),(352,'PRs','page',5,1),(353,'small','page',5,1),(354,'—','page',5,1),(355,'aim','page',5,1),(356,'for','page',5,2),(357,'under','page',5,1),(358,'400','page',5,1),(359,'lines','page',5,1),(360,'diffWrite','page',5,1),(361,'clear','page',5,1),(362,'description','page',5,1),(363,'explaining','page',5,1),(364,'the','page',5,2),(365,'why','page',5,1),(366,'not','page',5,1),(367,'just','page',5,1),(368,'what','page',5,1),(369,'Self','page',5,1),(370,'review','page',5,1),(371,'Self-review','page',5,1),(372,'your','page',5,1),(373,'diff','page',5,1),(374,'before','page',5,1),(375,'requesting','page',5,1),(376,'reviewsRespond','page',5,1),(377,'to','page',5,1),(378,'feedback','page',5,1),(379,'within','page',5,2),(380,'one','page',5,1),(381,'business','page',5,1),(382,'day','page',5,1),(383,'Reviewers','page',5,4),(384,'4','page',5,1),(385,'hours','page',5,1),(386,'being','page',5,1),(387,'assignedFocus','page',5,1),(388,'on','page',5,1),(389,'logic','page',5,1),(390,'security','page',5,1),(391,'maintainabilityUse','page',5,1),(392,'nit','page',5,1),(393,'prefix','page',5,1),(394,'non','page',5,1),(395,'blocking','page',5,2),(396,'non-blocking','page',5,1),(397,'suggestionsApprove','page',5,1),(398,'when','page',5,1),(399,'all','page',5,1),(400,'comments','page',5,1),(401,'resolved','page',5,1),(402,'project','page',5,3),(403,'priority','page',5,3),(404,'gamma','page',5,5),(405,'low','page',5,5),(406,'Microservices','page',7,45),(407,'Overview','page',7,45),(408,'Our','page',7,1),(409,'platform','page',7,1),(410,'consists','page',7,1),(411,'of','page',7,1),(412,'the','page',7,2),(413,'following','page',7,1),(414,'core','page',7,1),(415,'services','page',7,1),(416,'ServicePortLanguageDatabase','page',7,1),(417,'auth','page',7,1),(418,'service8001GoPostgreSQLuser','page',7,1),(419,'service8002GoPostgreSQLnotification','page',7,1),(420,'service8003PythonRedisbilling','page',7,1),(421,'service8004TypeScriptPostgreSQLapi','page',7,1),(422,'gateway8080Go—','page',7,1),(423,'auth-service8001GoPostgreSQLuser-service8002GoPostgreSQLnotification-service8003PythonRedisbilling-service8004TypeScriptPostgreSQLapi-gateway8080Go—','page',7,1),(424,'Communication','page',7,4),(425,'Services','page',7,1),(426,'communicate','page',7,1),(427,'via','page',7,1),(428,'gRPC','page',7,1),(429,'for','page',7,2),(430,'synchronous','page',7,1),(431,'calls','page',7,1),(432,'and','page',7,2),(433,'NATS','page',7,1),(434,'asynchronous','page',7,1),(435,'events','page',7,1),(436,'The','page',7,1),(437,'API','page',7,1),(438,'gateway','page',7,1),(439,'handles','page',7,1),(440,'external','page',7,1),(441,'HTTP','page',7,1),(442,'traffic','page',7,1),(443,'routes','page',7,1),(444,'to','page',7,1),(445,'appropriate','page',7,1),(446,'service','page',7,1),(447,'project','page',7,3),(448,'priority','page',7,3),(449,'delta','page',7,5),(450,'high','page',7,5),(451,'Database','page',8,45),(452,'Design','page',8,45),(453,'Patterns','page',8,45),(454,'We','page',8,1),(455,'follow','page',8,1),(456,'these','page',8,1),(457,'patterns','page',8,1),(458,'across','page',8,1),(459,'all','page',8,2),(460,'services','page',8,1),(461,'that','page',8,2),(462,'use','page',8,1),(463,'PostgreSQL','page',8,1),(464,'Naming','page',8,4),(465,'Conventions','page',8,4),(466,'Tables','page',8,1),(467,'plural','page',8,1),(468,'snake_case','page',8,2),(469,'user_accounts','page',8,1),(470,'Columns','page',8,1),(471,'singular','page',8,1),(472,'created_at','page',8,1),(473,'Indexes','page',8,1),(474,'idx_tablename_columnnameForeign','page',8,1),(475,'keys','page',8,1),(476,'fk_tablename_reference','page',8,1),(477,'Migration','page',8,4),(478,'Rules','page',8,4),(479,'Every','page',8,1),(480,'migration','page',8,3),(481,'must','page',8,2),(482,'be','page',8,2),(483,'reversibleNever','page',8,1),(484,'modify','page',8,1),(485,'a','page',8,1),(486,'has','page',8,1),(487,'been','page',8,1),(488,'deployed','page',8,1),(489,'to','page',8,1),(490,'staging','page',8,1),(491,'or','page',8,1),(492,'productionLarge','page',8,1),(493,'data','page',8,3),(494,'migrations','page',8,1),(495,'run','page',8,1),(496,'as','page',8,1),(497,'background','page',8,1),(498,'jobs','page',8,1),(499,'not','page',8,1),(500,'in','page',8,1),(501,'the','page',8,1),(502,'itself','page',8,1),(503,'Soft','page',8,4),(504,'Deletes','page',8,4),(505,'Use','page',8,1),(506,'deleted_at','page',8,1),(507,'columns','page',8,1),(508,'for','page',8,2),(509,'user','page',8,1),(510,'facing','page',8,1),(511,'user-facing','page',8,1),(512,'Hard','page',8,1),(513,'deletes','page',8,1),(514,'are','page',8,1),(515,'only','page',8,1),(516,'permitted','page',8,1),(517,'truly','page',8,1),(518,'ephemeral','page',8,1),(519,'like','page',8,1),(520,'session','page',8,1),(521,'records','page',8,1),(522,'project','page',8,3),(523,'priority','page',8,3),(524,'alpha','page',8,5),(525,'medium','page',8,5),(526,'CI/CD','page',10,46),(527,'Pipeline','page',10,45),(528,'Configuration','page',10,40),(529,'Our','page',10,1),(530,'runs','page',10,1),(531,'on','page',10,2),(532,'GitHub','page',10,1),(533,'Actions','page',10,1),(534,'with','page',10,2),(535,'the','page',10,2),(536,'following','page',10,1),(537,'stages','page',10,1),(538,'Lint','page',10,1),(539,'—','page',10,5),(540,'ESLint','page',10,1),(541,'golangci','page',10,1),(542,'lint','page',10,1),(543,'golangci-lint','page',10,1),(544,'RuffTest','page',10,1),(545,'Unit','page',10,1),(546,'tests','page',10,1),(547,'coverage','page',10,1),(548,'threshold','page',10,1),(549,'of','page',10,1),(550,'80%Build','page',10,1),(551,'Docker','page',10,1),(552,'image','page',10,1),(553,'build','page',10,1),(554,'and','page',10,2),(555,'push','page',10,1),(556,'to','page',10,3),(557,'ECRDeploy','page',10,1),(558,'staging','page',10,1),(559,'Automatic','page',10,1),(560,'merge','page',10,1),(561,'mainDeploy','page',10,1),(562,'production','page',10,1),(563,'Manual','page',10,1),(564,'approval','page',10,1),(565,'required','page',10,1),(566,'Environment','page',10,4),(567,'Variables','page',10,4),(568,'Secrets','page',10,1),(569,'are','page',10,1),(570,'managed','page',10,1),(571,'via','page',10,1),(572,'AWS','page',10,1),(573,'SSM','page',10,1),(574,'Parameter','page',10,1),(575,'Store','page',10,1),(576,'Never','page',10,1),(577,'commit','page',10,1),(578,'secrets','page',10,1),(579,'repository','page',10,1),(580,'Each','page',10,1),(581,'service','page',10,1),(582,'has','page',10,1),(583,'a','page',10,1),(584,'deploy/','page',10,1),(585,'directory','page',10,1),(586,'containing','page',10,1),(587,'its','page',10,1),(588,'Kubernetes','page',10,1),(589,'manifests','page',10,1),(590,'Helm','page',10,1),(591,'values','page',10,1),(592,'project','page',10,3),(593,'priority','page',10,3),(594,'beta','page',10,5),(595,'low','page',10,5),(596,'Production','page',11,45),(597,'Checklist','page',11,45),(598,'Deployment','page',11,5),(599,'Before','page',11,1),(600,'deploying','page',11,1),(601,'to','page',11,2),(602,'production','page',11,1),(603,'verify','page',11,1),(604,'all','page',11,1),(605,'items','page',11,1),(606,'All','page',11,1),(607,'CI','page',11,1),(608,'checks','page',11,1),(609,'pass','page',11,1),(610,'on','page',11,2),(611,'the','page',11,2),(612,'release','page',11,1),(613,'branch','page',11,1),(614,'Database','page',11,1),(615,'migrations','page',11,1),(616,'tested','page',11,1),(617,'staging','page',11,1),(618,'Feature','page',11,1),(619,'flags','page',11,1),(620,'configured','page',11,1),(621,'for','page',11,1),(622,'gradual','page',11,1),(623,'rollout','page',11,2),(624,'Rollback','page',11,5),(625,'plan','page',11,1),(626,'documented','page',11,1),(627,'On','page',11,1),(628,'call','page',11,1),(629,'On-call','page',11,1),(630,'engineer','page',11,1),(631,'notified','page',11,1),(632,'Monitoring','page',11,1),(633,'dashboards','page',11,1),(634,'reviewed','page',11,1),(635,'Load','page',11,1),(636,'test','page',11,1),(637,'results','page',11,1),(638,'within','page',11,2),(639,'acceptable','page',11,1),(640,'thresholds','page',11,1),(641,'Procedure','page',11,4),(642,'If','page',11,1),(643,'issues','page',11,1),(644,'are','page',11,1),(645,'detected','page',11,1),(646,'first','page',11,1),(647,'15','page',11,1),(648,'minutes','page',11,1),(649,'run','page',11,1),(650,'kubectl','page',11,1),(651,'undo','page',11,1),(652,'deployment/','page',11,1),(653,'service','page',11,1),(654,'revert','page',11,1),(655,'project','page',11,3),(656,'priority','page',11,3),(657,'gamma','page',11,5),(658,'high','page',11,5),(659,'Remote','page',14,45),(660,'Work','page',14,45),(661,'Policy','page',14,45),(662,'We','page',14,1),(663,'support','page',14,1),(664,'a','page',14,2),(665,'flexible','page',14,1),(666,'remote','page',14,1),(667,'first','page',14,1),(668,'remote-first','page',14,1),(669,'work','page',14,1),(670,'environment','page',14,1),(671,'This','page',14,1),(672,'policy','page',14,1),(673,'applies','page',14,1),(674,'to','page',14,2),(675,'all','page',14,1),(676,'full','page',14,1),(677,'time','page',14,1),(678,'full-time','page',14,1),(679,'employees','page',14,2),(680,'Core','page',14,4),(681,'Hours','page',14,4),(682,'All','page',14,1),(683,'team','page',14,1),(684,'members','page',14,1),(685,'must','page',14,1),(686,'be','page',14,1),(687,'available','page',14,1),(688,'during','page',14,1),(689,'core','page',14,1),(690,'hours','page',14,2),(691,'10','page',14,1),(692,'00','page',14,2),(693,'AM','page',14,1),(694,'–','page',14,1),(695,'2','page',14,1),(696,'PM','page',14,1),(697,'in','page',14,2),(698,'their','page',14,1),(699,'local','page',14,1),(700,'timezone','page',14,1),(701,'Communication','page',14,4),(702,'Default','page',14,1),(703,'Slack','page',14,1),(704,'for','page',14,4),(705,'quick','page',14,1),(706,'questionsUse','page',14,1),(707,'video','page',14,1),(708,'calls','page',14,1),(709,'discussions','page',14,1),(710,'requiring','page',14,1),(711,'back','page',14,1),(712,'and','page',14,2),(713,'forthDocument','page',14,1),(714,'back-and-forthDocument','page',14,1),(715,'decisions','page',14,1),(716,'the','page',14,1),(717,'wiki','page',14,1),(718,'within','page',14,1),(719,'24','page',14,1),(720,'Equipment','page',14,4),(721,'The','page',14,1),(722,'company','page',14,1),(723,'provides','page',14,1),(724,'$2','page',14,1),(725,'000','page',14,1),(726,'home','page',14,1),(727,'office','page',14,1),(728,'stipend','page',14,1),(729,'new','page',14,1),(730,'$500','page',14,1),(731,'annually','page',14,1),(732,'equipment','page',14,1),(733,'refreshes','page',14,1),(734,'project','page',14,3),(735,'priority','page',14,3),(736,'delta','page',14,5),(737,'medium','page',14,5),(738,'Time','page',15,49),(739,'Off','page',15,49),(740,'and','page',15,45),(741,'Leave','page',15,53),(742,'Policy','page',15,45),(743,'Paid','page',15,4),(744,'PTO','page',15,4),(745,'0–2','page',15,1),(746,'years','page',15,3),(747,'tenure','page',15,3),(748,'20','page',15,1),(749,'days/year3–5','page',15,1),(750,'25','page',15,1),(751,'days/year6+','page',15,1),(752,'30','page',15,1),(753,'days/year','page',15,1),(754,'Sick','page',15,4),(755,'Unlimited','page',15,1),(756,'sick','page',15,1),(757,'leave','page',15,2),(758,'with','page',15,1),(759,'manager','page',15,1),(760,'notification','page',15,1),(761,'For','page',15,1),(762,'absences','page',15,1),(763,'longer','page',15,1),(764,'than','page',15,1),(765,'3','page',15,1),(766,'consecutive','page',15,1),(767,'days','page',15,1),(768,'a','page',15,1),(769,'doctor','page',15,1),(770,'s','page',15,1),(771,'note','page',15,1),(772,'may','page',15,1),(773,'be','page',15,2),(774,'requested','page',15,1),(775,'Parental','page',15,4),(776,'16','page',15,1),(777,'weeks','page',15,1),(778,'fully','page',15,1),(779,'paid','page',15,1),(780,'parental','page',15,1),(781,'for','page',15,1),(782,'all','page',15,1),(783,'new','page',15,1),(784,'parents','page',15,1),(785,'regardless','page',15,1),(786,'of','page',15,1),(787,'gender','page',15,1),(788,'Must','page',15,1),(789,'taken','page',15,1),(790,'within','page',15,1),(791,'the','page',15,1),(792,'first','page',15,1),(793,'year','page',15,1),(794,'Code','page',16,45),(795,'of','page',16,45),(796,'Conduct','page',16,45),(797,'We','page',16,1),(798,'are','page',16,2),(799,'committed','page',16,1),(800,'to','page',16,3),(801,'providing','page',16,1),(802,'a','page',16,1),(803,'welcoming','page',16,1),(804,'and','page',16,4),(805,'inclusive','page',16,1),(806,'environment','page',16,1),(807,'for','page',16,1),(808,'everyone','page',16,1),(809,'Expected','page',16,4),(810,'Behavior','page',16,4),(811,'Be','page',16,1),(812,'respectful','page',16,1),(813,'considerate','page',16,1),(814,'in','page',16,1),(815,'all','page',16,1),(816,'interactionsWelcome','page',16,1),(817,'diverse','page',16,1),(818,'perspectives','page',16,1),(819,'experiencesGive','page',16,1),(820,'receive','page',16,1),(821,'constructive','page',16,1),(822,'feedback','page',16,1),(823,'gracefully','page',16,1),(824,'Reporting','page',16,4),(825,'Report','page',16,1),(826,'violations','page',16,1),(827,'your','page',16,1),(828,'manager','page',16,1),(829,'or','page',16,1),(830,'directly','page',16,1),(831,'HR','page',16,1),(832,'at','page',16,1),(833,'hr@company','page',16,1),(834,'io','page',16,1),(835,'hr@company.io','page',16,1),(836,'All','page',16,1),(837,'reports','page',16,1),(838,'handled','page',16,1),(839,'confidentially','page',16,1),(840,'Health','page',18,45),(841,'Insurance','page',18,45),(842,'Plans','page',18,45),(843,'We','page',18,1),(844,'offer','page',18,1),(845,'three','page',18,1),(846,'tiers','page',18,1),(847,'of','page',18,1),(848,'health','page',18,1),(849,'coverage','page',18,2),(850,'PlanMonthly','page',18,1),(851,'PremiumDeductibleCoverage','page',18,1),(852,'Basic$0$3','page',18,1),(853,'00080%','page',18,1),(854,'after','page',18,3),(855,'deductibleStandard$150$1','page',18,1),(856,'50090%','page',18,1),(857,'deductiblePremium$350$50095%','page',18,1),(858,'deductible','page',18,1),(859,'Dental','page',18,1),(860,'and','page',18,1),(861,'vision','page',18,1),(862,'is','page',18,1),(863,'included','page',18,1),(864,'with','page',18,1),(865,'all','page',18,1),(866,'plans','page',18,1),(867,'Dependents','page',18,1),(868,'can','page',18,1),(869,'be','page',18,1),(870,'added','page',18,1),(871,'during','page',18,1),(872,'open','page',18,1),(873,'enrollment','page',18,1),(874,'November','page',18,1),(875,'Stock','page',19,45),(876,'Option','page',19,45),(877,'Plan','page',19,45),(878,'All','page',19,1),(879,'full','page',19,1),(880,'time','page',19,1),(881,'full-time','page',19,1),(882,'employees','page',19,1),(883,'are','page',19,1),(884,'eligible','page',19,1),(885,'for','page',19,1),(886,'stock','page',19,1),(887,'options','page',19,2),(888,'as','page',19,1),(889,'part','page',19,1),(890,'of','page',19,1),(891,'their','page',19,1),(892,'compensation','page',19,1),(893,'package','page',19,1),(894,'Vesting','page',19,4),(895,'Schedule','page',19,4),(896,'Options','page',19,1),(897,'vest','page',19,1),(898,'over','page',19,1),(899,'4','page',19,1),(900,'years','page',19,1),(901,'with','page',19,1),(902,'a','page',19,1),(903,'1','page',19,2),(904,'year','page',19,1),(905,'1-year','page',19,1),(906,'cliff','page',19,2),(907,'Year','page',19,1),(908,'25%','page',19,1),(909,'vests','page',19,2),(910,'at','page',19,1),(911,'the','page',19,1),(912,'dateYears','page',19,1),(913,'2–4','page',19,1),(914,'Remaining','page',19,1),(915,'75%','page',19,1),(916,'monthly','page',19,1),(917,'Exercise','page',19,4),(918,'Window','page',19,4),(919,'Upon','page',19,1),(920,'departure','page',19,1),(921,'vested','page',19,1),(922,'must','page',19,1),(923,'be','page',19,1),(924,'exercised','page',19,1),(925,'within','page',19,1),(926,'90','page',19,1),(927,'days','page',19,1),(928,'API','page',22,46),(929,'Gateway','page',22,45),(930,'Migration','page',22,45),(931,'We','page',22,1),(932,'are','page',22,1),(933,'migrating','page',22,1),(934,'from','page',22,1),(935,'Kong','page',22,2),(936,'to','page',22,2),(937,'a','page',22,1),(938,'custom','page',22,1),(939,'Go','page',22,1),(940,'based','page',22,1),(941,'Go-based','page',22,1),(942,'gateway','page',22,1),(943,'reduce','page',22,1),(944,'operational','page',22,1),(945,'costs','page',22,1),(946,'and','page',22,3),(947,'improve','page',22,1),(948,'latency','page',22,2),(949,'Timeline','page',22,4),(950,'Week','page',22,1),(951,'1–2','page',22,1),(952,'Core','page',22,1),(953,'routing','page',22,1),(954,'middlewareWeek','page',22,1),(955,'3–4','page',22,1),(956,'Circuit','page',22,1),(957,'breaker','page',22,1),(958,'retry','page',22,1),(959,'logicWeek','page',22,1),(960,'5–6','page',22,1),(961,'Shadow','page',22,1),(962,'traffic','page',22,2),(963,'comparison','page',22,1),(964,'with','page',22,3),(965,'KongWeek','page',22,1),(966,'7–8','page',22,1),(967,'Gradual','page',22,1),(968,'cutover','page',22,1),(969,'Success','page',22,4),(970,'Criteria','page',22,4),(971,'p99','page',22,1),(972,'under','page',22,1),(973,'15ms','page',22,1),(974,'currently','page',22,1),(975,'45ms','page',22,1),(976,'Zero','page',22,1),(977,'downtime','page',22,1),(978,'during','page',22,1),(979,'migrationFull','page',22,1),(980,'feature','page',22,1),(981,'parity','page',22,1),(982,'existing','page',22,1),(983,'setup','page',22,1),(984,'Performance','page',23,45),(985,'Benchmarks','page',23,46),(986,'Baseline','page',23,1),(987,'performance','page',23,1),(988,'targets','page',23,1),(989,'for','page',23,1),(990,'Q1','page',23,1),(991,'2026','page',23,1),(992,'MetricCurrentTarget','page',23,1),(993,'API','page',23,1),(994,'p50','page',23,1),(995,'latency12ms8msAPI','page',23,1),(996,'p99','page',23,1),(997,'latency85ms50msThroughput','page',23,1),(998,'rps','page',23,1),(999,'12','page',23,1),(1000,'00020','page',23,1),(1001,'000Error','page',23,1),(1002,'rate0','page',23,1),(1003,'3%','page',23,1),(1004,'rate0.3%','page',23,1),(1005,'1%','page',23,1),(1006,'0.1%','page',23,1),(1007,'are','page',23,1),(1008,'run','page',23,1),(1009,'nightly','page',23,1),(1010,'against','page',23,1),(1011,'a','page',23,1),(1012,'staging','page',23,1),(1013,'environment','page',23,1),(1014,'using','page',23,1),(1015,'k6','page',23,1),(1016,'with','page',23,1),(1017,'200','page',23,1),(1018,'virtual','page',23,1),(1019,'users','page',23,1),(1020,'over','page',23,1),(1021,'10','page',23,1),(1022,'minutes','page',23,1),(1023,'Multi','page',25,45),(1024,'Tenant','page',25,45),(1025,'Multi-Tenant','page',25,45),(1026,'Architecture','page',25,45),(1027,'Phase','page',25,1),(1028,'2','page',25,1),(1029,'introduces','page',25,1),(1030,'true','page',25,1),(1031,'multi','page',25,1),(1032,'tenancy','page',25,1),(1033,'multi-tenancy','page',25,1),(1034,'to','page',25,2),(1035,'support','page',25,1),(1036,'enterprise','page',25,1),(1037,'customers','page',25,1),(1038,'Data','page',25,4),(1039,'Isolation','page',25,4),(1040,'We','page',25,1),(1041,'use','page',25,1),(1042,'a','page',25,3),(1043,'schema','page',25,2),(1044,'per','page',25,4),(1045,'tenant','page',25,6),(1046,'schema-per-tenant','page',25,1),(1047,'model','page',25,1),(1048,'in','page',25,1),(1049,'PostgreSQL','page',25,1),(1050,'Each','page',25,1),(1051,'gets','page',25,1),(1052,'dedicated','page',25,1),(1053,'Routing','page',25,4),(1054,'Tenants','page',25,1),(1055,'are','page',25,1),(1056,'identified','page',25,1),(1057,'by','page',25,1),(1058,'subdomain','page',25,1),(1059,'app','page',25,1),(1060,'company','page',25,1),(1061,'io','page',25,1),(1062,'.app.company.io','page',25,1),(1063,'The','page',25,1),(1064,'API','page',25,2),(1065,'gateway','page',25,1),(1066,'extracts','page',25,1),(1067,'the','page',25,1),(1068,'ID','page',25,1),(1069,'and','page',25,1),(1070,'injects','page',25,1),(1071,'it','page',25,1),(1072,'as','page',25,1),(1073,'header','page',25,1),(1074,'Limits','page',25,4),(1075,'Max','page',25,1),(1076,'10','page',25,1),(1077,'000','page',25,2),(1078,'users','page',25,1),(1079,'tenant50','page',25,1),(1080,'GB','page',25,1),(1081,'storage','page',25,1),(1082,'soft','page',25,1),(1083,'limit','page',25,1),(1084,'Rate','page',25,1),(1085,'limited','page',25,1),(1086,'1','page',25,1),(1087,'calls/minute','page',25,1),(1088,'Analytics','page',26,45),(1089,'Dashboard','page',26,45),(1090,'v2','page',26,45),(1091,'The','page',26,1),(1092,'next','page',26,1),(1093,'iteration','page',26,1),(1094,'of','page',26,1),(1095,'the','page',26,2),(1096,'analytics','page',26,2),(1097,'dashboard','page',26,1),(1098,'focuses','page',26,1),(1099,'on','page',26,1),(1100,'real','page',26,1),(1101,'time','page',26,2),(1102,'real-time','page',26,1),(1103,'insights','page',26,1),(1104,'and','page',26,3),(1105,'self','page',26,1),(1106,'service','page',26,2),(1107,'self-service','page',26,1),(1108,'reporting','page',26,1),(1109,'Key','page',26,4),(1110,'Features','page',26,4),(1111,'Real','page',26,1),(1112,'Real-time','page',26,1),(1113,'event','page',26,1),(1114,'streaming','page',26,1),(1115,'via','page',26,2),(1116,'WebSocketsCustom','page',26,1),(1117,'report','page',26,2),(1118,'builder','page',26,1),(1119,'with','page',26,1),(1120,'drag','page',26,1),(1121,'drop','page',26,1),(1122,'drag-and-drop','page',26,1),(1123,'interfaceScheduled','page',26,1),(1124,'delivery','page',26,1),(1125,'emailData','page',26,1),(1126,'export','page',26,1),(1127,'to','page',26,1),(1128,'CSV','page',26,1),(1129,'Parquet','page',26,1),(1130,'formats','page',26,1),(1131,'Tech','page',26,4),(1132,'Stack','page',26,4),(1133,'Frontend','page',26,1),(1134,'React','page',26,1),(1135,'+','page',26,1),(1136,'D3','page',26,1),(1137,'js','page',26,1),(1138,'D3.js','page',26,1),(1139,'Backend','page',26,1),(1140,'Clickhouse','page',26,1),(1141,'for','page',26,3),(1142,'queries','page',26,1),(1143,'Redis','page',26,1),(1144,'caching','page',26,1),(1145,'aggregations','page',26,1),(1146,'Go','page',26,1),(1147,'API','page',26,1),(1148,'layer','page',26,1),(1149,'Incident','page',29,45),(1150,'Severity','page',29,45),(1151,'Classification','page',29,45),(1152,'SeverityDescriptionResponse','page',29,1),(1153,'TimeExample','page',29,1),(1154,'SEV','page',29,3),(1155,'1Complete','page',29,1),(1156,'SEV-1Complete','page',29,1),(1157,'outage','page',29,1),(1158,'or','page',29,2),(1159,'data','page',29,1),(1160,'loss15','page',29,1),(1161,'minutesDatabase','page',29,1),(1162,'corruption','page',29,1),(1163,'auth','page',29,1),(1164,'service','page',29,1),(1165,'downSEV','page',29,1),(1166,'2Major','page',29,1),(1167,'downSEV-2Major','page',29,1),(1168,'feature','page',29,2),(1169,'degraded1','page',29,1),(1170,'hourPayment','page',29,1),(1171,'processing','page',29,1),(1172,'failingSEV','page',29,1),(1173,'3Minor','page',29,1),(1174,'failingSEV-3Minor','page',29,1),(1175,'issue4','page',29,1),(1176,'hoursDashboard','page',29,1),(1177,'widget','page',29,1),(1178,'not','page',29,1),(1179,'loadingSEV','page',29,1),(1180,'4Cosmetic','page',29,1),(1181,'loadingSEV-4Cosmetic','page',29,1),(1182,'low','page',29,1),(1183,'impactNext','page',29,1),(1184,'low-impactNext','page',29,1),(1185,'business','page',29,1),(1186,'dayTypo','page',29,1),(1187,'in','page',29,1),(1188,'UI','page',29,1),(1189,'Escalation','page',29,4),(1190,'1','page',29,1),(1191,'SEV-1','page',29,1),(1192,'and','page',29,2),(1193,'2','page',29,1),(1194,'SEV-2','page',29,1),(1195,'incidents','page',29,1),(1196,'automatically','page',29,1),(1197,'page','page',29,1),(1198,'the','page',29,2),(1199,'on','page',29,1),(1200,'call','page',29,1),(1201,'on-call','page',29,1),(1202,'engineer','page',29,1),(1203,'notify','page',29,1),(1204,'engineering','page',29,1),(1205,'manager','page',29,1),(1206,'Data','page',30,45),(1207,'Breach','page',30,45),(1208,'Response','page',30,45),(1209,'Plan','page',30,45),(1210,'Immediate','page',30,4),(1211,'Actions','page',30,4),(1212,'First','page',30,4),(1213,'30','page',30,4),(1214,'Minutes','page',30,4),(1215,'Confirm','page',30,1),(1216,'the','page',30,2),(1217,'breach','page',30,1),(1218,'and','page',30,2),(1219,'assess','page',30,1),(1220,'scopeIsolate','page',30,1),(1221,'affected','page',30,2),(1222,'systems','page',30,1),(1223,'revoke','page',30,1),(1224,'compromised','page',30,1),(1225,'credentials','page',30,1),(1226,'block','page',30,1),(1227,'IPs','page',30,1),(1228,'Notify','page',30,1),(1229,'incident','page',30,1),(1230,'commander','page',30,1),(1231,'security','page',30,1),(1232,'team','page',30,1),(1233,'leadBegin','page',30,1),(1234,'evidence','page',30,1),(1235,'preservation','page',30,1),(1236,'—','page',30,1),(1237,'do','page',30,1),(1238,'not','page',30,1),(1239,'modify','page',30,1),(1240,'or','page',30,1),(1241,'delete','page',30,1),(1242,'logs','page',30,1),(1243,'Notification','page',30,4),(1244,'Requirements','page',30,4),(1245,'Under','page',30,1),(1246,'GDPR','page',30,1),(1247,'EU','page',30,1),(1248,'users','page',30,1),(1249,'must','page',30,3),(1250,'be','page',30,2),(1251,'notified','page',30,2),(1252,'within','page',30,1),(1253,'72','page',30,1),(1254,'hours','page',30,1),(1255,'California','page',30,1),(1256,'residents','page',30,1),(1257,'under','page',30,1),(1258,'CCPA','page',30,1),(1259,'Legal','page',30,1),(1260,'counsel','page',30,1),(1261,'approve','page',30,1),(1262,'all','page',30,1),(1263,'communications','page',30,1),(1264,'before','page',30,1),(1265,'sending','page',30,1),(1266,'Credential','page',31,46),(1267,'Rotation','page',31,49),(1268,'Procedures','page',31,45),(1269,'All','page',31,1),(1270,'production','page',31,1),(1271,'credentials','page',31,1),(1272,'must','page',31,1),(1273,'be','page',31,1),(1274,'rotated','page',31,1),(1275,'according','page',31,1),(1276,'to','page',31,1),(1277,'this','page',31,2),(1278,'schedule','page',31,1),(1279,'TypeRotation','page',31,1),(1280,'FrequencyOwner','page',31,1),(1281,'Database','page',31,1),(1282,'passwordsEvery','page',31,1),(1283,'90','page',31,2),(1284,'daysPlatform','page',31,2),(1285,'teamAPI','page',31,1),(1286,'keys','page',31,1),(1287,'internal','page',31,1),(1288,'Every','page',31,1),(1289,'daysService','page',31,1),(1290,'ownerTLS','page',31,1),(1291,'certificatesEvery','page',31,1),(1292,'365','page',31,1),(1293,'teamSSH','page',31,1),(1294,'keysEvery','page',31,1),(1295,'180','page',31,1),(1296,'daysIndividual','page',31,1),(1297,'Process','page',31,4),(1298,'Generate','page',31,1),(1299,'the','page',31,6),(1300,'new','page',31,3),(1301,'credential','page',31,2),(1302,'in','page',31,2),(1303,'AWS','page',31,1),(1304,'SSM','page',31,1),(1305,'Parameter','page',31,1),(1306,'StoreDeploy','page',31,1),(1307,'application','page',31,1),(1308,'with','page',31,2),(1309,'dual','page',31,1),(1310,'read','page',31,1),(1311,'dual-read','page',31,1),(1312,'period','page',31,1),(1313,'Verify','page',31,1),(1314,'functionality','page',31,1),(1315,'credentialRevoke','page',31,1),(1316,'old','page',31,1),(1317,'credentialUpdate','page',31,1),(1318,'rotation','page',31,1),(1319,'log','page',31,1),(1320,'wiki','page',31,1),(1321,'SOC','page',33,46),(1322,'2','page',33,49),(1323,'Controls','page',33,45),(1324,'Mapping','page',33,45),(1325,'This','page',33,1),(1326,'document','page',33,1),(1327,'maps','page',33,1),(1328,'our','page',33,1),(1329,'internal','page',33,1),(1330,'controls','page',33,2),(1331,'to','page',33,1),(1332,'Trust','page',33,1),(1333,'Services','page',33,1),(1334,'Criteria','page',33,5),(1335,'Security','page',33,4),(1336,'Common','page',33,4),(1337,'CC6','page',33,1),(1338,'1','page',33,2),(1339,'CC6.1','page',33,1),(1340,'Logical','page',33,1),(1341,'access','page',33,3),(1342,'—','page',33,5),(1343,'enforced','page',33,1),(1344,'via','page',33,2),(1345,'RBAC','page',33,1),(1346,'with','page',33,1),(1347,'SSO','page',33,1),(1348,'Okta','page',33,1),(1349,'and','page',33,1),(1350,'MFACC6','page',33,1),(1351,'MFACC6.2','page',33,1),(1352,'System','page',33,1),(1353,'restrictions','page',33,1),(1354,'least','page',33,1),(1355,'privilege','page',33,1),(1356,'reviews','page',33,1),(1357,'quarterlyCC6','page',33,1),(1358,'3','page',33,2),(1359,'quarterlyCC6.3','page',33,1),(1360,'Encryption','page',33,1),(1361,'TLS','page',33,1),(1362,'1.3','page',33,1),(1363,'in','page',33,1),(1364,'transit','page',33,1),(1365,'AES','page',33,1),(1366,'256','page',33,1),(1367,'AES-256','page',33,1),(1368,'at','page',33,1),(1369,'restCC7','page',33,1),(1370,'restCC7.2','page',33,1),(1371,'Monitoring','page',33,1),(1372,'Datadog','page',33,1),(1373,'APM','page',33,1),(1374,'CloudTrail','page',33,1),(1375,'centralized','page',33,1),(1376,'logging','page',33,1),(1377,'ELK','page',33,1),(1378,'Availability','page',33,4),(1379,'A1','page',33,1),(1380,'A1.2','page',33,1),(1381,'99','page',33,1),(1382,'95%','page',33,1),(1383,'99.95%','page',33,1),(1384,'uptime','page',33,1),(1385,'SLA','page',33,1),(1386,'multi','page',33,1),(1387,'AZ','page',33,1),(1388,'multi-AZ','page',33,1),(1389,'deployment','page',33,1),(1390,'automated','page',33,1),(1391,'failover','page',33,1),(1392,'Monitoring','page',36,45),(1393,'with','page',36,45),(1394,'Grafana','page',36,46),(1395,'Our','page',36,1),(1396,'primary','page',36,1),(1397,'monitoring','page',36,2),(1398,'stack','page',36,1),(1399,'is','page',36,1),(1400,'Prometheus','page',36,1),(1401,'+','page',36,1),(1402,'deployed','page',36,1),(1403,'in','page',36,1),(1404,'the','page',36,1),(1405,'namespace','page',36,1),(1406,'Dashboards','page',36,4),(1407,'Service','page',36,1),(1408,'Overview','page',36,1),(1409,'Request','page',36,1),(1410,'rate','page',36,2),(1411,'error','page',36,1),(1412,'and','page',36,3),(1413,'latency','page',36,1),(1414,'per','page',36,1),(1415,'serviceInfrastructure','page',36,1),(1416,'CPU','page',36,1),(1417,'memory','page',36,1),(1418,'disk','page',36,1),(1419,'network','page',36,1),(1420,'across','page',36,1),(1421,'all','page',36,1),(1422,'nodesBusiness','page',36,1),(1423,'Metrics','page',36,1),(1424,'Signups','page',36,1),(1425,'active','page',36,1),(1426,'users','page',36,1),(1427,'revenue','page',36,1),(1428,'updated','page',36,1),(1429,'hourly','page',36,1),(1430,'Alerting','page',36,4),(1431,'Alerts','page',36,1),(1432,'are','page',36,1),(1433,'routed','page',36,1),(1434,'through','page',36,1),(1435,'PagerDuty','page',36,1),(1436,'Critical','page',36,1),(1437,'alerts','page',36,2),(1438,'trigger','page',36,1),(1439,'phone','page',36,1),(1440,'calls','page',36,1),(1441,'warning','page',36,1),(1442,'go','page',36,1),(1443,'to','page',36,1),(1444,'Slack','page',36,1),(1445,'#alerts','page',36,1),(1446,'Slack','page',37,45),(1447,'Channel','page',37,45),(1448,'Directory','page',37,45),(1449,'ChannelPurposeWho','page',37,1),(1450,'Should','page',37,1),(1451,'Join','page',37,1),(1452,'#engineeringGeneral','page',37,1),(1453,'engineering','page',37,2),(1454,'discussionAll','page',37,2),(1455,'engineers#incidentsActive','page',37,1),(1456,'incident','page',37,1),(1457,'coordinationOn','page',37,1),(1458,'call','page',37,1),(1459,'coordinationOn-call','page',37,1),(1460,'leads#deploysDeployment','page',37,1),(1461,'notifications','page',37,2),(1462,'bot','page',37,1),(1463,'All','page',37,1),(1464,'engineers#code','page',37,1),(1465,'reviewPR','page',37,1),(1466,'engineers#code-reviewPR','page',37,1),(1467,'and','page',37,2),(1468,'engineers#randomNon','page',37,1),(1469,'work','page',37,1),(1470,'engineers#randomNon-work','page',37,1),(1471,'chatEveryone#productProduct','page',37,1),(1472,'roadmap','page',37,1),(1473,'discussionProduct','page',37,1),(1474,'leads#securitySecurity','page',37,1),(1475,'alerts','page',37,1),(1476,'discussionSecurity','page',37,1),(1477,'team','page',37,1),(1478,'leads','page',37,1),(1479,'Sprint','page',39,45),(1480,'Retrospective','page',39,45),(1481,'—','page',39,46),(1482,'2026','page',39,46),(1483,'W18','page',39,45),(1484,'2026-W18','page',39,45),(1485,'Date','page',39,1),(1486,'May','page',39,1),(1487,'2','page',39,2),(1488,'|','page',39,1),(1489,'Facilitator','page',39,1),(1490,'James','page',39,1),(1491,'Miller','page',39,1),(1492,'What','page',39,8),(1493,'Went','page',39,4),(1494,'Well','page',39,4),(1495,'API','page',39,1),(1496,'gateway','page',39,1),(1497,'migration','page',39,1),(1498,'completed','page',39,1),(1499,'ahead','page',39,1),(1500,'of','page',39,2),(1501,'scheduleZero','page',39,1),(1502,'downtime','page',39,1),(1503,'scheduleZero-downtime','page',39,1),(1504,'deployment','page',39,1),(1505,'for','page',39,1),(1506,'billing','page',39,1),(1507,'service','page',39,3),(1508,'v3New','page',39,1),(1509,'monitoring','page',39,1),(1510,'dashboards','page',39,1),(1511,'caught','page',39,1),(1512,'a','page',39,2),(1513,'memory','page',39,1),(1514,'leak','page',39,1),(1515,'early','page',39,1),(1516,'Could','page',39,4),(1517,'Be','page',39,4),(1518,'Improved','page',39,4),(1519,'Flaky','page',39,1),(1520,'integration','page',39,2),(1521,'tests','page',39,2),(1522,'blocked','page',39,1),(1523,'deploys','page',39,1),(1524,'3','page',39,1),(1525,'times','page',39,1),(1526,'this','page',39,1),(1527,'sprintCross','page',39,1),(1528,'team','page',39,1),(1529,'sprintCross-team','page',39,1),(1530,'dependency','page',39,1),(1531,'on','page',39,1),(1532,'auth','page',39,1),(1533,'auth-service','page',39,1),(1534,'slowed','page',39,1),(1535,'user','page',39,1),(1536,'user-service','page',39,1),(1537,'workSprint','page',39,1),(1538,'planning','page',39,1),(1539,'overcommitted','page',39,1),(1540,'we','page',39,1),(1541,'carried','page',39,1),(1542,'over','page',39,1),(1543,'stories','page',39,1),(1544,'Action','page',39,4),(1545,'Items','page',39,4),(1546,'Sarah','page',39,1),(1547,'investigate','page',39,1),(1548,'and','page',39,1),(1549,'fix','page',39,1),(1550,'top','page',39,1),(1551,'5','page',39,1),(1552,'flaky','page',39,1),(1553,'by','page',39,3),(1554,'end','page',39,1),(1555,'W19James','page',39,1),(1556,'set','page',39,1),(1557,'up','page',39,1),(1558,'shared','page',39,1),(1559,'test','page',39,1),(1560,'environment','page',39,1),(1561,'W20Team','page',39,1),(1562,'reduce','page',39,1),(1563,'sprint','page',39,2),(1564,'scope','page',39,1),(1565,'15%','page',39,1),(1566,'next','page',39,1),(1567,'as','page',39,1),(1568,'an','page',39,1),(1569,'experiment','page',39,1),(1570,'Architecture','page',40,45),(1571,'Review','page',40,45),(1572,'—','page',40,46),(1573,'May','page',40,46),(1574,'2026','page',40,46),(1575,'Date','page',40,1),(1576,'9','page',40,1),(1577,'|','page',40,1),(1578,'Attendees','page',40,1),(1579,'Sarah','page',40,1),(1580,'Chen','page',40,1),(1581,'James','page',40,1),(1582,'Miller','page',40,1),(1583,'Admin','page',40,1),(1584,'Topic','page',40,4),(1585,'Event','page',40,4),(1586,'Sourcing','page',40,4),(1587,'for','page',40,5),(1588,'Audit','page',40,4),(1589,'Trail','page',40,4),(1590,'We','page',40,2),(1591,'evaluated','page',40,1),(1592,'replacing','page',40,1),(1593,'the','page',40,2),(1594,'current','page',40,1),(1595,'audit','page',40,3),(1596,'log','page',40,2),(1597,'with','page',40,1),(1598,'an','page',40,1),(1599,'event','page',40,2),(1600,'sourced','page',40,1),(1601,'event-sourced','page',40,1),(1602,'architecture','page',40,1),(1603,'using','page',40,1),(1604,'Kafka','page',40,2),(1605,'Pros','page',40,4),(1606,'Complete','page',40,1),(1607,'reconstruction','page',40,1),(1608,'of','page',40,1),(1609,'entity','page',40,1),(1610,'state','page',40,1),(1611,'at','page',40,1),(1612,'any','page',40,1),(1613,'point','page',40,1),(1614,'in','page',40,2),(1615,'timeDecoupled','page',40,1),(1616,'consumers','page',40,1),(1617,'analytics','page',40,1),(1618,'compliance','page',40,2),(1619,'and','page',40,1),(1620,'debugging','page',40,1),(1621,'Cons','page',40,4),(1622,'Significant','page',40,1),(1623,'complexity','page',40,1),(1624,'increase','page',40,1),(1625,'schema','page',40,1),(1626,'registry','page',40,1),(1627,'versioning','page',40,1),(1628,'operational','page',40,1),(1629,'overhead','page',40,1),(1630,'3','page',40,1),(1631,'node','page',40,1),(1632,'3-node','page',40,1),(1633,'minimum','page',40,1),(1634,'partition','page',40,1),(1635,'managementCurrent','page',40,1),(1636,'meets','page',40,1),(1637,'requirements','page',40,1),(1638,'as','page',40,1),(1639,'is','page',40,2),(1640,'as-is','page',40,1),(1641,'Decision','page',40,4),(1642,'Not','page',40,1),(1643,'now','page',40,2),(1644,'will','page',40,2),(1645,'revisit','page',40,1),(1646,'Q4','page',40,1),(1647,'when','page',40,1),(1648,'multi','page',40,1),(1649,'tenancy','page',40,1),(1650,'multi-tenancy','page',40,1),(1651,'stable','page',40,1),(1652,'For','page',40,1),(1653,'we','page',40,1),(1654,'add','page',40,1),(1655,'a','page',40,1),(1656,'payload','page',40,1),(1657,'JSONB','page',40,1),(1658,'column','page',40,1),(1659,'to','page',40,1),(1660,'existing','page',40,1),(1661,'table','page',40,1);
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `setting_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('instance-id','787102ae-eed7-4b02-ac2f-321d2cbcc7d4','2026-05-13 10:07:09','2026-05-13 10:07:09','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slug_history`
--

DROP TABLE IF EXISTS `slug_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slug_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sluggable_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sluggable_id` bigint unsigned NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug_history_sluggable_type_index` (`sluggable_type`),
  KEY `slug_history_sluggable_id_index` (`sluggable_id`),
  KEY `slug_history_slug_index` (`slug`),
  KEY `slug_history_parent_slug_index` (`parent_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slug_history`
--

LOCK TABLES `slug_history` WRITE;
/*!40000 ALTER TABLE `slug_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `slug_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_index` (`user_id`),
  KEY `social_accounts_driver_index` (`driver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sort_rules`
--

DROP TABLE IF EXISTS `sort_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sort_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_rules`
--

LOCK TABLES `sort_rules` WRITE;
/*!40000 ALTER TABLE `sort_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sort_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint unsigned NOT NULL,
  `entity_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_name_index` (`name`),
  KEY `tags_value_index` (`value`),
  KEY `tags_order_index` (`order`),
  KEY `tags_entity_id_entity_type_index` (`entity_id`,`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,1,'book','department','engineering',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(2,1,'book','status','active',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(3,12,'book','department','human-resources',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(4,12,'book','confidentiality','internal',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(5,20,'book','department','product',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(6,20,'book','year','2026',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(7,27,'book','department','security',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(8,27,'book','confidentiality','restricted',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(9,27,'book','compliance','soc2',2,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(10,34,'book','type','wiki',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(11,34,'book','status','active',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(12,3,'page','project','alpha',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(13,3,'page','priority','high',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(14,4,'page','project','beta',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(15,4,'page','priority','medium',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(16,5,'page','project','gamma',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(17,5,'page','priority','low',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(18,7,'page','project','delta',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(19,7,'page','priority','high',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(20,8,'page','project','alpha',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(21,8,'page','priority','medium',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(22,10,'page','project','beta',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(23,10,'page','priority','low',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(24,11,'page','project','gamma',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(25,11,'page','priority','high',1,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(26,14,'page','project','delta',0,'2026-05-13 10:07:16','2026-05-13 10:07:16'),(27,14,'page','priority','medium',1,'2026-05-13 10:07:16','2026-05-13 10:07:16');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_invites_user_id_index` (`user_id`),
  KEY `user_invites_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `image_id` int NOT NULL DEFAULT '0',
  `external_auth_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  KEY `users_external_auth_id_index` (`external_auth_id`),
  KEY `users_system_name_index` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com','$2y$12$L1QTODSkiFa9eI9JDg8Sf.qT/AIfpD6r8ae51iqvIZb448zvINy/y',NULL,NULL,'2026-05-13 10:07:04','2026-05-13 10:07:15',1,0,'',NULL,'admin'),(2,'Guest','guest@example.com','',NULL,NULL,'2026-05-13 10:07:06','2026-05-13 10:07:06',1,0,'','public','guest'),(3,'Sarah Chen','sarah.chen@company.io','$2y$12$T6VQgxR/8JIggpI2OfM3FuUGkGaxGaJjbg70EEvk2otGZoroMA4qu',NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',1,0,'',NULL,'sarah-chen'),(4,'James Miller','james.miller@company.io','$2y$12$OoZ.XNcmwqZbueVtcdxEfeg36ngjFGryNYOTfaZKZEp.Tt8FO2waO',NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',1,0,'',NULL,'james-miller'),(5,'Priya Sharma','priya.sharma@company.io','$2y$12$RyWVK4vI2gwlQC0C6f7TG.jbNkoLWQl8DmRCqGeQpzAFj8b1BowS2',NULL,NULL,'2026-05-13 10:07:15','2026-05-13 10:07:15',1,0,'',NULL,'priya-sharma');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `viewable_id` bigint unsigned NOT NULL,
  `viewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_user_id_index` (`user_id`),
  KEY `views_viewable_id_index` (`viewable_id`),
  KEY `views_updated_at_index` (`updated_at`),
  KEY `views_viewable_type_index` (`viewable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `watchable_id` bigint unsigned NOT NULL,
  `watchable_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchable_index` (`watchable_id`,`watchable_type`),
  KEY `watches_user_id_index` (`user_id`),
  KEY `watches_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_tracked_events`
--

DROP TABLE IF EXISTS `webhook_tracked_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_tracked_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int NOT NULL,
  `event` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_tracked_events_event_index` (`event`),
  KEY `webhook_tracked_events_webhook_id_index` (`webhook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_tracked_events`
--

LOCK TABLES `webhook_tracked_events` WRITE;
/*!40000 ALTER TABLE `webhook_tracked_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_tracked_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `endpoint` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `timeout` int unsigned NOT NULL DEFAULT '3',
  `last_error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_called_at` timestamp NULL DEFAULT NULL,
  `last_errored_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhooks_name_index` (`name`),
  KEY `webhooks_active_index` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bookstack'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13 10:07:16

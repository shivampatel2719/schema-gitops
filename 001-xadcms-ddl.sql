-- MySQL dump 10.13  Distrib 5.6.40, for macos10.13 (x86_64)
--
-- Host: app.db.xad.com    Database: xadcms
-- ------------------------------------------------------
-- Server version	5.7.22-22-57-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `xadcms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `xadcms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xadcms`;

--
-- Table structure for table `3rdpartyvendorcategory`
--

DROP TABLE IF EXISTS `3rdpartyvendorcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `3rdpartyvendorcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryName` text NOT NULL,
  `vendorName` varchar(20) DEFAULT NULL,
  `sicCode` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11402 DEFAULT CHARSET=utf8 COMMENT='3rd party vendor categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `primaryCategory_id` bigint(20) DEFAULT NULL,
  `secondaryCategory_id` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `acType` tinyint(4) DEFAULT NULL,
  `market` int(11) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `campaignCreationType` tinyint(4) NOT NULL DEFAULT '0',
  `vendorName` varchar(128) DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `distanceUnit` varchar(10) DEFAULT NULL,
  `adomain` varchar(512) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `dmp_partner_id` int(11) DEFAULT NULL,
  `app_used` varchar(10) NOT NULL DEFAULT 'XCv2',
  `lifetimeBudgetCap` double DEFAULT NULL,
  `vertical_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Account_primaryCategory_new` (`primaryCategory_id`),
  KEY `fk_Account_secondaryCategory_new` (`secondaryCategory_id`),
  KEY `fk_Account_Company_new` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87395 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_verticals`
--

DROP TABLE IF EXISTS `account_verticals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_verticals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accountbillingsource`
--

DROP TABLE IF EXISTS `accountbillingsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountbillingsource` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `billingSource_id` bigint(20) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  `username` varchar(64) DEFAULT '',
  `password` varchar(256) DEFAULT NULL,
  `sourceAccountId` varchar(256) DEFAULT NULL,
  `sourceAccountName` varchar(256) DEFAULT NULL,
  `generatedReportId` varchar(256) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `account_id_new` (`account_id`),
  KEY `billingSource_id_new` (`billingSource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accountsegmentfiles`
--

DROP TABLE IF EXISTS `accountsegmentfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountsegmentfiles` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `segmentFile_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `account_id_new` (`account_id`),
  KEY `segmentFile_id_new` (`segmentFile_id`),
  CONSTRAINT `uc_tenant_segment_account` UNIQUE (`tenant_id`, `segmentFile_id`, `account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=564875 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accountstatusstats`
--

DROP TABLE IF EXISTS `accountstatusstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountstatusstats` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `del` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_AccountStatusStats_Account1_new` (`account_id`),
  KEY `fk_AccountStatusStats_Company1_new` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT '0',
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adgroup`
--

DROP TABLE IF EXISTS `adgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adgroup` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) NOT NULL,
  `cts_id` bigint(20) DEFAULT NULL,
  `mobileSite_id` bigint(20) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `vendorIdentifier` varchar(128) DEFAULT NULL,
  `adGroupType` tinyint(4) DEFAULT NULL,
  `is_CPV` tinyint(1) DEFAULT '0',
  `bidRates` varchar(256) DEFAULT NULL,
  `gross_bid_rate` float DEFAULT NULL,
  `rotation` tinyint(4) DEFAULT NULL,
  `isUrlAdType` tinyint(4) DEFAULT NULL,
  `notes` varchar(600) DEFAULT NULL,
  `locationType` tinyint(4) DEFAULT NULL,
  `daypartingType` tinyint(4) DEFAULT NULL,
  `ctnOption` tinyint(4) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `enableSpring` tinyint(4) DEFAULT '1',
  `enableRetargeting` tinyint(4) DEFAULT NULL,
  `enableFreqCapping` tinyint(4) DEFAULT '0',
  `restrictMSLocation` tinyint(11) DEFAULT '0',
  `del` tinyint(4) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `svlVendors` varchar(128) DEFAULT NULL,
  `activeCreativeCount` int(11) DEFAULT '0',
  `publisherSettingsCount` int(11) DEFAULT '0',
  `targetLocationsCount` int(11) DEFAULT '0',
  `bizAllRadius` double DEFAULT NULL,
  `buildSegmentIntoId` bigint(20) DEFAULT NULL,
  `enableBlacklist` bit(1) DEFAULT b'1',
  `interstitial` bit(1) DEFAULT b'0',
  `size` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `videoLinearity` varchar(45) DEFAULT '1',
  `enableFootprintsTargeting` tinyint(4) DEFAULT '0',
  `deliveryChannel_id` bigint(4) DEFAULT '0',
  `allowedReconcileDiscrepancy` double NOT NULL DEFAULT '0.05',
  `bypassQps` bit(1) DEFAULT b'0',
  `buildSegment` bit(1) DEFAULT b'0',
  `ctr_threshold` float DEFAULT NULL,
  `enable_kpi_blacklist` bit(1) DEFAULT b'0',
  `proximity_mode` varchar(16) DEFAULT NULL,
  `client_placement_name` varchar(500) DEFAULT NULL,
  `enableLocationAudienceTargeting` tinyint(4) NOT NULL DEFAULT '0',
  `enableStoreVisitation` tinyint(4) NOT NULL DEFAULT '0',
  `adaptive_publisher_bidding` tinyint(1) NOT NULL DEFAULT '1',
  `adPackage_id` bigint(20) DEFAULT NULL,
  `is_secure` tinyint(1) DEFAULT '0',
  `billability_type` tinyint(4) DEFAULT '0',
  `product_id` tinyint(4) DEFAULT '0',
  `product_config` longtext,
  `svl_holdback` float DEFAULT NULL,
  `conversion_threshold` float DEFAULT '0',
  `enable_store_visitation_lift` tinyint(4) NOT NULL DEFAULT '0',
  `sar_threshold` float DEFAULT '0',
  `enableBehaviourAudienceTargeting` tinyint(4) NOT NULL DEFAULT '0',
  `salesforceNumber` varchar(16) DEFAULT NULL,
  `sendCLLData` tinyint(4) NOT NULL DEFAULT '0',
  `ctr_goal` float DEFAULT NULL,
  `viewability_freq_cap_val` smallint(6) DEFAULT NULL,
  `viewability_freq_cap_duration` tinyint(4) DEFAULT NULL,
  `budget_carryover` bit(1) DEFAULT b'0',
  `adaptive_publisher_bidding_factor` float DEFAULT NULL,
  `DDO_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `budgetType` tinyint(4) DEFAULT NULL,
  `test_cpv` tinyint(4) DEFAULT NULL,
  `visit_targeting` tinyint(4) NOT NULL DEFAULT '0',
  `ttd_adgroup_id` varchar(45) DEFAULT NULL,
  `psvr_threshold` float DEFAULT '0',
  `pacing_mode` tinyint DEFAULT '0',
  `added_cost` double DEFAULT NULL,

  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_AdGroup_Campaign_new` (`campaign_id`),
  KEY `fk_AdGroup_MobileSite1_new` (`mobileSite_id`),
  KEY `fk_AdGroup_CallTrackingSetting1_new` (`cts_id`),
  KEY `adgroup_updatedDate_idx` (`updatedDate`),
  KEY `enable_str_visitation_idx` (`enable_store_visitation_lift`,`enableStoreVisitation`),
  KEY `adgroup_ttd_adgroup_id` (`ttd_adgroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2661890 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `adgroup_external_budget`
--

DROP TABLE IF EXISTS `adgroup_external_budget`;
/*!50001 DROP VIEW IF EXISTS `adgroup_external_budget`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `adgroup_external_budget` AS SELECT
 1 AS `tenant_id`,
 1 AS `adGroup_id`,
 1 AS `campaign_id`,
 1 AS `budget`,
 1 AS `totalDailySpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `adgroup_external_budget_combined`
--

DROP TABLE IF EXISTS `adgroup_external_budget_combined`;
/*!50001 DROP VIEW IF EXISTS `adgroup_external_budget_combined`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `adgroup_external_budget_combined` AS SELECT
 1 AS `tenant_id`,
 1 AS `adGroup_id`,
 1 AS `campaign_id`,
 1 AS `budget`,
 1 AS `totalDailySpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adgroup_pixel`
--

DROP TABLE IF EXISTS `adgroup_pixel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adgroup_pixel` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adgroup_id` bigint(20) NOT NULL,
  `pixel_id` bigint(20) NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `adgrop_pixel_uk` (`adgroup_id`,`pixel_id`),
  KEY `adgroup_id_idx` (`adgroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=841590 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adgrouplocation`
--

DROP TABLE IF EXISTS `adgrouplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adgrouplocation` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adGroup_id` bigint(20) NOT NULL,
  `msLocation_id` bigint(20) NOT NULL,
  `distance` double DEFAULT NULL,
  `landingPageUrl` varchar(5000) DEFAULT NULL,
  `landingPageDisplay` varchar(1500) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_AdGroupLocation_MSLocation1_new` (`msLocation_id`),
  KEY `fk_AdGroupLocation_AdGroup1_new` (`adGroup_id`),
  KEY `adgrouplocation_idx` (`adGroup_id`,`msLocation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119479640 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpackage`
--

DROP TABLE IF EXISTS `adpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpackage` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_AdPackage_Campaign_new` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73965 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner`
--

DROP TABLE IF EXISTS `adpartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner` (
  `adpartner_id` bigint(11) unsigned NOT NULL,
  `parent_id` bigint(11) unsigned DEFAULT NULL,
  `adpartner_name` varchar(128) DEFAULT NULL,
  `account_type` varchar(128) DEFAULT NULL,
  `http_vendor_id` bigint(20) DEFAULT NULL,
  `revenue_import_type` varchar(128) DEFAULT NULL,
  `pay_type` varchar(12) DEFAULT NULL,
  `display_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`adpartner_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `adpartner_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `adpartner` (`adpartner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_adgroup_budget`
--

DROP TABLE IF EXISTS `adpartner_adgroup_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_adgroup_budget` (
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `adgroupId` varchar(128) NOT NULL DEFAULT '',
  `budget` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `maxClicks` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adPartner`,`adgroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_adgroup_spend`
--

DROP TABLE IF EXISTS `adpartner_adgroup_spend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_adgroup_spend` (
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `adgroupId` varchar(128) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `spend` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `numClicks` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`adPartner`,`adgroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_campaign_budget`
--

DROP TABLE IF EXISTS `adpartner_campaign_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_campaign_budget` (
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `campaignId` varchar(128) NOT NULL DEFAULT '',
  `maxClicks` int(20) NOT NULL DEFAULT '0',
  `budget` decimal(14,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`adPartner`,`campaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_campaign_spend`
--

DROP TABLE IF EXISTS `adpartner_campaign_spend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_campaign_spend` (
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `campaignId` varchar(128) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `spend` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `numClicks` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`adPartner`,`campaignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_supply_budget`
--

DROP TABLE IF EXISTS `adpartner_supply_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_supply_budget` (
  `supplyPartner` varchar(128) NOT NULL DEFAULT '',
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `dailyBudget` decimal(14,5) NOT NULL DEFAULT '0.00000',
  `monthlyBudget` decimal(14,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`supplyPartner`,`adPartner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adpartner_supply_spend`
--

DROP TABLE IF EXISTS `adpartner_supply_spend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adpartner_supply_spend` (
  `supplyPartner` varchar(128) NOT NULL DEFAULT '',
  `adPartner` varchar(64) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `spend` decimal(14,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`date`,`supplyPartner`,`adPartner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audience_hash`
--

DROP TABLE IF EXISTS `audience_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audience_hash` (
  `audience_id` int(11) unsigned NOT NULL,
  `segment_hash` varchar(32) NOT NULL,
  `avails_hash` varchar(32) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`audience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `behaviours`
--

DROP TABLE IF EXISTS `behaviours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behaviours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `backend_key` varchar(64) NOT NULL DEFAULT '',
  `display_text` varchar(64) NOT NULL DEFAULT '',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billingsource`
--

DROP TABLE IF EXISTS `billingsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingsource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(64) DEFAULT NULL,
  `requiresTags` tinyint(4) NOT NULL DEFAULT '0',
  `supportsAutoreconciliation` tinyint(4) NOT NULL DEFAULT '0',
  `supportsAutomaticReportGeneration` tinyint(4) NOT NULL DEFAULT '0',
  `allowsMultiplePerAccount` tinyint(4) NOT NULL DEFAULT '0',
  `requiresURL` tinyint(4) NOT NULL DEFAULT '0',
  `allowsExplicitUsernamePassword` tinyint(4) NOT NULL DEFAULT '0',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `tenant_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL,
  `keyword` text,
  `type` smallint(6) DEFAULT NULL COMMENT '0=PUB DOMAIN, 1=PUB NAME',
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `adgroup_id` bigint(20) DEFAULT NULL,
  `is_whiteList` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `index2_new` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45293545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocklist`
--

DROP TABLE IF EXISTS `blocklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocklist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `key` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BlockList_Account` (`account_id`),
  KEY `fk_BlockList_Campaign` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_affiliations`
--

DROP TABLE IF EXISTS `brand_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_affiliations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `affiliation_type` int(8) NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tenant_acct_id` (`tenant_id`,`account_id`),
  KEY `tenant_acct_id_affil` (`tenant_id`,`account_id`,`affiliation_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!50001 DROP VIEW IF EXISTS `brands`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `brands` AS SELECT
 1 AS `id`,
 1 AS `brand_name`,
 1 AS `category`,
 1 AS `hide`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) NOT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `msLocation_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `entityType` tinyint(4) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `budgetPadding` double DEFAULT '0',
  `dailyImp` int(11) DEFAULT NULL,
  `dailyImpSpent` int(11) DEFAULT '0',
  `totalLifetimeSpent` double DEFAULT '0',
  `totalPeriodicSpent` double DEFAULT '0',
  `totalDailySpent` double DEFAULT '0',
  `reconcileStatus` tinyint(4) DEFAULT '0',
  `reconciledPeriodicSpent` double DEFAULT NULL,
  `reconciledLifetimeSpent` double DEFAULT NULL,
  `createdBy_id` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `LifetimeSpentSnapshot` double DEFAULT NULL,
  `PeriodicSpentSnapshot` double DEFAULT NULL,
  `recoLifetimeSpentSnapshot` double DEFAULT NULL,
  `recoPeriodicSpentSnapshot` double DEFAULT NULL,
  `SnapshotDate` date DEFAULT NULL,
  `createSnapshot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `uniq_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`publisher_id`,`tenant_id`),
  KEY `fk_Budget_AdGroup1_new` (`adGroup_id`),
  KEY `fk_Budget_Publisher1_new` (`publisher_id`),
  KEY `budget_cmp_adg_idx_new` (`campaign_id`,`adGroup_id`,`entityType`),
  KEY `budget_cmp_adg_msl_idx_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`entityType`),
  KEY `budget_cmp_adg_pub_idx_new` (`campaign_id`,`adGroup_id`,`publisher_id`,`entityType`),
  KEY `budget_cmp_idx_new` (`campaign_id`,`entityType`),
  KEY `budget_msl_adg` (`msLocation_id`,`adGroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3195050 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `budget_combined`
--

DROP TABLE IF EXISTS `budget_combined`;
/*!50001 DROP VIEW IF EXISTS `budget_combined`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_combined` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `budget`,
 1 AS `budgetPadding`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `reconcileStatus`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `createdBy_id`,
 1 AS `createdDate`,
 1 AS `updatedBy_id`,
 1 AS `updatedDate`,
 1 AS `del`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`,
 1 AS `recoPeriodicSpentSnapshot`,
 1 AS `predictedLifetimeSpentSnapshot`,
 1 AS `predictedDailySpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `pubLifetimeSpent`,
 1 AS `SnapshotDate`,
 1 AS `budgetResetDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `budget_combined_internal`
--

DROP TABLE IF EXISTS `budget_combined_internal`;
/*!50001 DROP VIEW IF EXISTS `budget_combined_internal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_combined_internal` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `budget`,
 1 AS `budgetPadding`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `reconcileStatus`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `createdBy_id`,
 1 AS `createdDate`,
 1 AS `updatedBy_id`,
 1 AS `updatedDate`,
 1 AS `del`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`,
 1 AS `recoPeriodicSpentSnapshot`,
 1 AS `predictedLifetimeSpentSnapshot`,
 1 AS `predictedDailySpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `pubLifetimeSpent`,
 1 AS `SnapshotDate`,
 1 AS `budgetResetDate`,
 1 AS `hasExternalBudget`,
 1 AS `externalBudget`,
 1 AS `externalTotalDailySpent`,
 1 AS `externalTotalLifetimeSpent`,
 1 AS `externalTotalPeriodicSpent`,
 1 AS `externalReconciledLifetimeSpent`,
 1 AS `externalReconciledPeriodicSpent`,
 1 AS `externalLifetimeSpentSnapshot`,
 1 AS `externalRecoLifetimeSpentSnapshot`,
 1 AS `internalBudget`,
 1 AS `internalTotalDailySpent`,
 1 AS `internalTotalLifetimeSpent`,
 1 AS `internalTotalPeriodicSpent`,
 1 AS `internalReconciledLifetimeSpent`,
 1 AS `internalReconciledPeriodicSpent`,
 1 AS `internalLifetimeSpentSnapshot`,
 1 AS `internalRecoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `budget_combined_new`
--

DROP TABLE IF EXISTS `budget_combined_new`;
/*!50001 DROP VIEW IF EXISTS `budget_combined_new`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_combined_new` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `budget`,
 1 AS `budgetPadding`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `reconcileStatus`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `createdBy_id`,
 1 AS `createdDate`,
 1 AS `updatedBy_id`,
 1 AS `updatedDate`,
 1 AS `del`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`,
 1 AS `recoPeriodicSpentSnapshot`,
 1 AS `predictedLifetimeSpentSnapshot`,
 1 AS `predictedDailySpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `pubLifetimeSpent`,
 1 AS `SnapshotDate`,
 1 AS `budgetResetDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budget_enigma`
--

DROP TABLE IF EXISTS `budget_enigma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_enigma` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `msLocation_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `entityType` tinyint(4) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `budgetPadding` double DEFAULT '0',
  `dailyImp` int(11) DEFAULT NULL,
  `dailyImpSpent` int(11) DEFAULT NULL,
  `totalLifetimeSpent` double DEFAULT NULL,
  `totalPeriodicSpent` double DEFAULT NULL,
  `totalDailySpent` double DEFAULT NULL,
  `reconcileStatus` tinyint(4) DEFAULT '0',
  `reconciledPeriodicSpent` double DEFAULT NULL,
  `reconciledLifetimeSpent` double DEFAULT NULL,
  `createdBy_id` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `LifetimeSpentSnapshot` double DEFAULT NULL,
  `PeriodicSpentSnapshot` double DEFAULT NULL,
  `recoLifetimeSpentSnapshot` double DEFAULT NULL,
  `recoPeriodicSpentSnapshot` double DEFAULT NULL,
  `SnapshotDate` date DEFAULT NULL,
  `dailyClick` int(11) DEFAULT NULL,
  `dailySecondaryAction` int(11) DEFAULT NULL,
  `budgetResetDate` datetime DEFAULT NULL,
  `pubLifetimeSpent` double DEFAULT NULL,
  `pubDailySpent` double DEFAULT NULL,
  `predictedLifetimeSpent` double DEFAULT NULL,
  `predictedPeriodicSpent` double DEFAULT NULL,
  `predictedDailySpent` double DEFAULT NULL,
  `predictedLifetimeSpentSnapshot` double DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `uniq_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`publisher_id`,`tenant_id`),
  KEY `fk_Budget_AdGroup1_new` (`adGroup_id`),
  KEY `fk_Budget_Publisher1_new` (`publisher_id`),
  KEY `fk_Budget_MSLocation1_new` (`msLocation_id`),
  KEY `budget_cmp_adg_msl_idx_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`entityType`),
  KEY `budget_cmp_adg_pub_idx_new` (`campaign_id`,`adGroup_id`,`publisher_id`,`entityType`)
) ENGINE=InnoDB AUTO_INCREMENT=3195046 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `budget_enigma_internal`
--

DROP TABLE IF EXISTS `budget_enigma_internal`;
/*!50001 DROP VIEW IF EXISTS `budget_enigma_internal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_enigma_internal` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `budget`,
 1 AS `budgetPadding`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `reconcileStatus`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `createdBy_id`,
 1 AS `createdDate`,
 1 AS `updatedBy_id`,
 1 AS `updatedDate`,
 1 AS `del`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`,
 1 AS `recoPeriodicSpentSnapshot`,
 1 AS `predictedLifetimeSpentSnapshot`,
 1 AS `predictedDailySpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `pubLifetimeSpent`,
 1 AS `SnapshotDate`,
 1 AS `budgetResetDate`,
 1 AS `hasExternalBudget`,
 1 AS `externalBudget`,
 1 AS `externalTotalDailySpent`,
 1 AS `externalTotalLifetimeSpent`,
 1 AS `externalTotalPeriodicSpent`,
 1 AS `externalReconciledLifetimeSpent`,
 1 AS `externalReconciledPeriodicSpent`,
 1 AS `externalLifetimeSpentSnapshot`,
 1 AS `externalRecoLifetimeSpentSnapshot`,
 1 AS `internalBudget`,
 1 AS `internalTotalDailySpent`,
 1 AS `internalTotalLifetimeSpent`,
 1 AS `internalTotalPeriodicSpent`,
 1 AS `internalReconciledLifetimeSpent`,
 1 AS `internalReconciledPeriodicSpent`,
 1 AS `internalLifetimeSpentSnapshot`,
 1 AS `internalRecoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budget_enigma_test`
--

DROP TABLE IF EXISTS `budget_enigma_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_enigma_test` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `msLocation_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `entityType` tinyint(4) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `budgetPadding` double DEFAULT '0',
  `dailyImp` int(11) DEFAULT NULL,
  `dailyImpSpent` int(11) DEFAULT NULL,
  `totalLifetimeSpent` double DEFAULT NULL,
  `totalPeriodicSpent` double DEFAULT NULL,
  `totalDailySpent` double DEFAULT NULL,
  `reconcileStatus` tinyint(4) DEFAULT '0',
  `reconciledPeriodicSpent` double DEFAULT NULL,
  `reconciledLifetimeSpent` double DEFAULT NULL,
  `createdBy_id` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `LifetimeSpentSnapshot` double DEFAULT NULL,
  `PeriodicSpentSnapshot` double DEFAULT NULL,
  `recoLifetimeSpentSnapshot` double DEFAULT NULL,
  `recoPeriodicSpentSnapshot` double DEFAULT NULL,
  `SnapshotDate` date DEFAULT NULL,
  `dailyClick` int(11) DEFAULT NULL,
  `dailySecondaryAction` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `uniq_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`publisher_id`,`tenant_id`),
  KEY `fk_Budget_AdGroup1_new` (`adGroup_id`),
  KEY `fk_Budget_Publisher1_new` (`publisher_id`),
  KEY `fk_Budget_MSLocation1_new` (`msLocation_id`),
  KEY `budget_cmp_adg_msl_idx_new` (`campaign_id`,`adGroup_id`,`msLocation_id`,`entityType`),
  KEY `budget_cmp_adg_pub_idx_new` (`campaign_id`,`adGroup_id`,`publisher_id`,`entityType`)
) ENGINE=InnoDB AUTO_INCREMENT=2058009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_pacing_sync`
--

DROP TABLE IF EXISTS `budget_pacing_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_pacing_sync` (
  `tenant_id` int(11) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `adgroup_id` bigint(20) NOT NULL,
  `spends` double NOT NULL,
  PRIMARY KEY (`tenant_id`,`campaign_id`,`adgroup_id`),
  KEY `campaign_id_new` (`campaign_id`),
  KEY `adgroup_id_new` (`adgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_reset_campaign`
--

DROP TABLE IF EXISTS `budget_reset_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_reset_campaign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_reset_campaign_monthly_unq` (`campaign_id`),
  KEY `budget_reset_campaign_monthly_idx` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_reset_error_log`
--

DROP TABLE IF EXISTS `budget_reset_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_reset_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(250) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `note` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_reset_history`
--

DROP TABLE IF EXISTS `budget_reset_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_reset_history` (
  `tenant_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL DEFAULT '0',
  `campaign_id` bigint(20) DEFAULT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `dailyImp` int(11) DEFAULT NULL,
  `dailyImpSpent` int(11) DEFAULT NULL,
  `totalLifetimeSpent` double DEFAULT NULL,
  `totalPeriodicSpent` double DEFAULT NULL,
  `totalDailySpent` double DEFAULT NULL,
  `SnapshotDate` date DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdDate` date DEFAULT NULL,
  `pubLifetimeSpent` double DEFAULT NULL,
  `pubDailySpent` double DEFAULT NULL,
  `predictedLifetimeSpent` double DEFAULT NULL,
  `predictedPeriodicSpent` double DEFAULT NULL,
  `predictedDailySpent` double DEFAULT NULL,
  `LifetimeSpentSnapshot` double DEFAULT NULL,
  `PeriodicSpentSnapshot` double DEFAULT NULL,
  `recoLifetimeSpentSnapshot` double DEFAULT NULL,
  `recoPeriodicSpentSnapshot` double DEFAULT NULL,
  `predictedLifetimeSpentSnapshot` double DEFAULT NULL,
  `msLocation_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `entityType` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`timestamp`),
  KEY `budget_reset_history_timestamp_idx` (`timestamp`),
  KEY `budget_reset_history_campaign_idx` (`campaign_id`),
  KEY `budget_reset_history_adgroup_idx` (`adGroup_id`),
  KEY `budget_reset_history_idx` (`id`,`createdDate`),
  KEY `createdDate_idx` (`createdDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `budget_reset_history_combined`
--

DROP TABLE IF EXISTS `budget_reset_history_combined`;
/*!50001 DROP VIEW IF EXISTS `budget_reset_history_combined`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_reset_history_combined` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `predictedLifetimeSpentSnapshot`,
 1 AS `predictedDailySpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `pubLifetimeSpent`,
 1 AS `SnapshotDate`,
 1 AS `us_timestamp`,
 1 AS `ie_timestamp`,
 1 AS `jp_timestamp`,
 1 AS `cn_timestamp`,
 1 AS `createdDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `budget_spent`
--

DROP TABLE IF EXISTS `budget_spent`;
/*!50001 DROP VIEW IF EXISTS `budget_spent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `budget_spent` AS SELECT
 1 AS `tenant_id`,
 1 AS `id`,
 1 AS `campaign_id`,
 1 AS `adGroup_id`,
 1 AS `msLocation_id`,
 1 AS `publisher_id`,
 1 AS `entityType`,
 1 AS `budget`,
 1 AS `budgetPadding`,
 1 AS `dailyImp`,
 1 AS `dailyImpSpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `totalDailySpent`,
 1 AS `reconcileStatus`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `createdBy_id`,
 1 AS `createdDate`,
 1 AS `updatedBy_id`,
 1 AS `updatedDate`,
 1 AS `del`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `PeriodicSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`,
 1 AS `recoPeriodicSpentSnapshot`,
 1 AS `SnapshotDate`,
 1 AS `dailyClick`,
 1 AS `dailySecondaryAction`,
 1 AS `budgetResetDate`,
 1 AS `pubLifetimeSpent`,
 1 AS `pubDailySpent`,
 1 AS `predictedLifetimeSpent`,
 1 AS `predictedPeriodicSpent`,
 1 AS `predictedDailySpent`,
 1 AS `predictedLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budget_timeperiod`
--

DROP TABLE IF EXISTS `budget_timeperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_timeperiod` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) NOT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `createdBy_id` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedBy_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY ` budget_tp_uniq` (`campaign_id`,`adGroup_id`,`tenant_id`,`id`),
  KEY `budget_tp_adg_idx` (`adGroup_id`),
  KEY `budget_tp_cmp_adg_idx` (`campaign_id`,`adGroup_id`,`tenant_id`),
  KEY `budget_tp_cmp_idx` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320875 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_id_tracking`
--

DROP TABLE IF EXISTS `call_id_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_id_tracking` (
  `call_id` varchar(64) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calltrackingnumber`
--

DROP TABLE IF EXISTS `calltrackingnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calltrackingnumber` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publisher_id` bigint(20) NOT NULL,
  `adGroup_id` bigint(20) NOT NULL,
  `srcPhone` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_CallTrackingNumber_Publisher1_new` (`publisher_id`),
  KEY `fk_CallTrackingNumber_AdGroup1_new` (`adGroup_id`),
  KEY `SRCPHONE_new` (`srcPhone`),
  KEY `PHONE_new` (`phone`),
  KEY `CallTrackingNumber_idx` (`adGroup_id`,`publisher_id`,`srcPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=23105655 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calltrackingsettings`
--

DROP TABLE IF EXISTS `calltrackingsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calltrackingsettings` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider` tinyint(4) DEFAULT '0',
  `numberType` varchar(16) DEFAULT NULL,
  `minDuration` int(11) DEFAULT NULL,
  `distinctCalls` int(11) DEFAULT NULL,
  `nullCLIDBillable` tinyint(4) DEFAULT '0',
  `enableRecording` tinyint(4) DEFAULT '0',
  `callRoute` varchar(45) DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51020 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `primaryCategory_id` bigint(20) DEFAULT NULL,
  `secondaryCategory_id` bigint(20) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `vendorIdentifier` varchar(128) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `autoBudgetDistribution` tinyint(4) DEFAULT NULL,
  `budgetType` tinyint(4) DEFAULT NULL,
  `pacing` tinyint(4) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `enableAutoreconcile` tinyint(4) NOT NULL DEFAULT '0',
  `billingSource_id` bigint(20) DEFAULT '1',
  `accountBillingSource_id` bigint(20) DEFAULT NULL,
  `billingSourceURL` varchar(512) DEFAULT NULL,
  `billingSourceUsername` varchar(128) DEFAULT NULL,
  `billingSourcePassword` varchar(128) DEFAULT NULL,
  `billingSourceAccountIdentifier` varchar(256) DEFAULT NULL,
  `placement` tinyint(4) DEFAULT NULL,
  `notes` varchar(600) DEFAULT NULL,
  `salesforceNumber` varchar(16) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `adomain` varchar(512) DEFAULT NULL,
  `svlVendors` varchar(128) DEFAULT NULL,
  `ctr_threshold` float DEFAULT NULL,
  `indexTime` datetime DEFAULT NULL,
  `client_io_name` varchar(500) DEFAULT NULL,
  `billing_type` tinyint(4) DEFAULT '1',
  `client_kpi` varchar(32) DEFAULT NULL,
  `client_kpi_benchmark` varchar(10) DEFAULT NULL,
  `category_primary` varchar(10) DEFAULT NULL,
  `category_secondary` varchar(10) DEFAULT NULL,
  `conversion_threshold` float DEFAULT '0',
  `app_used` varchar(10) NOT NULL DEFAULT 'XCv2',
  `sar_threshold` float DEFAULT '0',
  `ctr_goal` float DEFAULT NULL,
  `rfp_id` int(11) unsigned DEFAULT NULL,
  `io_budget` decimal(10,2) unsigned DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `freqCapValue` smallint(6) DEFAULT NULL,
  `freqCapDuration` tinyint(4) DEFAULT NULL,
  `partner_sales` varchar(255) DEFAULT NULL,
  `partner_ops` varchar(255) DEFAULT NULL,
  `partner_account_manager` varchar(255) DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `is_cpv` tinyint(1) NOT NULL DEFAULT '0',
  `is_cbd` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Campaign_Account_new` (`account_id`),
  KEY `fk_Campaign_primaryCategory_new` (`primaryCategory_id`),
  KEY `fk_Campaign_secondaryCategory_new` (`secondaryCategory_id`),
  KEY `billingSource_fk_new` (`billingSource_id`),
  KEY `campaign_ibfk_1_new` (`accountBillingSource_id`),
  KEY `campaign_enddate_idx` (`endDate`),
  KEY `campaign_startdate_idx` (`startDate`),
  KEY `campaign_updatedDate_idx` (`updatedDate`),
  KEY `campaign_rfp_id_idx` (`rfp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253780 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `campaign_external_budget`
--

DROP TABLE IF EXISTS `campaign_external_budget`;
/*!50001 DROP VIEW IF EXISTS `campaign_external_budget`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `campaign_external_budget` AS SELECT
 1 AS `tenant_id`,
 1 AS `campaign_id`,
 1 AS `budget`,
 1 AS `totalDailySpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `campaign_external_budget_combined`
--

DROP TABLE IF EXISTS `campaign_external_budget_combined`;
/*!50001 DROP VIEW IF EXISTS `campaign_external_budget_combined`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `campaign_external_budget_combined` AS SELECT
 1 AS `tenant_id`,
 1 AS `campaign_id`,
 1 AS `budget`,
 1 AS `totalDailySpent`,
 1 AS `totalLifetimeSpent`,
 1 AS `totalPeriodicSpent`,
 1 AS `reconciledLifetimeSpent`,
 1 AS `reconciledPeriodicSpent`,
 1 AS `LifetimeSpentSnapshot`,
 1 AS `recoLifetimeSpentSnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `carriercountries`
--

DROP TABLE IF EXISTS `carriercountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carriercountries` (
  `country_id` int(11) unsigned NOT NULL DEFAULT '0',
  `carrier_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`,`carrier_id`),
  KEY `carrier_id` (`carrier_id`),
  CONSTRAINT `carriercountries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `carriercountries_ibfk_2` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carriers`
--

DROP TABLE IF EXISTS `carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '',
  `displayName` varchar(128) NOT NULL DEFAULT '',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) NOT NULL,
  `xadId` varchar(64) DEFAULT NULL,
  `name` text,
  `sicCode` varchar(16) DEFAULT NULL,
  `isCode` varchar(8) DEFAULT NULL,
  `frCode` varchar(8) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Category_Channels1` (`channel_id`),
  CONSTRAINT `fk_Category_Channels1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8438 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorysictoiabmapping`
--

DROP TABLE IF EXISTS `categorysictoiabmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorysictoiabmapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sicCode` varchar(16) NOT NULL,
  `iabCode` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sicCode` (`sicCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9194 DEFAULT CHARSET=utf8 COMMENT='Maps category sic code to iab codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfg_click_score`
--

DROP TABLE IF EXISTS `cfg_click_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_click_score` (
  `PLACEMENT_RANK` tinyint(2) unsigned NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `SOURCE` varchar(32) NOT NULL DEFAULT '',
  `CLICK_SCORE` float(5,2) unsigned NOT NULL DEFAULT '1.00',
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PLACEMENT_RANK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cfg_system_param`
--

DROP TABLE IF EXISTS `cfg_system_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfg_system_param` (
  `PARAM_NAME` varchar(50) NOT NULL DEFAULT '',
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `SOURCE` varchar(32) NOT NULL DEFAULT '',
  `PARAM_VALUE` varchar(5000) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PARAM_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `objectType` varchar(45) DEFAULT NULL,
  `objectName` varchar(255) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `oldValue` text,
  `newValue` text,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT NULL,
  `ipAddress` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_ChangeLog_User_new` (`user_id`),
  KEY `idx_changelog_new` (`objectType`,`objectId`),
  KEY `changelog_date_idx_new` (`updatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=826336930 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `iabCode` varchar(20) DEFAULT NULL,
  `parentChannel_id` bigint(20) DEFAULT NULL,
  `showInChannels` tinyint(4) NOT NULL DEFAULT '0',
  `channelBitmask` bigint(20) DEFAULT NULL,
  `showInAudiences` tinyint(4) NOT NULL DEFAULT '0',
  `audienceBitmask` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channelmapping`
--

DROP TABLE IF EXISTS `channelmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channelmapping` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adGroup_id` bigint(20) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_ChannelMapping_AdGroup1_new` (`adGroup_id`),
  KEY `fk_ChannelMapping_Channel1_new` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clickurltranslations`
--

DROP TABLE IF EXISTS `clickurltranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clickurltranslations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(128) DEFAULT NULL,
  `pattern` varchar(512) DEFAULT NULL,
  `impressionPattern` varchar(512) DEFAULT NULL,
  `redirectionText` varchar(128) DEFAULT NULL,
  `supportsRedirectionText` tinyint(4) NOT NULL DEFAULT '1',
  `bannerPattern` varchar(512) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `tagBillingSource` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tagBillingSource` (`tagBillingSource`),
  CONSTRAINT `clickurltranslations_ibfk_1` FOREIGN KEY (`tagBillingSource`) REFERENCES `billingsource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_id` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(4) DEFAULT '0',
  `invoice_opportunity_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Company_Address1_new` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_segments`
--

DROP TABLE IF EXISTS `company_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_segments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `name` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL DEFAULT '',
  `displayName` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `distanceUnit` varchar(32) NOT NULL DEFAULT 'miles',
  `regexZip` varchar(128) NOT NULL DEFAULT '/^.*$/',
  `regexPhone` varchar(128) NOT NULL DEFAULT '/^.*$/',
  `regexInvalidZip` varchar(512) DEFAULT NULL,
  `regexInvalidPhone` varchar(512) DEFAULT NULL,
  `language` varchar(2) NOT NULL DEFAULT 'en',
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `zeroPadPostalCodes` varchar(32) DEFAULT NULL,
  `zeroPadPhones` varchar(32) DEFAULT NULL,
  `alpha3code` varchar(3) NOT NULL DEFAULT '',
  `servingEnabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_timezone`
--

DROP TABLE IF EXISTS `country_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_timezone` (
  `alpha2_country_code` varchar(20) NOT NULL DEFAULT '',
  `state_code` varchar(20) NOT NULL DEFAULT '',
  `timezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`alpha2_country_code`,`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countryregions`
--

DROP TABLE IF EXISTS `countryregions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countryregions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `timezone` varchar(128) NOT NULL DEFAULT '',
  `country_id` int(11) unsigned NOT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `countryregions_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrystates`
--

DROP TABLE IF EXISTS `countrystates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrystates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL DEFAULT '',
  `displayName` varchar(128) NOT NULL,
  `country_id` int(11) unsigned NOT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `countrystates_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creative`
--

DROP TABLE IF EXISTS `creative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creative` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `landingPageDisplay` varchar(1500) DEFAULT NULL,
  `landingPageUrl` varchar(5000) DEFAULT NULL,
  `landingPageType` tinyint(4) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `cmsCreativeType` varchar(45) DEFAULT NULL,
  `cmsCreativeId` bigint(20) DEFAULT NULL,
  `cmsRevisionId` bigint(20) DEFAULT NULL,
  `cmsConfig` text,
  `lpCreativeId` bigint(20) DEFAULT NULL,
  `lpRevisionId` bigint(20) DEFAULT NULL,
  `lpConfig` text,
  `freqCapValue` smallint(6) DEFAULT NULL,
  `freqCapDuration` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `api` tinyint(4) DEFAULT NULL,
  `iurl` varchar(1024) DEFAULT NULL,
  `publisherType` varchar(16) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `attributes` varchar(64) DEFAULT NULL,
  `interstitial` tinyint(4) DEFAULT NULL,
  `mimeType` varchar(512) DEFAULT NULL,
  `videoDuration` varchar(256) DEFAULT NULL,
  `videoProtocol` tinyint(4) DEFAULT NULL,
  `videoBitrate` varchar(256) DEFAULT NULL,
  `videoDelivery` varchar(256) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `hero_publisher_id` bigint(20) DEFAULT NULL,
  `hero_slot_id` varchar(1024) DEFAULT NULL,
  `hero_creative_id` varchar(128) DEFAULT NULL,
  `hero_ad_type` varchar(256) DEFAULT NULL,
  `vendorIdentifier` varchar(128) DEFAULT NULL,
  `videoLinearity` varchar(45) DEFAULT NULL,
  `asset_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Creative_AdGroup_new` (`adGroup_id`),
  KEY `ix_creative_asset_id_tenant_id` (`asset_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4281185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creative_assets`
--

DROP TABLE IF EXISTS `creative_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creative_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `asset_type` varchar(45) NOT NULL,
  `file_extension` varchar(45) DEFAULT NULL,
  `asset_source` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `del` tinyint(1) DEFAULT '0',
  `asset_hash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `tenant_id_asset_hash_idx` (`tenant_id`, `asset_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creative_sizes`
--

DROP TABLE IF EXISTS `creative_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creative_sizes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `size` varchar(45) NOT NULL DEFAULT '',
  `displaySize` varchar(128) DEFAULT NULL,
  `fullscreen` bit(1) DEFAULT b'0',
  `enabledForTypes` varchar(256) DEFAULT 'HTML5,IMAGE,SCRIPT',
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `enabled_for_devices` varchar(128) DEFAULT 'PHONE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctv_category`
--

DROP TABLE IF EXISTS `ctv_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctv_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) UNIQUE NOT NULL,
  `constraints` text NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_smallest_increments`
--

DROP TABLE IF EXISTS `currency_smallest_increments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_smallest_increments` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `currency` varchar(32) NOT NULL,
  `increment` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataproviders`
--

DROP TABLE IF EXISTS `dataproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataproviders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pub_id` bigint(20) NOT NULL,
  `s3_name` varchar(50) NOT NULL,
  `fields` varchar(500) DEFAULT NULL,
  `last_processed` datetime DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `running` int(1) DEFAULT NULL,
  `threads` int(5) DEFAULT NULL,
  `distribution` varchar(250) DEFAULT NULL,
  `recency` int(11) NOT NULL DEFAULT '48',
  `whitelisted_countries` varchar(512) NOT NULL DEFAULT 'US',
  `blacklisted_apps` text,
  PRIMARY KEY (`id`),
  KEY `pub_id` (`pub_id`),
  CONSTRAINT `dataproviders_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataprovidersdetails`
--

DROP TABLE IF EXISTS `dataprovidersdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataprovidersdetails` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publisher_id` bigint(20) DEFAULT NULL,
  `ftp_user_name` varchar(64) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `errorMessage` text,
  `fields` text,
  `active` int(11) DEFAULT NULL,
  `s3alias` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_dataprovidersdetails_publisher` (`publisher_id`),
  CONSTRAINT `FK_dataprovidersdetails_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_channels`
--

DROP TABLE IF EXISTS `delivery_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_channels` (
  `id` tinyint(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `pmp_adpartner_id` int(11) DEFAULT NULL,
  `adpartner_id` int(11) NOT NULL,
  `inbound_dealid_field` varchar(255) NOT NULL,
  `outbound_dealid_field` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_year`
--

DROP TABLE IF EXISTS `device_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_year` (
  `device_name` varchar(80) NOT NULL,
  `hw_model` varchar(80) NOT NULL DEFAULT '',
  `year` int(4) NOT NULL,
  PRIMARY KEY (`device_name`,`hw_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `deviceatlas_devices`
--

DROP TABLE IF EXISTS `deviceatlas_devices`;
/*!50001 DROP VIEW IF EXISTS `deviceatlas_devices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `deviceatlas_devices` AS SELECT
 1 AS `id`,
 1 AS `vendor_id`,
 1 AS `manufacturer_id`,
 1 AS `deviceAtlasId`,
 1 AS `marketingName`,
 1 AS `fullName`,
 1 AS `modelNumber`,
 1 AS `vendorName`,
 1 AS `manufacturerName`,
 1 AS `deviceType`,
 1 AS `OS`,
 1 AS `releaseYear`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `deviceatlas_devicevendors`
--

DROP TABLE IF EXISTS `deviceatlas_devicevendors`;
/*!50001 DROP VIEW IF EXISTS `deviceatlas_devicevendors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `deviceatlas_devicevendors` AS SELECT
 1 AS `id`,
 1 AS `vendorName`,
 1 AS `displayRank`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `domainregistrationorderlog`
--

DROP TABLE IF EXISTS `domainregistrationorderlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainregistrationorderlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domainName` varchar(45) DEFAULT NULL,
  `orderCode` varchar(45) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `orderType` tinyint(4) DEFAULT NULL,
  `orderStatus` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ecpm_vendor_specific_expenses_default`
--

DROP TABLE IF EXISTS `ecpm_vendor_specific_expenses_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecpm_vendor_specific_expenses_default` (
  `vendor` varchar(32) NOT NULL DEFAULT '',
  `admincharges` double NOT NULL DEFAULT '0',
  `operatingfees` double NOT NULL DEFAULT '0',
  `baddebt` double NOT NULL DEFAULT '0',
  `conversionrate` double NOT NULL DEFAULT '0',
  `thresholdrealecpm` int(10) NOT NULL DEFAULT '0',
  `thresholdtestecpm` double(10,4) NOT NULL DEFAULT '0.0000',
  `econversionrate` double(10,4) NOT NULL DEFAULT '0.0000',
  `revshare` double(10,4) DEFAULT '0.0000',
  `discount` double(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exchange_rates`
--

DROP TABLE IF EXISTS `exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rates` (
  `date` date NOT NULL,
  `source_currency` varchar(32) NOT NULL,
  `target_currency` varchar(32) NOT NULL,
  `exch_rate` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`date`,`source_currency`,`target_currency`),
  KEY `index_date` (`date`),
  KEY `exchange_rates_idx` (`source_currency`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exchange_rates_tmp`
--

DROP TABLE IF EXISTS `exchange_rates_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rates_tmp` (
  `date` date NOT NULL,
  `source_currency` varchar(32) NOT NULL,
  `target_currency` varchar(32) NOT NULL,
  `exch_rate` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`date`,`source_currency`,`target_currency`),
  KEY `index_date` (`date`),
  KEY `exchange_rates_idx` (`source_currency`,`target_currency`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_campaign`
--

DROP TABLE IF EXISTS `external_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_campaign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign` varchar(64) DEFAULT NULL,
  `markup` text,
  `adomain` varchar(512) DEFAULT NULL,
  `iurl` varchar(2048) DEFAULT NULL,
  `added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `processed` tinyint(1) DEFAULT '0',
  `missing_counter` int(11) DEFAULT '0',
  `reason_not_processed` int(11) DEFAULT '0',
  `blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `lastSeen` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`campaign`)
) ENGINE=InnoDB AUTO_INCREMENT=146387890 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `external_campaign_atlantic`
--

DROP TABLE IF EXISTS `external_campaign_atlantic`;
/*!50001 DROP VIEW IF EXISTS `external_campaign_atlantic`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `external_campaign_atlantic` AS SELECT
 1 AS `campaign`,
 1 AS `adomain`,
 1 AS `iurl`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `external_campaign_history`
--

DROP TABLE IF EXISTS `external_campaign_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_campaign_history` (
  `id` bigint(20) NOT NULL,
  `campaign` varchar(64) DEFAULT NULL,
  `markup` text,
  `adomain` varchar(512) DEFAULT NULL,
  `iurl` varchar(2048) DEFAULT NULL,
  `added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `processed` tinyint(1) DEFAULT '0',
  `missing_counter` int(11) DEFAULT '0',
  `reason_not_processed` int(11) DEFAULT '0',
  `blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `lastSeen` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`campaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_campaign_hosted_adomains`
--

DROP TABLE IF EXISTS `external_campaign_hosted_adomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_campaign_hosted_adomains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(1024) NOT NULL DEFAULT '',
  `adomain` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_campaign_vendors`
--

DROP TABLE IF EXISTS `external_campaign_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_campaign_vendors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor` varchar(32) DEFAULT NULL,
  `hosting_domain` varchar(32) DEFAULT NULL,
  `has_pattern` tinyint(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedcategories`
--

DROP TABLE IF EXISTS `feedcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedcategories` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adGroup_id` bigint(20) NOT NULL,
  `category` varchar(140) NOT NULL DEFAULT '',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Term_AdGroup_new` (`adGroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37596200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedconfig`
--

DROP TABLE IF EXISTS `feedconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedconfig` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `cts_id` bigint(20) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `adType` tinyint(4) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `budgetType` tinyint(4) DEFAULT NULL,
  `ctnType` tinyint(4) DEFAULT NULL,
  `listingConfig` tinyint(4) DEFAULT NULL,
  `importType` tinyint(4) DEFAULT NULL,
  `feedLocation` varchar(255) DEFAULT NULL,
  `feedFormatName` varchar(255) DEFAULT NULL,
  `targetLocationType` tinyint(4) DEFAULT '0',
  `cmsCreativeType` varchar(128) DEFAULT NULL,
  `cmsCreativeId` bigint(20) DEFAULT NULL,
  `cmsRevisionId` bigint(20) DEFAULT NULL,
  `cmsConfig` text,
  `creativeSize` varchar(64) DEFAULT NULL,
  `landingPageType` tinyint(4) DEFAULT NULL,
  `lpCreativeId` bigint(20) DEFAULT NULL,
  `lpRevisionId` bigint(20) DEFAULT NULL,
  `lpConfig` text,
  `ftpUsername` varchar(64) DEFAULT NULL,
  `ftpHost` varchar(256) DEFAULT NULL,
  `ftpPassword` varchar(64) DEFAULT NULL,
  `preciseLatLng` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_feedconfig_account_idx_new` (`account_id`),
  KEY `fk_feedconfig_calltrackingsettings1_idx_new` (`cts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedformat`
--

DROP TABLE IF EXISTS `feedformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedformat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `vendorName` varchar(128) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `transformerClass` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footprints_brand`
--

DROP TABLE IF EXISTS `footprints_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footprints_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessName` varchar(256) DEFAULT NULL,
  `alternativeName` varchar(256) DEFAULT NULL,
  `displayName` varchar(256) DEFAULT NULL,
  `sicPrefix` varchar(40) DEFAULT NULL,
  `competitorGroup1` int(8) NOT NULL,
  `fence` char(3) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footprints_company`
--

DROP TABLE IF EXISTS `footprints_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footprints_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COMPANY_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `footprints_company_brand`
--

DROP TABLE IF EXISTS `footprints_company_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footprints_company_brand` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `UNQ_COMPANY_BRAND_new` (`company_id`,`brand_id`,`tenant_id`),
  KEY `brand_id_new` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `geographic_city_centroids`
--

DROP TABLE IF EXISTS `geographic_city_centroids`;
/*!50001 DROP VIEW IF EXISTS `geographic_city_centroids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `geographic_city_centroids` AS SELECT
 1 AS `id`,
 1 AS `country_id`,
 1 AS `country`,
 1 AS `city`,
 1 AS `state`,
 1 AS `centerLat`,
 1 AS `centerLng`,
 1 AS `latitude1`,
 1 AS `longitude1`,
 1 AS `latitude2`,
 1 AS `longitude2`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `geographic_dmas`
--

DROP TABLE IF EXISTS `geographic_dmas`;
/*!50001 DROP VIEW IF EXISTS `geographic_dmas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `geographic_dmas` AS SELECT
 1 AS `id`,
 1 AS `dmacode`,
 1 AS `dmaname`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `geographic_zip_centroids`
--

DROP TABLE IF EXISTS `geographic_zip_centroids`;
/*!50001 DROP VIEW IF EXISTS `geographic_zip_centroids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `geographic_zip_centroids` AS SELECT
 1 AS `id`,
 1 AS `country_id`,
 1 AS `country`,
 1 AS `zipcode`,
 1 AS `centerLat`,
 1 AS `centerLng`,
 1 AS `latitude1`,
 1 AS `longitude1`,
 1 AS `latitude2`,
 1 AS `longitude2`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `geotarget`
--

DROP TABLE IF EXISTS `geotarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotarget` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `dma` varchar(45) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `lat` varchar(32) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL,
  `radius` double DEFAULT NULL,
  `geocodeAttempted` tinyint(4) NOT NULL DEFAULT '0',
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `exclude` tinyint(1) DEFAULT '0',
  `brand_id` int(11) DEFAULT '0',
  `poi_id` int(10) unsigned DEFAULT NULL,
  `ccm` varchar(16) NOT NULL,
  `county` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_GeoInclusion_AdGroup_new` (`adGroup_id`),
  KEY `geotarget_latitude_idx` (`latitude`),
  KEY `geotarget_longitude_idx` (`longitude`),
  KEY `GeoTarget_type_geocodeAttempted_idx` (`type`,`geocodeAttempted`),
  KEY `geotarget_updatedDate_idx` (`updatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1489427785 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `graylist_consent`
--
DROP TABLE IF EXISTS `graylist_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graylist_consent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `adgroup_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_sic_code` varchar(16) DEFAULT NULL,
  `consent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `heartbeat`
--

DROP TABLE IF EXISTS `heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat` (
  `CLUSTERNAME` varchar(128) NOT NULL,
  `REPLICATION_HASH` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`CLUSTERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_jobs`
--

DROP TABLE IF EXISTS `history_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_jobs` (
  `table_name` varchar(120) NOT NULL DEFAULT '',
  `modified_start_id` bigint(20) NOT NULL DEFAULT '0',
  `modified_end_id` bigint(20) NOT NULL DEFAULT '0',
  `status` enum('QUEUED','IN_PROGRESS','DONE','ERRORED') DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_name`,`modified_start_id`,`modified_end_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_types`
--

DROP TABLE IF EXISTS `history_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_types` (
  `id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httpvendor`
--

DROP TABLE IF EXISTS `httpvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpvendor` (
  `httpVendorId` bigint(11) NOT NULL,
  `httpvendorname` varchar(128) NOT NULL,
  `slConfThreshold` int(11) DEFAULT NULL,
  `daily_spend_limit` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit for all publishers on this httpvendor in US $',
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `monthly_spend_limit` decimal(8,2) DEFAULT NULL,
  `daily_spend_limit_per_ad` decimal(8,2) DEFAULT NULL,
  `data_center` varchar(128) NOT NULL DEFAULT 'US' COMMENT 'country code of the data source',
  `controller` tinyint(4) DEFAULT NULL,
  `iab_vendor_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`httpVendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` text,
  `del` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Keywords_Category` (`category_id`),
  CONSTRAINT `fk_Keywords_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_geocoded_id`
--

DROP TABLE IF EXISTS `last_geocoded_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_geocoded_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isOdd` tinyint(4) NOT NULL DEFAULT '0',
  `lastGeoTargetId` int(11) NOT NULL DEFAULT '0',
  `lastMsLocationId` int(11) NOT NULL DEFAULT '0',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `latest_exchange_dates`
--

DROP TABLE IF EXISTS `latest_exchange_dates`;
/*!50001 DROP VIEW IF EXISTS `latest_exchange_dates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_exchange_dates` AS SELECT
 1 AS `source_currency`,
 1 AS `target_currency`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_exchange_rates`
--

DROP TABLE IF EXISTS `latest_exchange_rates`;
/*!50001 DROP VIEW IF EXISTS `latest_exchange_rates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_exchange_rates` AS SELECT
 1 AS `source_currency`,
 1 AS `target_currency`,
 1 AS `exch_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `market_reporting_timezone`
--

DROP TABLE IF EXISTS `market_reporting_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_reporting_timezone` (
  `id` int(11) NOT NULL,
  `market` char(12) NOT NULL,
  `timezone` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobilesite`
--

DROP TABLE IF EXISTS `mobilesite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobilesite` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `msTemplate_id` bigint(20) DEFAULT NULL,
  `msTemplateContent_id` bigint(20) DEFAULT NULL,
  `imageURL` varchar(512) DEFAULT NULL,
  `msTheme_id` bigint(20) DEFAULT NULL,
  `businessName` varchar(128) DEFAULT NULL,
  `email` varchar(384) DEFAULT NULL,
  `facebookId` varchar(128) DEFAULT NULL,
  `twitterId` varchar(128) DEFAULT NULL,
  `businessClickURL` varchar(512) DEFAULT NULL,
  `longDescription` varchar(5000) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `seoDesc` varchar(255) DEFAULT NULL,
  `seoKeywords` varchar(255) DEFAULT NULL,
  `domainName` varchar(512) DEFAULT NULL,
  `awards` varchar(312) DEFAULT NULL,
  `certifications` varchar(312) DEFAULT NULL,
  `paymentTypes` varchar(255) DEFAULT NULL,
  `primaryCategory_id` bigint(20) DEFAULT NULL,
  `secondaryCategory_id` bigint(20) DEFAULT NULL,
  `domainExpiration` varchar(12) DEFAULT NULL,
  `disclaimerHeader` varchar(500) DEFAULT NULL,
  `disclaimerFooter` varchar(1000) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `hideAdditionalLocations` tinyint(4) DEFAULT '0',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(4) DEFAULT '0',
  `locationType` tinyint(4) DEFAULT '0',
  `locationFeedSource` tinyint(4) DEFAULT NULL,
  `dst_brands` text,
  `dst_tags` text,
  `config` mediumtext,
  `config_checksum` varchar(128) DEFAULT NULL,
  `upc` text,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_MobileSite_Account_new` (`account_id`),
  KEY `fk_MobileSite_MSTemplate_new` (`msTemplate_id`),
  KEY `fk_MobileSite_MSTheme_new` (`msTheme_id`),
  KEY `fk_MobileSite_primaryCategory_new` (`primaryCategory_id`),
  KEY `fk_MobileSite_secondaryCategory_new` (`secondaryCategory_id`),
  KEY `fk_MobileSite_MSTemplateContent_new` (`msTemplateContent_id`),
  KEY `ix_mobilesite_dst_brands` (`dst_brands`(1))
) ENGINE=InnoDB AUTO_INCREMENT=2022130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mslink`
--

DROP TABLE IF EXISTS `mslink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mslink` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobileSite_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `clickURL` varchar(512) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_MSLink_MobileSite_new` (`mobileSite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=948350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mslocation`
--

DROP TABLE IF EXISTS `mslocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mslocation` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobileSite_id` bigint(20) DEFAULT NULL,
  `specialOffer_id` bigint(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `overrideCTN` varchar(45) DEFAULT NULL,
  `hoursOfOperation` text,
  `hoursOfOperationText` varchar(512) DEFAULT NULL,
  `specialities` varchar(512) DEFAULT NULL,
  `locationName` varchar(128) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL,
  `lat` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `vanityPhone` varchar(45) DEFAULT NULL,
  `hideAddress` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(4) DEFAULT '0',
  `locationStatus` tinyint(4) DEFAULT '0',
  `geocodeAttempted` tinyint(4) NOT NULL DEFAULT '0',
  `needsNewPasses` tinyint(4) NOT NULL DEFAULT '0',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `brand_id` int(11) DEFAULT '0',
  `poi_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_MSLocation_MobileSite_new` (`mobileSite_id`),
  KEY `fk_MSLocation_MSSpecialOffer_new` (`specialOffer_id`),
  KEY `mslocation_latitude_idx` (`latitude`),
  KEY `mslocation_longitude_idx` (`longitude`),
  KEY `MSLocation_needsNewPasses_idx` (`needsNewPasses`),
  KEY `MSLocation_geocodeAttempted` (`geocodeAttempted`),
  KEY `mslocation_updatedDate_idx` (`updatedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=184947975 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msspecialoffer`
--

DROP TABLE IF EXISTS `msspecialoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msspecialoffer` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `offerTitle` varchar(512) DEFAULT NULL,
  `offerDescription` varchar(2048) DEFAULT NULL,
  `imageURL` varchar(512) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23652220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstemplate`
--

DROP TABLE IF EXISTS `mstemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstemplatecontent`
--

DROP TABLE IF EXISTS `mstemplatecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstemplatecontent` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mstheme`
--

DROP TABLE IF EXISTS `mstheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bgColor_id` bigint(20) DEFAULT NULL,
  `themeColor_id` bigint(20) DEFAULT NULL,
  `titleFont_id` bigint(20) DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osversions`
--

DROP TABLE IF EXISTS `osversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osversions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `targetingValue` varchar(32) NOT NULL DEFAULT '',
  `displayName` varchar(64) NOT NULL DEFAULT '',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `parentVersion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbound_segment`
--

DROP TABLE IF EXISTS `outbound_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_segment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(1024) NOT NULL,
  `type` varchar(256) NOT NULL,
  `xad_id` bigint(20) NOT NULL,
  `user_count` bigint(20) DEFAULT '0',
  `partner_segment_id` varchar(1024) DEFAULT NULL,
  `partner_segment_name` varchar(1024) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_id` varchar(256) DEFAULT NULL,
  `account_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84945 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `sic_codes` varchar(512) NOT NULL DEFAULT '',
  `radius` double NOT NULL DEFAULT '0.5',
  `floor_price` varchar(6) NOT NULL DEFAULT '2.75',
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parsedsegmentfiles`
--

DROP TABLE IF EXISTS `parsedsegmentfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parsedsegmentfiles` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `segmentFile_id` bigint(20) DEFAULT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `errorMessage` text,
  `lastParsedLocalFilePath` text,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `segmentFile_id_new` (`segmentFile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3549190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passbookpass`
--

DROP TABLE IF EXISTS `passbookpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passbookpass` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobileSite_id` bigint(20) NOT NULL,
  `lastLocation_id` bigint(20) DEFAULT NULL,
  `buildNeeded` tinyint(4) NOT NULL DEFAULT '1',
  `serialNumber` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(256) NOT NULL DEFAULT '',
  `logoImage` longblob,
  `iconImage` longblob,
  `stripImage` longblob,
  `businessName` varchar(256) NOT NULL DEFAULT '',
  `arrivalText` varchar(256) NOT NULL DEFAULT '',
  `bgColor` varchar(32) NOT NULL DEFAULT '',
  `barcodeType` tinyint(4) NOT NULL,
  `barcodeMessageEncoding` tinyint(4) NOT NULL,
  `barcodeMessage` varchar(256) NOT NULL DEFAULT '',
  `barcodeAlternateMessage` varchar(256) DEFAULT NULL,
  `offerFieldType` tinyint(4) NOT NULL,
  `offerValue` varchar(128) DEFAULT '',
  `offerLabel` varchar(256) DEFAULT NULL,
  `offerCurrencySymbol` varchar(8) DEFAULT NULL,
  `offerDateStyle` tinyint(4) DEFAULT NULL,
  `offerTimeStyle` tinyint(4) DEFAULT NULL,
  `offerNumberStyle` tinyint(4) DEFAULT NULL,
  `offerIsRelativeDate` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `expiryDate` datetime DEFAULT NULL,
  `expiryDateStyle` tinyint(4) NOT NULL,
  `expiryIsRelativeDate` tinyint(4) DEFAULT '0',
  `logoImageURL` varchar(512) DEFAULT NULL,
  `iconImageURL` varchar(512) DEFAULT NULL,
  `stripImageURL` varchar(512) DEFAULT NULL,
  `foregroundColor` varchar(32) NOT NULL DEFAULT '',
  `labelColor` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `serialNumber_new` (`serialNumber`,`tenant_id`),
  KEY `mobileSite_id_new` (`mobileSite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passbooks`
--

DROP TABLE IF EXISTS `passbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passbooks` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobileSite_id` bigint(20) NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `serialNumber` varchar(64) NOT NULL,
  `passConfig` text NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `serialNumber_UNIQUE_new` (`serialNumber`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pixels`
--

DROP TABLE IF EXISTS `pixels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pixels` (
  `tenant_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) DEFAULT NULL,
  `alias` varchar(128) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  `website_url` varchar(256) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `segment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id_idx` (`account_id`),
  KEY `campaign_id_idx` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164590 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pmpexception`
--

DROP TABLE IF EXISTS `pmpexception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmpexception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_channel_id` bigint(20) NOT NULL,
  `pub_id` bigint(20) NOT NULL,
  `dataCenter` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proximity_modes`
--

DROP TABLE IF EXISTS `proximity_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proximity_modes` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `imageUrl` varchar(256) DEFAULT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `xadId` int(11) DEFAULT NULL,
  `appid` varchar(45) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(127) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `tier` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) DEFAULT NULL,
  `bidRates` varchar(256) DEFAULT NULL,
  `externalPub_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `isIurlRequired` tinyint(1) DEFAULT NULL,
  `spendPriority` tinyint(4) NOT NULL DEFAULT '0',
  `audienceCollectionMode` tinyint(4) DEFAULT '0',
  `highPriorityKPIPercentage` tinyint(4) NOT NULL DEFAULT '100',
  `api_response_bid` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'option to exclude bid price info from search API responses',
  `isNurlSupported` tinyint(4) NOT NULL DEFAULT '1',
  `isOverDraft` tinyint(1) NOT NULL DEFAULT '0',
  `currency` char(3) NOT NULL DEFAULT 'USD' COMMENT 'currency of data_center country',
  `data_center` char(2) NOT NULL DEFAULT 'US' COMMENT 'country code of the data source',
  `access_key` varchar(255) DEFAULT NULL,
  `pub_type` varchar(10) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT '0',
  `defaultParams` varchar(5000) DEFAULT NULL,
  `isDataPartner` tinyint(1) NOT NULL DEFAULT '0',
  `pmpDisabled` tinyint(1) NOT NULL DEFAULT '0',
  `sensitivePublisher` tinyint(1) NOT NULL DEFAULT '0',
  `mult` float DEFAULT '1',
  `creative_approval_needed` tinyint(1) NOT NULL DEFAULT '0',
  `onlyPmp` tinyint(1) NOT NULL DEFAULT '0',
  `isPhoneRequired` tinyint(1) NOT NULL DEFAULT '0',
  `dexKwdMinScore` double NOT NULL DEFAULT '0',
  `cpm_threshold` float DEFAULT '0',
  `shareWithMeasurePartners` tinyint(1) DEFAULT '1',
  `shareWithAdvertisers` tinyint(1) DEFAULT '1',
  `trafficType` enum('search','exchange','direct','mediation','external platform') DEFAULT NULL,
  `canDeriveHomeAddress` tinyint(1) DEFAULT '0',
  `onlySelfServe` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL,
  `controller` tinyint(4) DEFAULT NULL,
  `is_pub_tenanted` tinyint(1) NOT NULL DEFAULT '0',
  `aes_password` varchar(64) NOT NULL,
  `cbd_supported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appid_UNIQUE` (`appid`),
  KEY `fk_publisher_publisher1_idx` (`parent_id`),
  KEY `ix_publisher_tenant_id` (`tenant_id`),
  CONSTRAINT `fk_publisher_publisher1` FOREIGN KEY (`parent_id`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_creative`
--

DROP TABLE IF EXISTS `publisher_creative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_creative` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `xad_creative_id` bigint(20) DEFAULT NULL,
  `publisher_creative_id` varchar(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `creative_status` varchar(20) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `publ_creative_ix1` (`xad_creative_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191407 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_dimension`
--

DROP TABLE IF EXISTS `publisher_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_dimension` (
  `publisher_id` bigint(20) NOT NULL DEFAULT '0',
  `publisher_appid` varchar(45) DEFAULT NULL,
  `publisher_name` varchar(256) DEFAULT NULL,
  `publisher_tier` varchar(10) DEFAULT NULL,
  `publisher_type` varchar(10) DEFAULT NULL,
  `external_publisher_id` bigint(20) DEFAULT NULL,
  `spend_priority` int(11) DEFAULT NULL,
  `audience_collection_mode` int(11) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `data_center` varchar(2) DEFAULT NULL,
  `is_data_partner` smallint(6) DEFAULT NULL,
  `only_pmp` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_discrepancy_threshold`
--

DROP TABLE IF EXISTS `publisher_discrepancy_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_discrepancy_threshold` (
  `pub_id` bigint(20) NOT NULL,
  `spend_threshold` float DEFAULT NULL,
  `impression_threshold` float DEFAULT NULL,
  PRIMARY KEY (`pub_id`),
  CONSTRAINT `publisher_discrepancy_threshold_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_httpvendor`
--

DROP TABLE IF EXISTS `publisher_httpvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_httpvendor` (
  `publisher_id` int(8) NOT NULL,
  `httpvendor_id` int(8) NOT NULL,
  `publisher_uid` varchar(100) NOT NULL COMMENT 'Identifier of the publisher for this httpvendor',
  `publisher_desc` varchar(100) NOT NULL COMMENT 'Description of identifier for this httpvendor',
  `result_priority` int(4) NOT NULL DEFAULT '0' COMMENT 'Greater values are more likely to return an ad for this httpvendor',
  `result_weave_size` int(4) NOT NULL DEFAULT '1' COMMENT 'Results are interweaved a fixed number of results at a time in order of priority',
  `daily_spend_limit` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit for this publisher/httpvendor combination in US $',
  `daily_spend_limit_per_ad` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit per adgroup for this publisher/httpvendor combination in US $',
  `publisher_uid_alt1` varchar(100) DEFAULT NULL COMMENT 'Alternative identifier of the publisher for this httpvendor',
  `disabled_at` timestamp NULL DEFAULT NULL COMMENT 'set to the current time (or any value) to disable an adsource on a publisher',
  `bidFloor` varchar(256) DEFAULT NULL,
  `marchex_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`,`httpvendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Define all sources of search ad results for each publisher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_httpvendor_bkp`
--

DROP TABLE IF EXISTS `publisher_httpvendor_bkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_httpvendor_bkp` (
  `publisher_id` int(8) NOT NULL,
  `httpvendor_id` int(8) NOT NULL,
  `publisher_uid` varchar(100) NOT NULL COMMENT 'Identifier of the publisher for this httpvendor',
  `publisher_desc` varchar(100) NOT NULL COMMENT 'Description of identifier for this httpvendor',
  `result_priority` int(4) NOT NULL DEFAULT '0' COMMENT 'Greater values are more likely to return an ad for this httpvendor',
  `result_weave_size` int(4) NOT NULL DEFAULT '1' COMMENT 'Results are interweaved a fixed number of results at a time in order of priority',
  `daily_spend_limit` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit for this publisher/httpvendor combination in US $',
  `daily_spend_limit_per_ad` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit per adgroup for this publisher/httpvendor combination in US $',
  `publisher_uid_alt1` varchar(100) DEFAULT NULL COMMENT 'Alternative identifier of the publisher for this httpvendor',
  `disabled_at` timestamp NULL DEFAULT NULL COMMENT 'set to the current time (or any value) to disable an adsource on a publisher',
  `bidFloor` varchar(256) DEFAULT NULL,
  `marchex_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`,`httpvendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Define all sources of search ad results for each publisher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_httpvendor_tmp`
--

DROP TABLE IF EXISTS `publisher_httpvendor_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_httpvendor_tmp` (
  `publisher_id` int(8) NOT NULL,
  `httpvendor_id` int(8) NOT NULL,
  `publisher_uid` varchar(100) NOT NULL COMMENT 'Identifier of the publisher for this httpvendor',
  `publisher_desc` varchar(100) NOT NULL COMMENT 'Description of identifier for this httpvendor',
  `result_priority` int(4) NOT NULL DEFAULT '0' COMMENT 'Greater values are more likely to return an ad for this httpvendor',
  `result_weave_size` int(4) NOT NULL DEFAULT '1' COMMENT 'Results are interweaved a fixed number of results at a time in order of priority',
  `daily_spend_limit` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit for this publisher/httpvendor combination in US $',
  `daily_spend_limit_per_ad` decimal(8,2) DEFAULT NULL COMMENT 'Spend limit per adgroup for this publisher/httpvendor combination in US $',
  `publisher_uid_alt1` varchar(100) DEFAULT NULL COMMENT 'Alternative identifier of the publisher for this httpvendor',
  `disabled_at` timestamp NULL DEFAULT NULL COMMENT 'set to the current time (or any value) to disable an adsource on a publisher',
  `bidFloor` varchar(256) DEFAULT NULL,
  `marchex_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`,`httpvendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Define all sources of search ad results for each publisher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publisher_vendor_config`
--

DROP TABLE IF EXISTS `publisher_vendor_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_vendor_config` (
  `Publisher` varchar(100) NOT NULL DEFAULT '',
  `TrafficSRC` varchar(100) NOT NULL DEFAULT '',
  `Vendor` varchar(100) NOT NULL DEFAULT '',
  `Property` varchar(100) NOT NULL DEFAULT '',
  `Value` varchar(100) NOT NULL DEFAULT '',
  `Country` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`Publisher`,`TrafficSRC`,`Vendor`,`Property`,`Value`,`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishersettings`
--

DROP TABLE IF EXISTS `publishersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishersettings` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) NOT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `bidRates` text,
  `exclude` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_PublisherSetting_Publisher1_new` (`publisher_id`),
  KEY `fk_PublisherSetting_AdGroup1_new` (`adGroup_id`),
  KEY `fk_publishersettings_account1_idx_new` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108979165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishervendorstats`
--

DROP TABLE IF EXISTS `publishervendorstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishervendorstats` (
  `tenant_id` int(11) NOT NULL,
  `pubid` bigint(20) NOT NULL DEFAULT '0',
  `vendorid` int(11) NOT NULL DEFAULT '0',
  `impressionRate` float DEFAULT NULL,
  PRIMARY KEY (`pubid`,`vendorid`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recently_updated_entities`
--

DROP TABLE IF EXISTS `recently_updated_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recently_updated_entities` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `type` varchar(32) NOT NULL,
  `status` tinyint(10) NOT NULL DEFAULT '0',
  `index_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`tenant_id`,`type`),
  KEY `fk_combo_search` (`id`,`tenant_id`,`type`,`status`),
  KEY `fk_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `replication_delay`
--

DROP TABLE IF EXISTS `replication_delay`;
/*!50001 DROP VIEW IF EXISTS `replication_delay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `replication_delay` AS SELECT
 1 AS `data_center`,
 1 AS `delay`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` ENUM('PENDING', 'ACTIVE', 'PAUSED', 'EXPIRED') NOT NULL DEFAULT 'PENDING',
  `report_type` varchar(64) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `period` ENUM('ONCE', 'DAILY', 'WEEKLY', 'MONTHLY') NOT NULL DEFAULT 'WEEKLY',
  `next_send_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `send_now` tinyint(1) NOT NULL DEFAULT 0,
  `last_request_msg_id` varchar(60) DEFAULT NULL,
  `last_request_time` timestamp NULL DEFAULT NULL,
  `last_receive_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REPORT_BY_TENANT_ID` (`tenant_id`,`del`),
  KEY `IDX_REPORT_BY_NEXT_SEND_DATE` (`next_send_date`,`start_date`,`del`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_entities`
--

DROP TABLE IF EXISTS `report_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_entities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL,
  `entity_type` int(11) unsigned NOT NULL,
  `entity_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REPORT_ENTITIES_BY_REPORT_ID` (`report_id`),
  FOREIGN KEY (`report_id`) REFERENCES reports(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_recipients`
--

DROP TABLE IF EXISTS `report_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REPORT_RECIPIENTS_BY_REPORT_ID` (`report_id`),
  FOREIGN KEY (`report_id`) REFERENCES reports(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rfp`
--

DROP TABLE IF EXISTS `rfp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) unsigned NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `comment` text,
  `contact_name` varchar(128) NOT NULL DEFAULT '',
  `contact_email` varchar(128) NOT NULL DEFAULT '',
  `contact_phone` varchar(32) NOT NULL DEFAULT '',
  `sales_rep_id` int(11) unsigned DEFAULT NULL,
  `account_manager_id` int(11) unsigned DEFAULT NULL,
  `campaign_manager_id` int(11) unsigned DEFAULT NULL,
  `winning_proposal_id` int(11) DEFAULT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_RFP_BY_TENANT_ID` (`tenant_id`,`del`),
  KEY `IDX_RFP_BY_ACCOUNT_ID` (`account_id`,`del`),
  KEY `IDX_RFP_BY_UPDATED_DATE` (`updated_date`),
  KEY `IDX_RFP_BY_WINNING_PROPOSAL_ID` (`winning_proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rfp_attachment`
--

DROP TABLE IF EXISTS `rfp_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfp_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rfp_id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `url` varchar(2048) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_RFP_ATTACHMENT_BY_RFP_ID` (`rfp_id`,`del`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `privilegeText` text NOT NULL,
  `editable` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesregions`
--

DROP TABLE IF EXISTS `salesregions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesregions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `region_name` varchar(200) NOT NULL DEFAULT '',
  `subregion_name` varchar(200) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_salesregions_User` (`user_id`),
  CONSTRAINT `fk_salesregions_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_creative`
--

DROP TABLE IF EXISTS `sample_creative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_creative` (
  `id` int(11) NOT NULL,
  `creativeType` varchar(45) NOT NULL,
  `creative` text,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segment`
--

DROP TABLE IF EXISTS `segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `segmentFile_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `sourceKey` varchar(1024) DEFAULT NULL,
  `entryCount` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `userStoreLastUploadDate` datetime DEFAULT NULL,
  `showInCab` tinyint(1) DEFAULT '0',
  `segmentQuery` mediumtext,
  `approxEntryCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `ix_segment_sourceKey` (`sourceKey`(255)),
  KEY `ix_segment_tenant_id_segmentFile_id` (`tenant_id`,`segmentFile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1789765 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segment_test`
--

DROP TABLE IF EXISTS `segment_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment_test` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `segmentFile_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `sourceKey` varchar(1024) DEFAULT NULL,
  `entryCount` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segmentfile`
--

DROP TABLE IF EXISTS `segmentfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmentfile` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `filename` varchar(512) DEFAULT NULL,
  `segmentProvider_id` bigint(20) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `datePatterning` tinyint(4) DEFAULT NULL,
  `parseStatus` tinyint(4) DEFAULT '0',
  `defaultSegmentname` varchar(64) DEFAULT NULL,
  `fileContentType` tinyint(4) DEFAULT '0',
  `s3UploadStatus` tinyint(4) DEFAULT NULL,
  `s3LastUploadDate` datetime DEFAULT NULL,
  `userStoreUploadStatus` tinyint(4) DEFAULT NULL,
  `userStoreLastUploadDate` datetime DEFAULT NULL,
  `is3rdParty` bit(1) NOT NULL DEFAULT b'1',
  `userStoreFirstUploadDate` datetime DEFAULT NULL,
  `segment_access_level` tinyint(4) DEFAULT 0,
  `s3DataUrl` text DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `segmentProvider_idx_new` (`segmentProvider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=578940 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segmentprovider`
--

DROP TABLE IF EXISTS `segmentprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmentprovider` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `direct` bit(1) NOT NULL DEFAULT b'0',
  `ftpHost` varchar(256) DEFAULT NULL,
  `ftpPath` varchar(256) DEFAULT NULL,
  `ftpPort` int(11) DEFAULT NULL,
  `ftpUserName` varchar(128) DEFAULT NULL,
  `ftpPassword` varchar(128) DEFAULT NULL,
  `fileUpdateType` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `sourceType` tinyint(4) DEFAULT NULL,
  `updateFreqType` tinyint(4) DEFAULT '0',
  `sourceKeyTargeting` tinyint(4) DEFAULT '0',
  `isCabGenerated` tinyint(4) NOT NULL DEFAULT '0',
  `providerType` enum('groundtruth','billboard','adobe','bluekai') NOT NULL DEFAULT 'groundtruth',
  PRIMARY KEY (`id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `segmentsource`
--

DROP TABLE IF EXISTS `segmentsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmentsource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_key` varchar(1024) NOT NULL,
  `segment_subprovider` varchar(256) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `siccodes`
--

DROP TABLE IF EXISTS `siccodes`;
/*!50001 DROP VIEW IF EXISTS `siccodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `siccodes` AS SELECT
 1 AS `id`,
 1 AS `sicCode`,
 1 AS `name`,
 1 AS `parent_id`,
 1 AS `del`,
 1 AS `updatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `siccodes_old`
--

DROP TABLE IF EXISTS `siccodes_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siccodes_old` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sicCode` varchar(8) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `siccodes_old_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `siccodes_old` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spent_rate`
--

DROP TABLE IF EXISTS `spent_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spent_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `camp_id` bigint(20) DEFAULT NULL,
  `adgroup_id` bigint(20) DEFAULT NULL,
  `spent_rate` float DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `entityType` tinyint(4) NOT NULL,
  `del` tinyint(4) DEFAULT '0',
  `multiplier` float DEFAULT NULL,
  `ss_spent_rate` float DEFAULT NULL,
  `adreqper` tinyint(4) DEFAULT '100',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spent_rate_unq` (`adgroup_id`,`camp_id`,`entityType`),
  KEY `camp_ent_ix` (`camp_id`,`entityType`)
) ENGINE=InnoDB AUTO_INCREMENT=4930445435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spent_rate_temp`
--

DROP TABLE IF EXISTS `spent_rate_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spent_rate_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `camp_id` bigint(20) DEFAULT NULL,
  `adgroup_id` bigint(20) DEFAULT NULL,
  `spent_rate` float DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `entityType` tinyint(4) NOT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spent_rate_temp_uq` (`adgroup_id`,`camp_id`,`entityType`),
  KEY `camp_ent_ix_temp` (`camp_id`,`entityType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storm_backlog_delay`
--

DROP TABLE IF EXISTS `storm_backlog_delay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storm_backlog_delay` (
  `cluster_name` varchar(128) NOT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cluster_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suggest_cpv_price`
--

DROP TABLE IF EXISTS `suggest_cpv_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggest_cpv_price` (
  `entity_id` int(11) NOT NULL,
  `entity_type` tinyint(4) NOT NULL DEFAULT '1',
  `suggested_price_usd` double DEFAULT '0',
  PRIMARY KEY (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_list`
--

DROP TABLE IF EXISTS `sync_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_list` (
  `table_name` varchar(100) NOT NULL DEFAULT '',
  `sync_query` varchar(4000) DEFAULT NULL,
  `sync_where` varchar(100) DEFAULT NULL,
  `primary_key` varchar(100) DEFAULT NULL,
  `last_start` datetime DEFAULT NULL,
  `last_end` datetime DEFAULT NULL,
  `total_rows` int(11) DEFAULT NULL,
  `sync_rows` int(11) DEFAULT NULL,
  `info` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `config_key` varchar(255) NOT NULL DEFAULT '',
  `config_value` text NOT NULL,
  PRIMARY KEY (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_macros`
--

DROP TABLE IF EXISTS `system_macros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_macros` (
  `macro` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(256) DEFAULT NULL,
  `system` varchar(11) DEFAULT NULL,
  `allowed_in_content` int(11) NOT NULL DEFAULT '1',
  `label` varchar(128) NOT NULL,
  `sample` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `targetprofile`
--

DROP TABLE IF EXISTS `targetprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targetprofile` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(4) NOT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `exclude` tinyint(4) DEFAULT '0',
  `constraints` longtext,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_MtargetProfile_AdGroup` (`adGroup_id`,`tenant_id`),
  KEY `fk_MtargetProfile_Campaign` (`campaign_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4958630 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telemetricsidentifier`
--

DROP TABLE IF EXISTS `telemetricsidentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetricsidentifier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityId` bigint(20) DEFAULT NULL,
  `entityType` tinyint(4) DEFAULT NULL,
  `telemetricsId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_ids`
--

DROP TABLE IF EXISTS `temp_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_ids` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adGroup_id` bigint(20) DEFAULT NULL,
  `keywords_id` bigint(20) DEFAULT NULL,
  `rawText` varchar(140) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `bidRate` varchar(255) DEFAULT NULL,
  `exclude` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_Term_Keywords_new` (`keywords_id`),
  KEY `term_adGroup_status_exclude_del_idx_new` (`adGroup_id`,`status`,`exclude`,`del`)
) ENGINE=InnoDB AUTO_INCREMENT=1034767530 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tier_attribute_multipliers`
--

DROP TABLE IF EXISTS `tier_attribute_multipliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tier_attribute_multipliers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attr_key` varchar(10) DEFAULT NULL,
  `attr_value` varchar(20) DEFAULT NULL,
  `multiplier` double DEFAULT '1',
  `type` tinyint(4) DEFAULT '0',
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `adgroup_type` tinyint(4) DEFAULT '0' COMMENT 'Same as type. (Display = 0)/(Search = 1)',
  `value_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'multiplayer/absolute, 0 - multiplayer',
  `value` double DEFAULT '1' COMMENT 'mult or abs value - based on value_type',
  `currency` char(3) NOT NULL DEFAULT 'USD',
  `bid_cap` float DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `key_val_type_uk` (`attr_key`,`attr_value`,`value_type`,`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tierbidsettings`
--

DROP TABLE IF EXISTS `tierbidsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tierbidsettings` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `bidType` varchar(16) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `maxBid` double DEFAULT NULL,
  `lowBidPercent` double DEFAULT NULL,
  `market` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `currency` char(3) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiersettings`
--

DROP TABLE IF EXISTS `tiersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiersettings` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `adgroup_id` bigint(20) DEFAULT NULL,
  `bidRates` varchar(256) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `includeAllPublishers` tinyint(4) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_TierSettings_AdGroup1_new` (`adgroup_id`),
  KEY `fk_tiersettings_account1_idx_new` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4536705 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezone_map`
--

DROP TABLE IF EXISTS `timezone_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zip_UNIQUE` (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttd_adgroup`
--

DROP TABLE IF EXISTS `ttd_adgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttd_adgroup` (
  `ttd_adgroup_id` varchar(45) NOT NULL,
  `ttd_campaign_id` varchar(45) NOT NULL,
  `ttd_campaign_flight_id` varchar(45) DEFAULT NULL,
  `ttd_audience_id` varchar(45) DEFAULT NULL,
  `ttd_data_group_id` varchar(45) DEFAULT NULL,
  `ttd_first_party_id` varchar(45) DEFAULT NULL,
  `gt_adgroup_id` bigint(20) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ttd_start_date` date DEFAULT NULL,
  `ttd_end_date` date DEFAULT NULL,
  `ttd_budget` double DEFAULT NULL,
  `ad_environment_bid_list_id` varchar(45) DEFAULT NULL,
  `device_type_bid_list_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ttd_adgroup_id`,`gt_adgroup_id`),
  KEY `gt_adgroup_id` (`gt_adgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttd_creative`
--

DROP TABLE IF EXISTS `ttd_creative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttd_creative` (
  `ttd_creative_id` varchar(45) NOT NULL,
  `gt_creative_id` bigint(20) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ttd_image_url` text,
  `ttd_click_through_url` text,
  `ttd_external_urls` text,
  PRIMARY KEY (`ttd_creative_id`,`gt_creative_id`),
  KEY `gt_creative_id` (`gt_creative_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unique_admarkup`
--

DROP TABLE IF EXISTS `unique_admarkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_admarkup` (
  `demand_partner` varchar(64) NOT NULL,
  `campaign_id` varchar(64) NOT NULL,
  `adgroup_id` varchar(64) NOT NULL,
  `creative_id` varchar(64) NOT NULL,
  `admarkup` text NOT NULL,
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`demand_partner`,`campaign_id`,`adgroup_id`,`creative_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `managing_company_id` bigint(20) DEFAULT '1',
  `firstLogin` datetime DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `username` varchar(384) DEFAULT NULL COMMENT '	',
  `password` varchar(384) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `firstName` varchar(64) DEFAULT NULL,
  `middleName` varchar(64) DEFAULT NULL,
  `lastName` varchar(64) DEFAULT NULL,
  `workPhone` varchar(32) DEFAULT NULL,
  `mobilePhone` varchar(32) DEFAULT NULL,
  `homePhone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `email` varchar(384) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `token` varchar(256) DEFAULT NULL,
  `mustResetPassword` tinyint(4) DEFAULT '0',
  `passwordUpdated` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `photo_url` varchar(512) DEFAULT NULL,
  `authorized_apps` varchar(64) NOT NULL DEFAULT 'XC',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_ManagingCompany_idx` (`managing_company_id`),
  CONSTRAINT `fk_User_ManagingCompany` FOREIGN KEY (`managing_company_id`) REFERENCES `managing_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `feedConfig_id` bigint(20) DEFAULT NULL,
  `mobileSite_id` bigint(20) DEFAULT NULL,
  `del` tinyint(4) DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_UserRole_Company_new` (`company_id`),
  KEY `fk_UserRole_Account_new` (`account_id`),
  KEY `fk_UserRole_Campaign_new` (`campaign_id`),
  KEY `fk_UserRole_User_new` (`user_id`),
  KEY `fk_UserRole_Role1_new` (`role_id`),
  KEY `fk_UserRole_MobileSite1_new` (`mobileSite_id`),
  KEY `fk_feedConfig_id_new` (`feedConfig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=791425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usertask`
--

DROP TABLE IF EXISTS `usertask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertask` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `objectType` varchar(128) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `taskType` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `description` text,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  KEY `fk_usernotification_user1_idx_new` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333775 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendoridentifier`
--

DROP TABLE IF EXISTS `vendoridentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendoridentifier` (
  `tenant_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `adkey` varchar(128) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  `objectType` varchar(45) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tenant_id`),
  UNIQUE KEY `acct_objtype_objid_new` (`account_id`,`objectType`,`objectId`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=629447 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wificarriercountries`
--

DROP TABLE IF EXISTS `wificarriercountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wificarriercountries` (
  `country_id` int(11) unsigned NOT NULL DEFAULT '0',
  `wificarrier_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`,`wificarrier_id`),
  KEY `carrier_id` (`wificarrier_id`),
  CONSTRAINT `wificarriercountries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wificarriercountries_ibfk_2` FOREIGN KEY (`wificarrier_id`) REFERENCES `wificarriers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wificarriers`
--

DROP TABLE IF EXISTS `wificarriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wificarriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL DEFAULT '',
  `displayName` varchar(128) NOT NULL DEFAULT '',
  `aliases` longtext,
  `del` tinyint(4) NOT NULL DEFAULT '0',
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xadcms.timezone_map`
--

DROP TABLE IF EXISTS `xadcms.timezone_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadcms.timezone_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zip_UNIQUE` (`zip`)
) ENGINE=InnoDB AUTO_INCREMENT=313839 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xadcms_changelog`
--

DROP TABLE IF EXISTS `xadcms_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadcms_changelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objectType` varchar(45) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  `objectName` longtext,
  `property` varchar(255) DEFAULT NULL,
  `oldValue` longtext,
  `newValue` longtext,
  `modified_id` bigint(20) NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL,
  `ipAddress` varchar(64) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `adgroup_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xadcms_changelog_user` (`user_id`),
  KEY `idx_xadcms_changelog_object` (`objectType`,`objectId`),
  KEY `idx_xadcms_changelog_property` (`objectType`,`objectId`,`property`),
  KEY `idx_xadcms_changelog_date` (`updatedDate`),
  KEY `idx_xadcms_changelog_modid` (`objectType`,`modified_id`),
  KEY `ix_xadcms_changelog__tenant_id_campaign_id` (`tenant_id`,`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21178445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mincpvpricing`
--

DROP TABLE IF EXISTS `mincpvpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mincpvpricing` (
  `account_id` bigint(20) NOT NULL,
  `account_vertical` int(11) NOT NULL,
  `minCPVPricing` double DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sm_footprints`
--

DROP TABLE IF EXISTS `sm_footprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm_footprints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT ,
  `user_id` bigint(20) UNIQUE,
  `last_used_tenant_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
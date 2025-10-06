-- prod.activity_log definition

CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`),
  CONSTRAINT `activity_log_chk_1` CHECK (json_valid(`properties`))
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.admins definition

CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_addresses definition

CREATE TABLE `asset_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_insurance_type definition

CREATE TABLE `asset_insurance_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_types definition

CREATE TABLE `asset_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_ltv` double(22,4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.attribute_entities definition

CREATE TABLE `attribute_entities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_entities_name_unique` (`name`),
  UNIQUE KEY `attribute_entities_class_unique` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.attribute_types definition

CREATE TABLE `attribute_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_system_type` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.bank_details definition

CREATE TABLE `bank_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sort_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.bridge_drawdown_types definition

CREATE TABLE `bridge_drawdown_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.charge_types definition

CREATE TABLE `charge_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_form_status definition

CREATE TABLE `client_form_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.companies definition

CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.currencies definition

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_aborted_reasons definition

CREATE TABLE `deal_aborted_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_document_risk definition

CREATE TABLE `deal_document_risk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_statuses definition

CREATE TABLE `deal_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_types definition

CREATE TABLE `deal_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.document_types definition

CREATE TABLE `document_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_event_amount_type definition

CREATE TABLE `drawdown_event_amount_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_event_status definition

CREATE TABLE `drawdown_event_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_status definition

CREATE TABLE `drawdown_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.failed_jobs definition

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.fee_options definition

CREATE TABLE `fee_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.fee_status definition

CREATE TABLE `fee_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.fee_type definition

CREATE TABLE `fee_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_value_flat` double(22,4) DEFAULT NULL,
  `default_value_perc` double(8,2) DEFAULT NULL,
  `not_deletable` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.form_types definition

CREATE TABLE `form_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.guarantor_corporates definition

CREATE TABLE `guarantor_corporates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guarantor_corporates_company_number_unique` (`company_number`),
  UNIQUE KEY `guarantor_corporates_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.guarantor_individuals definition

CREATE TABLE `guarantor_individuals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_right_to_reside` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_history` json DEFAULT NULL,
  `ppsn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guarantor_individuals_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.guarantor_type definition

CREATE TABLE `guarantor_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.interest_calculation_types definition

CREATE TABLE `interest_calculation_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.interest_subtypes definition

CREATE TABLE `interest_subtypes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.interest_types definition

CREATE TABLE `interest_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.introducer_type definition

CREATE TABLE `introducer_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.jobs definition

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=4627 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.lending_types definition

CREATE TABLE `lending_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.loan_calculation_method definition

CREATE TABLE `loan_calculation_method` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.marital_statuses definition

CREATE TABLE `marital_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.marketing_sources definition

CREATE TABLE `marketing_sources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.migrations definition

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.name_titles definition

CREATE TABLE `name_titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.order_statuses definition

CREATE TABLE `order_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.ownership_types definition

CREATE TABLE `ownership_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.password_resets definition

CREATE TABLE `password_resets` (
  `my_row_id` bigint unsigned NOT NULL AUTO_INCREMENT /*!80023 INVISIBLE */,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`my_row_id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.payment_providers definition

CREATE TABLE `payment_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.payments definition

CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `base_cost` double(20,0) DEFAULT NULL,
  `vat_rate` double(22,4) DEFAULT NULL,
  `gross_total` double(22,4) DEFAULT NULL,
  `charge_outcome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.permission_category definition

CREATE TABLE `permission_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_category_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.permission_groups definition

CREATE TABLE `permission_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.personal_access_tokens definition

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.profile_approval_status definition

CREATE TABLE `profile_approval_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.provider_types definition

CREATE TABLE `provider_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.purpose_credit_types definition

CREATE TABLE `purpose_credit_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.quotes_status definition

CREATE TABLE `quotes_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.roles definition

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.sharepoint_updates_timestamps definition

CREATE TABLE `sharepoint_updates_timestamps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `change_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=559033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.stripe_settings definition

CREATE TABLE `stripe_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_webhook_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.systems_deal_setting_groups definition

CREATE TABLE `systems_deal_setting_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.use_type definition

CREATE TABLE `use_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.user_types definition

CREATE TABLE `user_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_types_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.valuation_statuses definition

CREATE TABLE `valuation_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.variable_rate_settings definition

CREATE TABLE `variable_rate_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.variable_rate_sources definition

CREATE TABLE `variable_rate_sources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.addresses definition

CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ownership_type_id` bigint unsigned DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lived_for_months` int DEFAULT NULL,
  `lived_for_years` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_addresses_ownership_type_id_foreign` (`ownership_type_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`ownership_type_id`) REFERENCES `ownership_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.attribute_groups definition

CREATE TABLE `attribute_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_entity_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_name_unique` (`name`),
  KEY `attribute_groups_attribute_entity_id_foreign` (`attribute_entity_id`),
  CONSTRAINT `attribute_groups_ibfk_1` FOREIGN KEY (`attribute_entity_id`) REFERENCES `attribute_entities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.`attributes` definition

CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `attribute_group_id` bigint unsigned NOT NULL,
  `attribute_type_id` bigint unsigned NOT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_system_attribute` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributes_attribute_group_id_foreign` (`attribute_group_id`),
  KEY `attributes_attribute_type_id_foreign` (`attribute_type_id`),
  CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attributes_ibfk_2` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.brokers definition

CREATE TABLE `brokers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_rate` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `engagement_letter` date DEFAULT NULL,
  `address_id` bigint unsigned DEFAULT NULL,
  `landline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secondary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details_id` bigint unsigned DEFAULT NULL,
  `point_of_contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brokers_address_id_foreign` (`address_id`),
  KEY `brokers_bank_details_id_foreign` (`bank_details_id`),
  CONSTRAINT `brokers_bank_details_id_foreign` FOREIGN KEY (`bank_details_id`) REFERENCES `bank_details` (`id`),
  CONSTRAINT `brokers_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_companies definition

CREATE TABLE `client_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint unsigned DEFAULT NULL,
  `landline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bank_details_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_companies_company_id_foreign` (`company_id`),
  KEY `client_companies_address_id_foreign` (`address_id`),
  KEY `client_companies_bank_details_id_foreign` (`bank_details_id`),
  CONSTRAINT `client_companies_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `client_companies_ibfk_2` FOREIGN KEY (`bank_details_id`) REFERENCES `bank_details` (`id`),
  CONSTRAINT `client_companies_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_groups definition

CREATE TABLE `client_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `landline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address_id` bigint unsigned DEFAULT NULL,
  `bank_details_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_groups_company_id_foreign` (`company_id`),
  KEY `client_groups_address_id_foreign` (`address_id`),
  KEY `client_groups_bank_details_id_foreign` (`bank_details_id`),
  CONSTRAINT `client_groups_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `client_groups_ibfk_2` FOREIGN KEY (`bank_details_id`) REFERENCES `bank_details` (`id`),
  CONSTRAINT `client_groups_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.documents definition

CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_event_type definition

CREATE TABLE `drawdown_event_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `drawdown_event_amount_type_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enabled_to_schedule_before` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `drawdown_event_type_drawdown_event_amount_type_id_foreign` (`drawdown_event_amount_type_id`),
  CONSTRAINT `drawdown_event_type_ibfk_1` FOREIGN KEY (`drawdown_event_amount_type_id`) REFERENCES `drawdown_event_amount_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.fee_type_lending_type definition

CREATE TABLE `fee_type_lending_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fee_type_id` bigint unsigned NOT NULL,
  `lending_type_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fee_type_lending_type_fee_type_id_lending_type_id_unique` (`fee_type_id`,`lending_type_id`),
  KEY `fee_type_lending_type_lending_type_id_foreign` (`lending_type_id`),
  CONSTRAINT `fee_type_lending_type_fee_type_id_foreign` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_type_lending_type_lending_type_id_foreign` FOREIGN KEY (`lending_type_id`) REFERENCES `lending_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.introducers definition

CREATE TABLE `introducers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `introducer_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `introducers_introducer_type_id_foreign` (`introducer_type_id`),
  CONSTRAINT `introducers_ibfk_1` FOREIGN KEY (`introducer_type_id`) REFERENCES `introducer_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=972 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.lenders definition

CREATE TABLE `lenders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `historical` int NOT NULL DEFAULT '0',
  `stripe_settings_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lenders_stripe_settings_id_foreign` (`stripe_settings_id`),
  CONSTRAINT `lenders_stripe_settings_id_foreign` FOREIGN KEY (`stripe_settings_id`) REFERENCES `stripe_settings` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.model_has_roles definition

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.payment_attempts definition

CREATE TABLE `payment_attempts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint unsigned NOT NULL,
  `amount` decimal(22,4) DEFAULT NULL,
  `status` int NOT NULL,
  `error_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  `payment_intent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_attempts_payment_id_foreign` (`payment_id`),
  KEY `payment_attempts_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payment_attempts_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `payment_attempts_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_providers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.permissions definition

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_category_id` bigint unsigned DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  KEY `permissions_permission_category_id_foreign` (`permission_category_id`),
  KEY `permissions_parent_id_foreign` (`parent_id`),
  CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_permission_category_id_foreign` FOREIGN KEY (`permission_category_id`) REFERENCES `permission_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.role_has_permissions definition

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.service_providers definition

CREATE TABLE `service_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `provider_type_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engagement_letter` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_providers_provider_type_id_foreign` (`provider_type_id`),
  CONSTRAINT `service_providers_ibfk_1` FOREIGN KEY (`provider_type_id`) REFERENCES `provider_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1829 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.systems_deal_setting definition

CREATE TABLE `systems_deal_setting` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `systems_deal_setting_group_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `systems_deal_setting_systems_deal_setting_group_id_foreign` (`systems_deal_setting_group_id`),
  CONSTRAINT `systems_deal_setting_ibfk_1` FOREIGN KEY (`systems_deal_setting_group_id`) REFERENCES `systems_deal_setting_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.task_group definition

CREATE TABLE `task_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lending_type_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_group_lending_type_id_foreign` (`lending_type_id`),
  CONSTRAINT `task_group_lending_type_id_foreign` FOREIGN KEY (`lending_type_id`) REFERENCES `lending_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.variable_rates definition

CREATE TABLE `variable_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variable_rate_source_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `rate` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variable_rates_variable_rate_source_id_foreign` (`variable_rate_source_id`),
  KEY `variable_rates_parent_id_foreign` (`parent_id`),
  CONSTRAINT `variable_rates_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `variable_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variable_rates_ibfk_2` FOREIGN KEY (`variable_rate_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.variable_rates_history definition

CREATE TABLE `variable_rates_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `variable_rate_source_id` bigint unsigned NOT NULL,
  `rate` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variable_rates_history_variable_rate_source_id_foreign` (`variable_rate_source_id`),
  CONSTRAINT `variable_rates_history_ibfk_1` FOREIGN KEY (`variable_rate_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.variable_rates_history_copy1 definition

CREATE TABLE `variable_rates_history_copy1` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `variable_rate_source_id` bigint unsigned NOT NULL,
  `rate` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variable_rates_history_variable_rate_source_id_foreign` (`variable_rate_source_id`),
  CONSTRAINT `variable_rates_history_copy1_ibfk_1` FOREIGN KEY (`variable_rate_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.lender_funder_interest_rate definition

CREATE TABLE `lender_funder_interest_rate` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lender_id` bigint unsigned NOT NULL,
  `interest_rate` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lender_funder_interest_rate_lender_id_foreign` (`lender_id`),
  CONSTRAINT `lender_funder_interest_rate_lender_id_foreign` FOREIGN KEY (`lender_id`) REFERENCES `lenders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.model_has_permissions definition

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.permission_group_permission definition

CREATE TABLE `permission_group_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_group_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_group_permission_permission_group_id_foreign` (`permission_group_id`),
  KEY `permission_group_permission_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_group_permission_permission_group_id_foreign` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_group_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.task definition

CREATE TABLE `task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `task_group_id` bigint unsigned NOT NULL,
  `auto_assign_to_case_owner` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_task_group_id_foreign` (`task_group_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`task_group_id`) REFERENCES `task_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_client_companies definition

CREATE TABLE `asset_client_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned NOT NULL,
  `client_company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_client_companies_asset_id_foreign` (`asset_id`),
  CONSTRAINT `asset_client_companies_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_client_individuals definition

CREATE TABLE `asset_client_individuals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_client_individuals_asset_id_foreign` (`asset_id`),
  KEY `asset_client_individuals_client_individual_id_foreign` (`client_individual_id`),
  CONSTRAINT `asset_client_individuals_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asset_client_individuals_ibfk_2` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_insurance_notes definition

CREATE TABLE `asset_insurance_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_insurance_id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_insurance_notes_asset_insurance_id_foreign` (`asset_insurance_id`),
  KEY `asset_insurance_notes_note_id_foreign` (`note_id`),
  CONSTRAINT `asset_insurance_notes_ibfk_1` FOREIGN KEY (`asset_insurance_id`) REFERENCES `asset_insurances` (`id`),
  CONSTRAINT `asset_insurance_notes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.asset_insurances definition

CREATE TABLE `asset_insurances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned DEFAULT NULL,
  `policy_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_novellus_nominated_payee` tinyint(1) NOT NULL,
  `type_loss_payee` enum('sole','joint','composite','co-insured','first') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `sum_insured` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_insurance_type_id` bigint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `asset_insurances_asset_id_foreign` (`asset_id`),
  KEY `asset_insurances_asset_insurance_type_id_foreign` (`asset_insurance_type_id`),
  CONSTRAINT `asset_insurances_asset_insurance_type_id_foreign` FOREIGN KEY (`asset_insurance_type_id`) REFERENCES `asset_insurance_type` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `asset_insurances_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.assets definition

CREATE TABLE `assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `security` tinyint(1) NOT NULL DEFAULT '0',
  `jointly_owned` tinyint(1) DEFAULT '0',
  `independent_valuation` double(22,4) DEFAULT NULL,
  `internal_valuation` double(22,4) DEFAULT NULL,
  `asset_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `asset_address_id` bigint unsigned DEFAULT NULL,
  `deal_id` bigint unsigned DEFAULT NULL,
  `use_type_id` bigint unsigned DEFAULT NULL,
  `insurance_expiry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_asset_type_id_foreign` (`asset_type_id`),
  KEY `assets_client_group_id_foreign` (`client_group_id`),
  KEY `assets_asset_address_id_foreign` (`asset_address_id`),
  KEY `assets_use_type_id_foreign` (`use_type_id`),
  KEY `assets_deal_id_foreign` (`deal_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`asset_address_id`) REFERENCES `asset_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_ibfk_2` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_ibfk_3` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_ibfk_4` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_ibfk_5` FOREIGN KEY (`use_type_id`) REFERENCES `use_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.attribute_values definition

CREATE TABLE `attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_form_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_values_client_form_id_foreign` (`client_form_id`),
  CONSTRAINT `attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_ibfk_2` FOREIGN KEY (`client_form_id`) REFERENCES `client_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.audit definition

CREATE TABLE `audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned DEFAULT NULL,
  `event_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_created` int DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_data_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_data_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_user_id_foreign` (`user_id`),
  KEY `audit_deal_id_foreign` (`deal_id`),
  CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audit_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4853069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.borrowers definition

CREATE TABLE `borrowers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `guarantor_individual_id` bigint unsigned DEFAULT NULL,
  `guarantor_corporate_id` bigint unsigned DEFAULT NULL,
  `main_contact` tinyint NOT NULL DEFAULT '0',
  `administrator` tinyint NOT NULL DEFAULT '0',
  `guarantor` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowers_deal_id_foreign` (`deal_id`),
  KEY `borrowers_client_individual_id_foreign` (`client_individual_id`),
  KEY `borrowers_client_company_id_foreign` (`client_company_id`),
  KEY `borrowers_client_group_id_foreign` (`client_group_id`),
  KEY `borrowers_admin_id_foreign` (`admin_id`),
  KEY `borrowers_guarantor_individual_id_foreign` (`guarantor_individual_id`),
  KEY `borrowers_guarantor_corporate_id_foreign` (`guarantor_corporate_id`),
  CONSTRAINT `borrowers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `borrowers_guarantor_corporate_id_foreign` FOREIGN KEY (`guarantor_corporate_id`) REFERENCES `guarantor_corporates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `borrowers_guarantor_individual_id_foreign` FOREIGN KEY (`guarantor_individual_id`) REFERENCES `guarantor_individuals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `borrowers_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borrowers_ibfk_2` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borrowers_ibfk_3` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borrowers_ibfk_4` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.broker_agent_deals definition

CREATE TABLE `broker_agent_deals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `broker_agent_id` bigint unsigned NOT NULL,
  `broker_agent_main_contact` int NOT NULL DEFAULT '0',
  `deal_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `broker_agent_deals_broker_agent_id_foreign` (`broker_agent_id`),
  KEY `broker_agent_deals_deal_id_foreign` (`deal_id`),
  CONSTRAINT `broker_agent_deals_ibfk_1` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `broker_agent_deals_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.broker_agent_notes definition

CREATE TABLE `broker_agent_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `broker_agent_id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `negative_relationship` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `broker_agent_notes_broker_agent_id_foreign` (`broker_agent_id`),
  KEY `broker_agent_notes_note_id_foreign` (`note_id`),
  CONSTRAINT `broker_agent_notes_ibfk_1` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`),
  CONSTRAINT `broker_agent_notes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.broker_agents definition

CREATE TABLE `broker_agents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `broker_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_details_id` bigint unsigned DEFAULT NULL,
  `questionable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint unsigned DEFAULT NULL,
  `landline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `broker_agents_user_id_foreign` (`user_id`),
  KEY `broker_agents_broker_id_foreign` (`broker_id`),
  KEY `broker_agents_address_id_foreign` (`address_id`),
  KEY `broker_agents_bank_details_id_foreign` (`bank_details_id`),
  CONSTRAINT `broker_agents_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `broker_agents_ibfk_2` FOREIGN KEY (`bank_details_id`) REFERENCES `bank_details` (`id`),
  CONSTRAINT `broker_agents_ibfk_3` FOREIGN KEY (`broker_id`) REFERENCES `brokers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `broker_agents_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.broker_notes definition

CREATE TABLE `broker_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `broker_id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `broker_notes_broker_id_foreign` (`broker_id`),
  KEY `broker_notes_note_id_foreign` (`note_id`),
  CONSTRAINT `broker_notes_ibfk_1` FOREIGN KEY (`broker_id`) REFERENCES `brokers` (`id`),
  CONSTRAINT `broker_notes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.ccr_reports definition

CREATE TABLE `ccr_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ccr_reports_file_id_foreign` (`file_id`),
  CONSTRAINT `ccr_reports_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.charges definition

CREATE TABLE `charges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `charge` double(22,4) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `asset_id` bigint unsigned NOT NULL,
  `lender_id` bigint unsigned NOT NULL,
  `charge_type_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charges_lender_id_foreign` (`lender_id`),
  KEY `charges_charge_type_id_foreign` (`charge_type_id`),
  KEY `charges_parent_id_foreign` (`parent_id`),
  KEY `charges_asset_id_foreign` (`asset_id`),
  CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `charges_ibfk_2` FOREIGN KEY (`charge_type_id`) REFERENCES `charge_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `charges_ibfk_3` FOREIGN KEY (`lender_id`) REFERENCES `lenders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `charges_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_company_clients definition

CREATE TABLE `client_company_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_company_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned NOT NULL,
  `shareholding_percentage` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_company_clients_client_company_id_foreign` (`client_company_id`),
  KEY `client_company_clients_client_individual_id_foreign` (`client_individual_id`),
  CONSTRAINT `client_company_clients_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`),
  CONSTRAINT `client_company_clients_ibfk_2` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_company_notes definition

CREATE TABLE `client_company_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_company_id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_company_notes_client_company_id_foreign` (`client_company_id`),
  KEY `client_company_notes_note_id_foreign` (`note_id`),
  CONSTRAINT `client_company_notes_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`),
  CONSTRAINT `client_company_notes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_form_attachments definition

CREATE TABLE `client_form_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_form_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `form_attribute_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_form_attachments_client_form_id_foreign` (`client_form_id`),
  KEY `client_form_attachments_file_id_foreign` (`file_id`),
  CONSTRAINT `client_form_attachments_ibfk_1` FOREIGN KEY (`client_form_id`) REFERENCES `client_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_form_attachments_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_forms definition

CREATE TABLE `client_forms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_form_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` bigint unsigned NOT NULL,
  `client_form_batch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` tinyint NOT NULL DEFAULT '0',
  `deal_id` bigint unsigned DEFAULT NULL,
  `broker_agent_id` bigint unsigned DEFAULT NULL,
  `main_recipient` tinyint NOT NULL DEFAULT '0',
  `client_id` bigint unsigned DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `form_data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent_by_user_id` bigint unsigned DEFAULT NULL,
  `form_sent_at` datetime DEFAULT NULL,
  `form_populated_at` datetime DEFAULT NULL,
  `form_completed_at` datetime DEFAULT NULL,
  `docusign_document_sent` double(20,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_form_status_id` bigint unsigned DEFAULT NULL,
  `docusign_envelope_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docusign_completed_datetime` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_forms_form_id_foreign` (`form_id`),
  KEY `client_forms_client_id_foreign` (`client_id`),
  KEY `client_forms_client_company_id_foreign` (`client_company_id`),
  KEY `client_forms_client_group_id_foreign` (`client_group_id`),
  KEY `client_forms_client_form_status_id_foreign` (`client_form_status_id`),
  KEY `client_forms_broker_agent_id_foreign` (`broker_agent_id`),
  KEY `client_forms_deal_id_foreign` (`deal_id`),
  KEY `client_forms_sent_by_user_id_foreign` (`sent_by_user_id`),
  CONSTRAINT `client_forms_ibfk_1` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_2` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_3` FOREIGN KEY (`client_form_status_id`) REFERENCES `client_form_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_4` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_5` FOREIGN KEY (`client_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_6` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_7` FOREIGN KEY (`form_id`) REFERENCES `loan_custom_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_forms_ibfk_8` FOREIGN KEY (`sent_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_group_clients definition

CREATE TABLE `client_group_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` bigint unsigned NOT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `group_leader` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_group_clients_client_group_id_foreign` (`client_group_id`),
  KEY `client_group_clients_client_company_id_foreign` (`client_company_id`),
  KEY `client_group_clients_client_individual_id_foreign` (`client_individual_id`),
  CONSTRAINT `client_group_clients_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`),
  CONSTRAINT `client_group_clients_ibfk_2` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`),
  CONSTRAINT `client_group_clients_ibfk_3` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_individual_credit_data definition

CREATE TABLE `client_individual_credit_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_individual_id` bigint unsigned NOT NULL,
  `input_dob` date DEFAULT NULL,
  `input_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Co. Galway',
  `risk_factor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_defaulter` int DEFAULT NULL,
  `num_drn` int DEFAULT NULL,
  `num_shareholding` int DEFAULT NULL,
  `num_pia` int DEFAULT NULL,
  `num_directorship_prev` int DEFAULT NULL,
  `num_disqualification` int DEFAULT NULL,
  `num_pc` int DEFAULT NULL,
  `num_directorship` int DEFAULT NULL,
  `num_bankruptcy` int NOT NULL DEFAULT '0',
  `num_dsa` int NOT NULL DEFAULT '0',
  `num_judgment` int NOT NULL DEFAULT '0',
  `num_business_name` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_individual_credit_data_client_individual_id_foreign` (`client_individual_id`),
  CONSTRAINT `client_individual_credit_data_client_individual_id_foreign` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_individual_notes definition

CREATE TABLE `client_individual_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_individual_id` bigint unsigned NOT NULL,
  `note_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_individual_notes_client_individual_id_foreign` (`client_individual_id`),
  KEY `client_individual_notes_note_id_foreign` (`note_id`),
  CONSTRAINT `client_individual_notes_ibfk_1` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`),
  CONSTRAINT `client_individual_notes_ibfk_2` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.client_individuals definition

CREATE TABLE `client_individuals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_id` bigint unsigned DEFAULT NULL,
  `previous_address_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `permanent_uk_resident` tinyint(1) NOT NULL DEFAULT '1',
  `name_title_id` bigint unsigned DEFAULT NULL,
  `marital_status_id` bigint unsigned DEFAULT NULL,
  `total_gross_income` double(22,4) DEFAULT NULL,
  `employment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residency_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nature_of_business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_administrator_only` tinyint(1) NOT NULL DEFAULT '0',
  `dob_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_names` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_individuals_user_id_foreign` (`user_id`),
  KEY `client_individuals_marital_status_id_foreign` (`marital_status_id`),
  KEY `client_individuals_name_title_id_foreign` (`name_title_id`),
  KEY `client_individuals_address_id_foreign` (`address_id`),
  CONSTRAINT `client_individuals_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `client_individuals_ibfk_2` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`id`),
  CONSTRAINT `client_individuals_ibfk_3` FOREIGN KEY (`name_title_id`) REFERENCES `name_titles` (`id`),
  CONSTRAINT `client_individuals_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_activities definition

CREATE TABLE `deal_activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `audit_id` bigint unsigned DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date NOT NULL,
  `time_taken` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_activities_deal_id_foreign` (`deal_id`),
  KEY `deal_activities_user_id_foreign` (`user_id`),
  KEY `deal_activities_audit_id_foreign` (`audit_id`),
  KEY `deal_activities_file_id_foreign` (`file_id`),
  CONSTRAINT `deal_activities_ibfk_1` FOREIGN KEY (`audit_id`) REFERENCES `activity_log` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_activities_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_activities_ibfk_3` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_activities_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_document_categories definition

CREATE TABLE `deal_document_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sharepoint_unique_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_count` int DEFAULT NULL,
  `deal_id` bigint unsigned DEFAULT NULL,
  `size` int DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_document_categories_parent_id_foreign` (`parent_id`),
  KEY `deal_document_categories_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_document_categories_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_document_categories_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `deal_document_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23076 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_document_categories_data definition

CREATE TABLE `deal_document_categories_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `deal_document_category_id` bigint unsigned NOT NULL,
  `file_count` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_document_categories_data_deal_id_foreign` (`deal_id`),
  KEY `deal_document_categories_data_deal_document_category_id_foreign` (`deal_document_category_id`),
  CONSTRAINT `deal_document_categories_data_ibfk_1` FOREIGN KEY (`deal_document_category_id`) REFERENCES `deal_document_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_document_categories_data_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_documents definition

CREATE TABLE `deal_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `deal_document_category_id` bigint unsigned NOT NULL,
  `borrower_id` bigint unsigned DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `deal_document_risk_id` bigint unsigned DEFAULT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `asset_id` bigint unsigned DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_documents_file_id_foreign` (`file_id`),
  KEY `deal_documents_deal_document_category_id_foreign` (`deal_document_category_id`),
  KEY `deal_documents_borrower_id_foreign` (`borrower_id`),
  KEY `deal_documents_client_individual_id_foreign` (`client_individual_id`),
  KEY `deal_documents_asset_id_foreign` (`asset_id`),
  KEY `deal_documents_deal_id_foreign` (`deal_id`),
  KEY `deal_documents_client_company_id_foreign` (`client_company_id`),
  KEY `deal_documents_deal_document_risk_id_foreign` (`deal_document_risk_id`),
  CONSTRAINT `deal_documents_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_3` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_4` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_5` FOREIGN KEY (`deal_document_category_id`) REFERENCES `deal_document_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_6` FOREIGN KEY (`deal_document_risk_id`) REFERENCES `deal_document_risk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_7` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_documents_ibfk_8` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_introducers definition

CREATE TABLE `deal_introducers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `introducer_id` bigint unsigned DEFAULT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `broker_id` bigint unsigned DEFAULT NULL,
  `introducer_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_introducers_introducer_id_foreign` (`introducer_id`),
  KEY `deal_introducers_deal_id_foreign` (`deal_id`),
  KEY `deal_introducers_broker_id_foreign` (`broker_id`),
  KEY `deal_introducers_introducer_type_id_foreign` (`introducer_type_id`),
  CONSTRAINT `deal_introducers_ibfk_1` FOREIGN KEY (`broker_id`) REFERENCES `brokers` (`id`),
  CONSTRAINT `deal_introducers_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  CONSTRAINT `deal_introducers_ibfk_3` FOREIGN KEY (`introducer_id`) REFERENCES `introducers` (`id`),
  CONSTRAINT `deal_introducers_ibfk_4` FOREIGN KEY (`introducer_type_id`) REFERENCES `introducer_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_notes definition

CREATE TABLE `deal_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `replied_to_id` bigint unsigned DEFAULT NULL,
  `created_by_user_id` bigint unsigned DEFAULT NULL,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `deal_notes_deal_id_foreign` (`deal_id`),
  KEY `deal_notes_replied_to_id_foreign` (`replied_to_id`),
  KEY `deal_notes_created_by_user_id_foreign` (`created_by_user_id`),
  CONSTRAINT `deal_notes_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `deal_notes_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  CONSTRAINT `deal_notes_ibfk_3` FOREIGN KEY (`replied_to_id`) REFERENCES `deal_notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_notification_rules definition

CREATE TABLE `deal_notification_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `drawdown_event_type_id` bigint unsigned DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `notification_rule_id` bigint unsigned DEFAULT NULL,
  `scheduled_for` int DEFAULT NULL,
  `interval_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `notification_template_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_notification_rules_notification_rule_id_foreign` (`notification_rule_id`),
  KEY `deal_notification_rules_deal_id_foreign` (`deal_id`),
  KEY `deal_notification_rules_drawdown_event_type_id_foreign` (`drawdown_event_type_id`),
  KEY `deal_notification_rules_file_id_foreign` (`file_id`),
  KEY `deal_notification_rules_notification_template_id_foreign` (`notification_template_id`),
  CONSTRAINT `deal_notification_rules_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_notification_rules_ibfk_2` FOREIGN KEY (`drawdown_event_type_id`) REFERENCES `drawdown_event_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_notification_rules_ibfk_3` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_notification_rules_ibfk_4` FOREIGN KEY (`notification_rule_id`) REFERENCES `notification_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_notification_rules_ibfk_5` FOREIGN KEY (`notification_template_id`) REFERENCES `notification_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_notification_rules_recipients definition

CREATE TABLE `deal_notification_rules_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_notification_rule_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deal_noti_rule_id` (`deal_notification_rule_id`),
  KEY `deal_notification_rules_recipients_client_individual_id_foreign` (`client_individual_id`),
  CONSTRAINT `deal_notification_rules_recipients_ibfk_1` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_notification_rules_recipients_ibfk_2` FOREIGN KEY (`deal_notification_rule_id`) REFERENCES `deal_notification_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_rate_floors definition

CREATE TABLE `deal_rate_floors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variable_source_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `floor_rate` double(22,4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_rate_floors_variable_source_id_foreign` (`variable_source_id`),
  KEY `deal_rate_floors_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_rate_floors_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_rate_floors_ibfk_2` FOREIGN KEY (`variable_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_setting_groups definition

CREATE TABLE `deal_setting_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_setting_groups_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_setting_groups_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_settings definition

CREATE TABLE `deal_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `order_id` bigint unsigned NOT NULL,
  `deal_setting_group_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_settings_deal_setting_group_id_foreign` (`deal_setting_group_id`),
  CONSTRAINT `deal_settings_ibfk_1` FOREIGN KEY (`deal_setting_group_id`) REFERENCES `deal_setting_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_task definition

CREATE TABLE `deal_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complete` tinyint NOT NULL DEFAULT '0',
  `order_id` bigint unsigned NOT NULL,
  `deal_task_group_id` bigint unsigned NOT NULL,
  `actioned_by_user_id` bigint unsigned DEFAULT NULL,
  `assigned_to_user_id` bigint unsigned DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `auto_assign_to_case_owner` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `na` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deal_task_deal_task_group_id_foreign` (`deal_task_group_id`),
  KEY `deal_task_actioned_by_user_id_foreign` (`actioned_by_user_id`),
  KEY `deal_task_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  CONSTRAINT `deal_task_ibfk_1` FOREIGN KEY (`actioned_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_task_ibfk_2` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deal_task_ibfk_3` FOREIGN KEY (`deal_task_group_id`) REFERENCES `deal_task_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=228850 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deal_task_group definition

CREATE TABLE `deal_task_group` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_task_group_deal_id_foreign` (`deal_id`),
  CONSTRAINT `deal_task_group_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36937 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.deals definition

CREATE TABLE `deals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `case_owner_id` bigint unsigned DEFAULT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint unsigned DEFAULT NULL,
  `guarantor_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `approval_requested_by` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT NULL,
  `date_of_approval_required` date DEFAULT NULL,
  `date_of_approval` date DEFAULT NULL,
  `purpose_credit_type_id` bigint unsigned DEFAULT NULL,
  `base_rate_floor` double(22,4) DEFAULT NULL,
  `loan_term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double(22,4) DEFAULT NULL,
  `amount_required` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_ltv` int DEFAULT NULL,
  `marketing_source_id` bigint unsigned DEFAULT NULL,
  `usage_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `undervalue_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `funds_going_to_be_used_for` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortfall_balance_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exit_strategy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `marketing_source_utm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_campaign_utm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aborted_reason_id` bigint unsigned DEFAULT NULL,
  `previous_status_id` bigint unsigned DEFAULT NULL,
  `estimated_sale_time` date DEFAULT NULL,
  `estimated_construction_time` date DEFAULT NULL,
  `square_footage` int DEFAULT NULL,
  `price_per_square_foot` decimal(22,4) DEFAULT NULL,
  `private_investor` tinyint(1) NOT NULL DEFAULT '0',
  `novellus_reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `novellus_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lending_type_id` bigint unsigned DEFAULT NULL,
  `interest_calculation_type_id` bigint unsigned DEFAULT NULL,
  `interest_type_id` bigint unsigned DEFAULT NULL,
  `purpose_of_loan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deals_name_unique` (`name`),
  KEY `deals_type_id_foreign` (`type_id`),
  KEY `deals_status_id_foreign` (`status_id`),
  KEY `deals_guarantor_id_foreign` (`guarantor_id`),
  KEY `deals_currency_id_foreign` (`currency_id`),
  KEY `deals_client_group_id_foreign` (`client_group_id`),
  KEY `deals_marketing_source_id_foreign` (`marketing_source_id`),
  KEY `deals_case_owner_id_foreign` (`case_owner_id`),
  KEY `deals_purpose_credit_type_id_foreign` (`purpose_credit_type_id`),
  KEY `deals_parent_id_foreign` (`parent_id`),
  KEY `deals_approval_requested_by_foreign` (`approval_requested_by`),
  KEY `deals_approved_by_foreign` (`approved_by`),
  KEY `deals_aborted_reason_id_foreign` (`aborted_reason_id`),
  KEY `deals_previous_status_id_foreign` (`previous_status_id`),
  KEY `deals_lending_type_id_foreign` (`lending_type_id`),
  KEY `deals_interest_calculation_type_id_foreign` (`interest_calculation_type_id`),
  KEY `deals_interest_type_id_foreign` (`interest_type_id`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`aborted_reason_id`) REFERENCES `deal_aborted_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `deals_ibfk_10` FOREIGN KEY (`previous_status_id`) REFERENCES `deal_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `deals_ibfk_11` FOREIGN KEY (`purpose_credit_type_id`) REFERENCES `purpose_credit_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deals_ibfk_12` FOREIGN KEY (`status_id`) REFERENCES `deal_statuses` (`id`),
  CONSTRAINT `deals_ibfk_13` FOREIGN KEY (`type_id`) REFERENCES `deal_types` (`id`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`approval_requested_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deals_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deals_ibfk_4` FOREIGN KEY (`case_owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deals_ibfk_5` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`),
  CONSTRAINT `deals_ibfk_6` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `deals_ibfk_7` FOREIGN KEY (`guarantor_id`) REFERENCES `client_individuals` (`id`),
  CONSTRAINT `deals_ibfk_8` FOREIGN KEY (`marketing_source_id`) REFERENCES `marketing_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deals_ibfk_9` FOREIGN KEY (`parent_id`) REFERENCES `deals` (`id`),
  CONSTRAINT `deals_interest_calculation_type_id_foreign` FOREIGN KEY (`interest_calculation_type_id`) REFERENCES `interest_calculation_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `deals_interest_type_id_foreign` FOREIGN KEY (`interest_type_id`) REFERENCES `interest_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `deals_lending_type_id_foreign` FOREIGN KEY (`lending_type_id`) REFERENCES `lending_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.delegated_owners definition

CREATE TABLE `delegated_owners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delegated_owners_user_id_foreign` (`user_id`),
  KEY `delegated_owners_deal_id_foreign` (`deal_id`),
  CONSTRAINT `delegated_owners_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `delegated_owners_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3454 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_events definition

CREATE TABLE `drawdown_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL,
  `financial_date` date DEFAULT NULL,
  `drawdown_id` bigint unsigned NOT NULL,
  `event_type_id` bigint unsigned NOT NULL,
  `event_status_id` bigint unsigned NOT NULL,
  `amount` double(22,4) DEFAULT NULL,
  `variable_rate_source_id` bigint unsigned DEFAULT NULL,
  `accrued_amount` double(22,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount_of_loan_in_default` double(22,4) DEFAULT NULL,
  `default_interest_rate` double(22,4) DEFAULT NULL,
  `rate_override` double(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drawdown_events_drawdown_id_foreign` (`drawdown_id`),
  KEY `drawdown_events_event_type_id_foreign` (`event_type_id`),
  KEY `drawdown_events_event_status_id_foreign` (`event_status_id`),
  KEY `drawdown_events_variable_rate_source_id_foreign` (`variable_rate_source_id`),
  CONSTRAINT `drawdown_events_ibfk_1` FOREIGN KEY (`drawdown_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_events_ibfk_2` FOREIGN KEY (`event_status_id`) REFERENCES `drawdown_event_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_events_ibfk_3` FOREIGN KEY (`event_type_id`) REFERENCES `drawdown_event_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_events_ibfk_4` FOREIGN KEY (`variable_rate_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2735 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_fees definition

CREATE TABLE `drawdown_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `drawdown_id` bigint unsigned NOT NULL,
  `fee_status_id` bigint unsigned NOT NULL,
  `fee_type_id` bigint unsigned NOT NULL,
  `service_provider_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `broker_agent_id` bigint unsigned DEFAULT NULL,
  `invoice_paid_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fee_amount` double DEFAULT NULL,
  `fee_amount_perc` double(8,2) DEFAULT NULL,
  `added_to_loan` int NOT NULL DEFAULT '0',
  `generate_invoice` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_due_date` date DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fee_interest` tinyint DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `retained_from_net_advance` int NOT NULL DEFAULT '0',
  `commitment_fee_refund_amount` decimal(10,2) DEFAULT NULL,
  `commitment_fee_refund_date` date DEFAULT NULL,
  `commitment_fee_refund_period` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `quoted_date` date DEFAULT NULL,
  `quote_confirmed_date` date DEFAULT NULL,
  `undertaking_confirmed_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drawdown_fees_fee_status_id_foreign` (`fee_status_id`),
  KEY `drawdown_fees_fee_type_id_foreign` (`fee_type_id`),
  KEY `drawdown_fees_service_provider_id_foreign` (`service_provider_id`),
  KEY `drawdown_fees_currency_id_foreign` (`currency_id`),
  KEY `drawdown_fees_drawdown_id_foreign` (`drawdown_id`),
  KEY `drawdown_fees_broker_agent_id_foreign` (`broker_agent_id`),
  CONSTRAINT `drawdown_fees_broker_agent_id_foreign` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_fees_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `drawdown_fees_drawdown_id_foreign` FOREIGN KEY (`drawdown_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_fees_fee_status_id_foreign` FOREIGN KEY (`fee_status_id`) REFERENCES `fee_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_fees_fee_type_id_foreign` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`id`),
  CONSTRAINT `drawdown_fees_service_provider_id_foreign` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdown_fields_approval definition

CREATE TABLE `drawdown_fields_approval` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint unsigned DEFAULT NULL,
  `drawdown_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drawdown_fields_approval_approved_by_foreign` (`approved_by`),
  KEY `drawdown_fields_approval_drawdown_id_foreign` (`drawdown_id`),
  CONSTRAINT `drawdown_fields_approval_ibfk_1` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdown_fields_approval_ibfk_2` FOREIGN KEY (`drawdown_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.drawdowns definition

CREATE TABLE `drawdowns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `drawdown_status_id` bigint unsigned DEFAULT NULL,
  `lender_id` bigint unsigned DEFAULT NULL,
  `interest_rate` double(22,4) DEFAULT NULL,
  `redemption_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest_calculation_type_id` bigint unsigned DEFAULT NULL,
  `total_net_loan` double(22,4) DEFAULT NULL,
  `gross_loan` double(22,4) DEFAULT NULL,
  `term_months` int DEFAULT NULL,
  `term_days` int DEFAULT NULL,
  `monthly_rate` double(22,4) DEFAULT NULL,
  `daily_rate` double(22,4) DEFAULT NULL,
  `loan_start_date` date DEFAULT NULL,
  `refinanced_date` date DEFAULT NULL,
  `refinance_gross_amount` double(22,4) DEFAULT NULL,
  `refinanced_from_id` bigint unsigned DEFAULT NULL,
  `refinanced_to_id` bigint unsigned DEFAULT NULL,
  `loan_administration_start_date` date DEFAULT NULL,
  `loan_end_date` date DEFAULT NULL,
  `deal_type_id` bigint unsigned DEFAULT NULL,
  `interest_type_id` bigint unsigned DEFAULT NULL,
  `bridging_drawdown_type_id` bigint unsigned DEFAULT NULL,
  `interest_subtype_id` bigint unsigned DEFAULT NULL,
  `max_loan_amount` double(22,4) DEFAULT NULL,
  `ltv` double(22,4) DEFAULT NULL,
  `interest_payment` double(22,4) DEFAULT NULL,
  `actual_accrued_interest_payment` double(22,4) DEFAULT NULL,
  `monthly_interest` double(22,4) DEFAULT NULL,
  `daily_interest` double(22,4) DEFAULT NULL,
  `total_net_advance` double(22,4) DEFAULT NULL,
  `total_investment` double(22,4) DEFAULT NULL,
  `estimated_return` double(22,4) DEFAULT NULL,
  `estimated_margin` double(22,4) DEFAULT NULL,
  `redemption_value` double(22,4) DEFAULT NULL,
  `loan_calculation_method_id` bigint unsigned DEFAULT NULL,
  `asset_value` double(22,4) DEFAULT NULL,
  `asset_type_id` bigint unsigned DEFAULT NULL,
  `max_ltv` double(22,4) DEFAULT NULL,
  `ltv_override_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variable_rate_source_id` bigint unsigned DEFAULT NULL,
  `source_rate` double(22,4) DEFAULT NULL,
  `margin` double(22,4) DEFAULT NULL,
  `variable_rate_id` bigint unsigned DEFAULT NULL,
  `total_fees` double(22,4) DEFAULT NULL,
  `total_interest_on_fees` double(22,4) DEFAULT NULL,
  `retained_interest` double(8,2) DEFAULT NULL,
  `redeem_date` date DEFAULT NULL,
  `exit_fee_calculated` double(22,4) DEFAULT NULL,
  `funder_interest_rate` double(22,4) DEFAULT NULL,
  `hybrid_parent_id` bigint unsigned DEFAULT NULL,
  `is_hybrid_parent` tinyint NOT NULL DEFAULT '0',
  `exit_strategies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `marketing_channel_id` bigint unsigned DEFAULT NULL,
  `default_rate` double(22,4) DEFAULT NULL,
  `year_type` int DEFAULT '0',
  `compound_day` int DEFAULT '1',
  `funder_arrangement_fee` decimal(22,4) DEFAULT NULL,
  `funder_arrangement_fee_is_percent` tinyint(1) NOT NULL DEFAULT '0',
  `notice_period_days` int DEFAULT NULL,
  `additional_interest_rate` double(22,5) DEFAULT NULL,
  `extended_from` bigint unsigned DEFAULT NULL,
  `extension_date` date DEFAULT NULL,
  `extended_gross_amount` double(22,4) DEFAULT NULL,
  `gross_development_value` double(22,4) DEFAULT NULL,
  `gross_development_value_gross_loan_greater_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `asset_value_day_net_advance_greater_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_drawn_amount` decimal(15,2) DEFAULT NULL,
  `drawdowns_start_date` date DEFAULT NULL,
  `drawdowns_end_date` date DEFAULT NULL,
  `number_of_drawdowns` int DEFAULT NULL,
  `tranch_strategy` int DEFAULT NULL,
  `used_floor_rate` tinyint(1) NOT NULL DEFAULT '0',
  `used_floor_rate_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profile_approval_status_id` bigint unsigned DEFAULT NULL,
  `first_approval_user_id` bigint unsigned DEFAULT NULL,
  `first_approval_datetime` datetime DEFAULT NULL,
  `second_approval_user_id` bigint unsigned DEFAULT NULL,
  `submitted_by_user_id` bigint unsigned DEFAULT NULL,
  `approval_datetime` datetime DEFAULT NULL,
  `rejected_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `drawdowns_drawdown_status_id_foreign` (`drawdown_status_id`),
  KEY `drawdowns_deal_id_foreign` (`deal_id`),
  KEY `drawdowns_lender_id_foreign` (`lender_id`),
  KEY `drawdowns_interest_calculation_type_id_foreign` (`interest_calculation_type_id`),
  KEY `drawdowns_deal_type_id_foreign` (`deal_type_id`),
  KEY `drawdowns_interest_type_id_foreign` (`interest_type_id`),
  KEY `drawdowns_loan_calculation_method_id_foreign` (`loan_calculation_method_id`),
  KEY `drawdowns_asset_type_id_foreign` (`asset_type_id`),
  KEY `drawdowns_variable_rate_source_id_foreign` (`variable_rate_source_id`),
  KEY `drawdowns_variable_rate_id_foreign` (`variable_rate_id`),
  KEY `drawdowns_refinanced_from_id_foreign` (`refinanced_from_id`),
  KEY `drawdowns_refinanced_to_id_foreign` (`refinanced_to_id`),
  KEY `drawdowns_hybrid_parent_id_foreign` (`hybrid_parent_id`),
  KEY `drawdowns_marketing_channel_id_foreign` (`marketing_channel_id`),
  KEY `drawdowns_extended_from_foreign` (`extended_from`),
  KEY `drawdowns_interest_subtype_id_foreign` (`interest_subtype_id`),
  KEY `drawdowns_profile_approval_status_id_foreign` (`profile_approval_status_id`),
  KEY `drawdowns_first_approval_user_id_foreign` (`first_approval_user_id`),
  KEY `drawdowns_second_approval_user_id_foreign` (`second_approval_user_id`),
  KEY `drawdowns_submitted_by_user_id_foreign` (`submitted_by_user_id`),
  CONSTRAINT `drawdowns_first_approval_user_id_foreign` FOREIGN KEY (`first_approval_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `drawdowns_ibfk_1` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_10` FOREIGN KEY (`loan_calculation_method_id`) REFERENCES `loan_calculation_method` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_11` FOREIGN KEY (`marketing_channel_id`) REFERENCES `marketing_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_12` FOREIGN KEY (`refinanced_from_id`) REFERENCES `drawdowns` (`id`),
  CONSTRAINT `drawdowns_ibfk_13` FOREIGN KEY (`refinanced_to_id`) REFERENCES `drawdowns` (`id`),
  CONSTRAINT `drawdowns_ibfk_14` FOREIGN KEY (`variable_rate_id`) REFERENCES `variable_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_15` FOREIGN KEY (`variable_rate_source_id`) REFERENCES `variable_rate_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_3` FOREIGN KEY (`deal_type_id`) REFERENCES `deal_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_4` FOREIGN KEY (`drawdown_status_id`) REFERENCES `drawdown_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_5` FOREIGN KEY (`extended_from`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_6` FOREIGN KEY (`hybrid_parent_id`) REFERENCES `drawdowns` (`id`),
  CONSTRAINT `drawdowns_ibfk_7` FOREIGN KEY (`interest_calculation_type_id`) REFERENCES `interest_calculation_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_8` FOREIGN KEY (`interest_type_id`) REFERENCES `interest_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_ibfk_9` FOREIGN KEY (`lender_id`) REFERENCES `lenders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_interest_subtype_id_foreign` FOREIGN KEY (`interest_subtype_id`) REFERENCES `interest_subtypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drawdowns_profile_approval_status_id_foreign` FOREIGN KEY (`profile_approval_status_id`) REFERENCES `profile_approval_status` (`id`),
  CONSTRAINT `drawdowns_second_approval_user_id_foreign` FOREIGN KEY (`second_approval_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `drawdowns_submitted_by_user_id_foreign` FOREIGN KEY (`submitted_by_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.email_code_authentication definition

CREATE TABLE `email_code_authentication` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_code_authentication_user_id_foreign` (`user_id`),
  CONSTRAINT `email_code_authentication_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.exit_fee_tiers definition

CREATE TABLE `exit_fee_tiers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `term_month` double(20,0) DEFAULT NULL,
  `fee_percent` double(20,0) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exit_fee_tiers_deal_id_foreign` (`deal_id`),
  CONSTRAINT `exit_fee_tiers_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.fees definition

CREATE TABLE `fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fee_status_id` bigint unsigned NOT NULL,
  `invoice_paid_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fee_type_id` bigint unsigned NOT NULL,
  `service_provider_id` bigint unsigned DEFAULT NULL,
  `fee_amount` double(22,4) DEFAULT NULL,
  `fee_amount_perc` double(8,2) DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned DEFAULT NULL,
  `fee_interest` tinyint DEFAULT NULL,
  `generate_invoice` double(22,4) DEFAULT NULL,
  `invoice_due_date` date DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `added_to_loan` int NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `broker_agent_id` bigint unsigned DEFAULT NULL,
  `retained_from_net_advance` int NOT NULL DEFAULT '0',
  `commitment_fee_refund_amount` decimal(22,4) DEFAULT NULL,
  `commitment_fee_refund_date` date DEFAULT NULL,
  `commitment_fee_refund_period` int DEFAULT NULL,
  `quoted_date` date DEFAULT NULL,
  `quote_confirmed_date` date DEFAULT NULL,
  `undertaking_confirmed_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fees_fee_status_id_foreign` (`fee_status_id`),
  KEY `fees_fee_type_id_foreign` (`fee_type_id`),
  KEY `fees_service_provider_id_foreign` (`service_provider_id`),
  KEY `fees_currency_id_foreign` (`currency_id`),
  KEY `fees_deal_id_foreign` (`deal_id`),
  KEY `fees_broker_agent_id_foreign` (`broker_agent_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `fees_ibfk_3` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_ibfk_4` FOREIGN KEY (`fee_status_id`) REFERENCES `fee_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_ibfk_5` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`id`),
  CONSTRAINT `fees_ibfk_6` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.files definition

CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_document_category_id` bigint unsigned DEFAULT NULL,
  `directory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `document_folder` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sharepoint_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sharepoint_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_foreign` (`user_id`),
  KEY `files_deal_document_category_id_foreign` (`deal_document_category_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`deal_document_category_id`) REFERENCES `deal_document_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.guarantors definition

CREATE TABLE `guarantors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `guarantor_type_id` bigint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `guarantors_deal_id_foreign` (`deal_id`),
  KEY `guarantors_client_individual_id_foreign` (`client_individual_id`),
  KEY `guarantors_client_company_id_foreign` (`client_company_id`),
  KEY `guarantors_client_group_id_foreign` (`client_group_id`),
  KEY `guarantors_guarantor_type_id_foreign` (`guarantor_type_id`),
  CONSTRAINT `guarantors_guarantor_type_id_foreign` FOREIGN KEY (`guarantor_type_id`) REFERENCES `guarantor_type` (`id`),
  CONSTRAINT `guarantors_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guarantors_ibfk_2` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guarantors_ibfk_3` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guarantors_ibfk_4` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.lender_operational_team_admin definition

CREATE TABLE `lender_operational_team_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `lender_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lender_operational_team_admin_user_id_foreign` (`user_id`),
  KEY `lender_operational_team_admin_lender_id_foreign` (`lender_id`),
  CONSTRAINT `lender_operational_team_admin_ibfk_1` FOREIGN KEY (`lender_id`) REFERENCES `lenders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lender_operational_team_admin_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.linked_deals definition

CREATE TABLE `linked_deals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `linked_deal_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cross_collateralized` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `linked_deals_deal_id_foreign` (`deal_id`),
  KEY `linked_deals_linked_deal_id_foreign` (`linked_deal_id`),
  CONSTRAINT `linked_deals_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`),
  CONSTRAINT `linked_deals_ibfk_2` FOREIGN KEY (`linked_deal_id`) REFERENCES `deals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.loan_administrators definition

CREATE TABLE `loan_administrators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_administrators_deal_id_foreign` (`deal_id`),
  KEY `loan_administrators_client_individual_id_foreign` (`client_individual_id`),
  KEY `loan_administrators_client_company_id_foreign` (`client_company_id`),
  KEY `loan_administrators_client_group_id_foreign` (`client_group_id`),
  CONSTRAINT `loan_administrators_ibfk_1` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loan_administrators_ibfk_2` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loan_administrators_ibfk_3` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loan_administrators_ibfk_4` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.loan_custom_forms definition

CREATE TABLE `loan_custom_forms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_type_id` bigint unsigned DEFAULT NULL,
  `payment_required` tinyint NOT NULL DEFAULT '0',
  `application_form` tinyint NOT NULL DEFAULT '0',
  `payment_fee` double(22,4) DEFAULT NULL,
  `e_sign_required` double(22,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_custom_forms_created_by_foreign` (`created_by`),
  KEY `loan_custom_forms_form_type_id_foreign` (`form_type_id`),
  CONSTRAINT `loan_custom_forms_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `loan_custom_forms_ibfk_2` FOREIGN KEY (`form_type_id`) REFERENCES `form_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loan_custom_forms_chk_1` CHECK (json_valid(`form_data`))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.margin_override definition

CREATE TABLE `margin_override` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `drawdown_id` bigint unsigned NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `rate` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `margin_override_drawdown_id_foreign` (`drawdown_id`),
  CONSTRAINT `margin_override_ibfk_1` FOREIGN KEY (`drawdown_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.notes definition

CREATE TABLE `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_created_by_foreign` (`created_by`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.notification definition

CREATE TABLE `notification` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_notification_rule_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `drawdown_id` bigint unsigned DEFAULT NULL,
  `drawdown_event_type_id` bigint unsigned DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_deal_id_foreign` (`deal_id`),
  KEY `notification_drawdown_id_foreign` (`drawdown_id`),
  KEY `notification_drawdown_event_type_id_foreign` (`drawdown_event_type_id`),
  KEY `notification_file_id_foreign` (`file_id`),
  KEY `fk_noti_deal_noti_rule_id` (`deal_notification_rule_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`deal_notification_rule_id`) REFERENCES `deal_notification_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`drawdown_event_type_id`) REFERENCES `drawdown_event_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`drawdown_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_5` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.notification_recipients definition

CREATE TABLE `notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned NOT NULL,
  `used_email_address` double(20,0) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_recipients_notification_id_foreign` (`notification_id`),
  CONSTRAINT `notification_recipients_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.notification_rules definition

CREATE TABLE `notification_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_template_id` bigint unsigned DEFAULT NULL,
  `drawdown_event_type_id` bigint unsigned DEFAULT NULL,
  `scheduled_for` int DEFAULT NULL,
  `interval_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_override` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_override` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recipient_setting` int DEFAULT NULL,
  `lending_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_rules_drawdown_event_type_id_foreign` (`drawdown_event_type_id`),
  KEY `notification_rules_file_id_foreign` (`file_id`),
  KEY `notification_rules_notification_template_id_foreign` (`notification_template_id`),
  KEY `notification_rules_lending_type_id_foreign` (`lending_type_id`),
  CONSTRAINT `notification_rules_ibfk_1` FOREIGN KEY (`drawdown_event_type_id`) REFERENCES `drawdown_event_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_rules_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_rules_ibfk_3` FOREIGN KEY (`notification_template_id`) REFERENCES `notification_templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_rules_lending_type_id_foreign` FOREIGN KEY (`lending_type_id`) REFERENCES `lending_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.notification_templates definition

CREATE TABLE `notification_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doc_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_templates_file_id_foreign` (`file_id`),
  CONSTRAINT `notification_templates_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.orders definition

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_form_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_status_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `net_total` double(22,4) DEFAULT NULL,
  `gross_total` double(22,4) DEFAULT NULL,
  `vat_rate` double(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_client_form_id_foreign` (`client_form_id`),
  KEY `orders_payment_id_foreign` (`payment_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_form_id`) REFERENCES `client_forms` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.quote_note definition

CREATE TABLE `quote_note` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` bigint unsigned NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_note_quote_id_foreign` (`quote_id`),
  CONSTRAINT `quote_note_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.quotes definition

CREATE TABLE `quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `drawdown_profile_id` bigint unsigned NOT NULL,
  `quotes_status_id` bigint unsigned NOT NULL,
  `deal_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotes_drawdown_profile_id_foreign` (`drawdown_profile_id`),
  KEY `quotes_quotes_status_id_foreign` (`quotes_status_id`),
  KEY `quotes_deal_id_foreign` (`deal_id`),
  KEY `quotes_file_id_foreign` (`file_id`),
  CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotes_ibfk_2` FOREIGN KEY (`drawdown_profile_id`) REFERENCES `drawdowns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotes_ibfk_3` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotes_ibfk_4` FOREIGN KEY (`quotes_status_id`) REFERENCES `quotes_status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.quotes_recipients definition

CREATE TABLE `quotes_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` bigint unsigned NOT NULL,
  `client_individual_id` bigint unsigned DEFAULT NULL,
  `used_email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_company_id` bigint unsigned DEFAULT NULL,
  `client_group_id` bigint unsigned DEFAULT NULL,
  `broker_agent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotes_recipients_quote_id_foreign` (`quote_id`),
  KEY `quotes_recipients_client_individual_id_foreign` (`client_individual_id`),
  KEY `quotes_recipients_client_group_id_foreign` (`client_group_id`),
  KEY `quotes_recipients_client_company_id_foreign` (`client_company_id`),
  KEY `quotes_recipients_broker_agent_id_foreign` (`broker_agent_id`),
  CONSTRAINT `quotes_recipients_broker_agent_id_foreign` FOREIGN KEY (`broker_agent_id`) REFERENCES `broker_agents` (`id`),
  CONSTRAINT `quotes_recipients_client_company_id_foreign` FOREIGN KEY (`client_company_id`) REFERENCES `client_companies` (`id`),
  CONSTRAINT `quotes_recipients_client_group_id_foreign` FOREIGN KEY (`client_group_id`) REFERENCES `client_groups` (`id`),
  CONSTRAINT `quotes_recipients_ibfk_1` FOREIGN KEY (`client_individual_id`) REFERENCES `client_individuals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quotes_recipients_ibfk_2` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.scheduled_notifications definition

CREATE TABLE `scheduled_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deal_notification_rule_id` bigint unsigned NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `enabled` int DEFAULT NULL,
  `enabled_by_user_id` bigint unsigned DEFAULT NULL,
  `sent` tinyint NOT NULL DEFAULT '0',
  `datetime_sent` datetime DEFAULT NULL,
  `subject_sent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `drawdown_event_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduled_notifications_deal_notification_rule_id_foreign` (`deal_notification_rule_id`),
  KEY `scheduled_notifications_enabled_by_user_id_foreign` (`enabled_by_user_id`),
  KEY `scheduled_notifications_drawdown_event_id_foreign` (`drawdown_event_id`),
  CONSTRAINT `scheduled_notifications_ibfk_1` FOREIGN KEY (`deal_notification_rule_id`) REFERENCES `deal_notification_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `scheduled_notifications_ibfk_2` FOREIGN KEY (`drawdown_event_id`) REFERENCES `drawdown_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `scheduled_notifications_ibfk_3` FOREIGN KEY (`enabled_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.users definition

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `change_password_datetime` datetime DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `payment_provider_id` bigint unsigned DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_type_id_unique` (`email`,`type_id`),
  KEY `users_stripe_id_index` (`stripe_id`),
  KEY `users_company_id_foreign` (`company_id`),
  KEY `users_type_id_foreign` (`type_id`),
  KEY `users_payment_provider_id_foreign` (`payment_provider_id`),
  KEY `users_avatar_id_foreign` (`avatar_id`),
  KEY `users_file_id_foreign` (`file_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`avatar_id`) REFERENCES `files` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`payment_provider_id`) REFERENCES `payment_providers` (`id`),
  CONSTRAINT `users_ibfk_5` FOREIGN KEY (`type_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66944 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- prod.valuations definition

CREATE TABLE `valuations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` bigint unsigned DEFAULT NULL,
  `service_provider_id` bigint unsigned DEFAULT NULL,
  `document_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `fee_option_id` bigint unsigned DEFAULT NULL,
  `valuation_status_id` bigint unsigned DEFAULT NULL,
  `report_received_date` date DEFAULT NULL,
  `date_expected` date DEFAULT NULL,
  `invoice_due_date` date DEFAULT NULL,
  `fee_amount` double(22,4) DEFAULT NULL,
  `file_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `report_requested_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `valuations_asset_id_foreign` (`asset_id`),
  KEY `valuations_service_provider_id_foreign` (`service_provider_id`),
  KEY `valuations_document_id_foreign` (`document_id`),
  KEY `valuations_currency_id_foreign` (`currency_id`),
  KEY `valuations_fee_option_id_foreign` (`fee_option_id`),
  KEY `valuations_valuation_status_id_foreign` (`valuation_status_id`),
  KEY `valuations_file_id_foreign` (`file_id`),
  CONSTRAINT `valuations_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_4` FOREIGN KEY (`fee_option_id`) REFERENCES `fee_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_5` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_6` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `valuations_ibfk_7` FOREIGN KEY (`valuation_status_id`) REFERENCES `valuation_statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

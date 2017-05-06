ALTER TABLE `crm_tender` 
ADD COLUMN `mid_date` DATETIME NULL AFTER `current_brand`;

ALTER TABLE `crm_tender` 
ADD COLUMN `closing_date` DATETIME NULL AFTER `mid_date`;
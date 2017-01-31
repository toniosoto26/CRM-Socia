ALTER TABLE `socia`.`crm_bl_details` 
DROP FOREIGN KEY `fk_crm_diagnosis_id`;
ALTER TABLE `socia`.`crm_bl_details` 
CHANGE COLUMN `crm_daignosis_id` `crm_diagnosis_id` INT(11) NOT NULL DEFAULT '0' ,
CHANGE COLUMN `requirements` `requirements` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `nextStep` `nextStep` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `commercialProposal` `commercialProposal` VARCHAR(255) NULL DEFAULT NULL ,
ADD COLUMN `deliverBy` VARCHAR(45) NULL AFTER `commercialProposal`,
ADD COLUMN `lease` VARCHAR(45) NULL AFTER `deliverBy`,
ADD COLUMN `nextTender` VARCHAR(45) NULL AFTER `lease`;
ALTER TABLE `socia`.`crm_bl_details` 
ADD CONSTRAINT `fk_crm_diagnosis_id`
  FOREIGN KEY (`crm_diagnosis_id`)
  REFERENCES `socia`.`crm_diagnosis` (`crm_diagnosis_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  CREATE TABLE `socia`.`crm_run_rate_type` (
  `crm_run_rate_type_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`crm_run_rate_type_id`));
  
  ALTER TABLE `socia`.`crm_run_rate` 
DROP FOREIGN KEY `crm_business_line_id`;
ALTER TABLE `socia`.`crm_run_rate` 
CHANGE COLUMN `crm_business_line_id` `crm_run_rate_type` INT(11) NULL DEFAULT NULL ,
ADD INDEX `crm_run_rate_type_idx` (`crm_run_rate_type` ASC),
DROP INDEX `crm_business_line_id_idx` ;
ALTER TABLE `socia`.`crm_run_rate` 
ADD CONSTRAINT `crm_run_rate_type`
  FOREIGN KEY (`crm_run_rate_type`)
  REFERENCES `socia`.`crm_run_rate_type` (`crm_run_rate_type_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

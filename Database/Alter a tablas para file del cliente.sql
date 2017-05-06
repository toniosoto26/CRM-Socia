ALTER TABLE `socia`.`crm_charge` 
CHANGE COLUMN `review_date` `review_date` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `payment_date` `payment_date` DATETIME NULL DEFAULT NULL ;

ALTER TABLE `socia`.`crm_charge` 
ADD INDEX `fk_company_divison_id_idx` (`company_division_id` ASC),
ADD INDEX `fk_position_id_idx` (`crm_position_id` ASC);
ALTER TABLE `socia`.`crm_charge` 
ADD CONSTRAINT `fk_company_divison_id`
  FOREIGN KEY (`company_division_id`)
  REFERENCES `socia`.`crm_company_division` (`company_division_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_position_id`
  FOREIGN KEY (`crm_position_id`)
  REFERENCES `socia`.`crm_position` (`id_position`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `socia`.`crm_logistics` 
CHANGE COLUMN `crm_addres_id` `crm_addres_id` INT NULL DEFAULT NULL ,
CHANGE COLUMN `contact_name` `crm_contact_id` INT NULL DEFAULT NULL ;

ALTER TABLE `socia`.`crm_logistics` 
ADD INDEX `fk_crm_address_id_idx` (`crm_addres_id` ASC);
ALTER TABLE `socia`.`crm_logistics` 
ADD CONSTRAINT `fk_crm_address_id`
  FOREIGN KEY (`crm_addres_id`)
  REFERENCES `socia`.`crm_address` (`crm_address_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `socia`.`crm_logistics` 
ADD INDEX `fk_crm_contact_id_idx` (`crm_contact_id` ASC);
ALTER TABLE `socia`.`crm_logistics` 
ADD CONSTRAINT `fk_crm_contact_id`
  FOREIGN KEY (`crm_contact_id`)
  REFERENCES `socia`.`crm_contact` (`crm_contact_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `socia`.`crm_charge` 
ADD COLUMN `crm_diagnosis_id` INT NULL AFTER `comments`,
ADD INDEX `fk_diagnosis_id_idx` (`crm_diagnosis_id` ASC);
ALTER TABLE `socia`.`crm_charge` 
ADD CONSTRAINT `fk_diagnosis_id`
  FOREIGN KEY (`crm_diagnosis_id`)
  REFERENCES `socia`.`crm_diagnosis` (`crm_diagnosis_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `socia`.`crm_logistics` 
ADD COLUMN `crm_diagnosis_id` INT NULL AFTER `timetable`;

ALTER TABLE `socia`.`crm_logistics` 
ADD INDEX `fk_crm_logistics_diagnosis_id_idx` (`crm_diagnosis_id` ASC);
ALTER TABLE `socia`.`crm_logistics` 
ADD CONSTRAINT `fk_crm_logistics_diagnosis_id`
  FOREIGN KEY (`crm_diagnosis_id`)
  REFERENCES `socia`.`crm_diagnosis` (`crm_diagnosis_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

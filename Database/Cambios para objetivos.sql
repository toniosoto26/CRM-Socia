ALTER TABLE `socia`.`crm_goal` 
CHANGE COLUMN `calls` `actual_calls` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `appointments` `prospect_calls` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `quotations` `actual_appointments` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `calls_scope` `prospect_appointments` INT NULL DEFAULT NULL ,
CHANGE COLUMN `appointments_scope` `quotations` INT NULL DEFAULT NULL ,
CHANGE COLUMN `quotations_scope` `day_of_week` INT NULL DEFAULT NULL ;

ALTER TABLE `socia`.`crm_goal` 
DROP FOREIGN KEY `fk_crm_goal_crm_client1`;
ALTER TABLE `socia`.`crm_goal` 
CHANGE COLUMN `crm_client_id` `crm_user_id` INT(11) NOT NULL ,
ADD INDEX `fk_crm_goal_crm_user1_idx` (`crm_user_id` ASC),
DROP INDEX `fk_crm_goal_crm_client1_idx` ;
ALTER TABLE `socia`.`crm_goal` 
ADD CONSTRAINT `fk_crm_goal_crm_user1`
  FOREIGN KEY (`crm_user_id`)
  REFERENCES `socia`.`crm_user` (`crm_user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `socia`.`crm_goal` (`crm_goal_id`, `actual_calls`, `prospect_calls`, `actual_appointments`, `prospect_appointments`, `quotations`, `day_of_week`, `date_updated`, `crm_user_id`) VALUES ('1', '4', '0', '4', '0', '4', '1', '2017-02-11', '2');
INSERT INTO `socia`.`crm_goal` (`crm_goal_id`, `actual_calls`, `prospect_calls`, `actual_appointments`, `prospect_appointments`, `quotations`, `day_of_week`, `date_updated`, `crm_user_id`) VALUES ('2', '4', '0', '4', '0', '4', '2', '2017-02-11', '2');
INSERT INTO `socia`.`crm_goal` (`crm_goal_id`, `actual_calls`, `prospect_calls`, `actual_appointments`, `prospect_appointments`, `quotations`, `day_of_week`, `date_updated`, `crm_user_id`) VALUES ('3', '4', '0', '4', '0', '4', '3', '2017-02-11', '2');
INSERT INTO `socia`.`crm_goal` (`crm_goal_id`, `actual_calls`, `prospect_calls`, `actual_appointments`, `prospect_appointments`, `quotations`, `day_of_week`, `date_updated`, `crm_user_id`) VALUES ('4', '4', '0', '4', '0', '4', '4', '2017-02-11', '2');

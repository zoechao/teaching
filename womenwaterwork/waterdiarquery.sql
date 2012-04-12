SELECT node.uid userID, 
       `node`.`title` `description`,
       `typedirect`.`name` `typeofdirectuse`,
       `date`.`field_use_date_value` `date`,
       `requireddirectterm`.`name` `directrequired`,
       `qualitydirectterm`.`name` `directwaterquality`,
       `directlocterm`.`name` `directlocation`,
       `directusage`.`field_direct_water_usage_value` `directusage`,
       `indirectrequiredterm`.`name` `indirectrequired`,
       `indirectqualityterm`.`name` `indirectquality`,
       `indirectlocterm`.`name` `indirectlocation`,
       `indirectusage`.`field_indirect_water_usage_value` `indirectusage`,
       (SELECT `note`.`field_use_notes_value` 
        FROM `dr_field_data_field_use_notes` `note` 
        WHERE `node`.`nid` = `note`.`entity_id`) `notes`
FROM `dr_node` `node`,
     `dr_field_data_field_type_direct` `dirtype`,
     `dr_taxonomy_term_data` `typedirect`,
     `dr_field_data_field_use_date` `date`,
     `dr_field_data_field_discretionary` `directdiscretionary`,
     `dr_taxonomy_term_data` `requireddirectterm`,
     `dr_field_data_field_direct_water_quality` `directquality`,
     `dr_taxonomy_term_data` `qualitydirectterm`,
     `dr_field_data_field_direct_location` `dirlocation`,
     `dr_taxonomy_term_data` `directlocterm`,
     `dr_field_data_field_direct_water_usage` `directusage`,
     `dr_field_data_field_indirect_required` `indirectrequired`,
     `dr_taxonomy_term_data` `indirectrequiredterm`,
     `dr_field_data_field_indirect_water_quality` `indirectquality`,
     `dr_taxonomy_term_data` `indirectqualityterm`,
     `dr_field_data_field_indirect_location` `indirectloc`,
     `dr_taxonomy_term_data` `indirectlocterm`,
     `dr_field_data_field_indirect_water_usage` `indirectusage`
WHERE `node`.`type` = 'test' AND
      `dirtype`.`entity_id` = `node`.`nid` AND
      `dirtype`.`field_type_direct_tid` = `typedirect`.`tid` AND
      `date`.`entity_id` = `node`.`nid` AND
      `directdiscretionary`.`entity_id` = `node`.`nid` AND
      `directdiscretionary`.`field_discretionary_tid` = `requireddirectterm`.`tid` AND
      `directquality`.`entity_id` = `node`.`nid` AND
      `directquality`.`field_direct_water_quality_tid` = `qualitydirectterm`.`tid` AND
      `dirlocation`.`entity_id` = `node`.`nid` AND
      `dirlocation`.`field_direct_location_tid` = `directlocterm`.`tid` AND
      `directusage`.`entity_id` = `node`.`nid` AND
      `indirectrequired`.`entity_id` = `node`.`nid` AND
      `indirectrequired`.`field_indirect_required_tid` = `indirectrequiredterm`.`tid` AND
      `indirectquality`.`entity_id` = `node`.`nid` AND
      `indirectquality`.`field_indirect_water_quality_tid` = `indirectqualityterm`.`tid` AND
      `indirectloc`.`entity_id` = `node`.`nid` AND
      `indirectloc`.`field_indirect_location_tid` = `indirectlocterm`.`tid` AND
      `indirectusage`.`entity_id` = `node`.`nid`

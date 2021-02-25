<?php

/**
 *
 */
class My_Model_Category extends Zend_Db_Table_Abstract {

   //put your code here
   protected $_name = "categories";

   //protected $_dependentTables = array('My_Model_MenuItem');

   /*protected $_referenceMap = array(
	   'Video' => array('columns' => array('id'),
		   'refTableClass' => 'Model_Menu',
		   'refColumns' => array('id'),
		   'onDelete' => self::CASCADE,
		   'onUpdate' => self::RESTRICT
	   )
   ); */

   public static function index() {
   }

   public static function getCategories() {
	  $userModel = new self();
	  $select    = $userModel->select();
	  $select->order(array('id', 'name'));
	  return $userModel->fetchAll($select);
   }

}
 
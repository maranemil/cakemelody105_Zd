<?php

/**
 *
 */
class My_Model_User extends Zend_Db_Table_Abstract
{

    //put your code here
    protected $_name = "users";
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


    public static function getUsers() {
        $userModel = new self();
        $select = $userModel->select();
        $select->order(array('id', 'username'));
        return $userModel->fetchAll($select);
    }

}
 
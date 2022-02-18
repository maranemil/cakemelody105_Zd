<?php

/**
 *
 */
class My_Model_Video extends Zend_Db_Table_Abstract
{

    //put your code here
    protected $_name = "videos";
    //protected $_dependentTables = array('My_Model_MenuItem');

    /*protected $_referenceMap = array(
        'Video' => array('columns' => array('id'),
            'refTableClass' => 'Model_Menu',
            'refColumns' => array('id'),
            'onDelete' => self::CASCADE,
            'onUpdate' => self::RESTRICT
        )
    ); */

    public static function index()
    {
    }

    public static function getVideos()
    {
        $userModel = new self();
        $select = $userModel->select();
        $select->order(array('id', 'bandname'));
        //return $userModel->fetchAll($select);
        return $userModel->fetchAll($select);
    }

    public static function getRandTags($limit = 4)
    {
        $userModel = new self();
        $select = $userModel->select(); // "tags"
        //$select->from("");
        //$select->join("");
        $select->where("tags!=''");
        //$select->columns("tags");
        $select->order(array('id'));
        $select->limit(0, $limit);
        //print_r($res);
        return $userModel->fetchAll($select);
    }
}
 
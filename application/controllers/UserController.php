<?php

class UserController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    /**
     *
     */
    public function indexAction()
    {
        // action Index
        $this->view->headTitle('User');
        $model = new My_Model_User();
        $users = $model->getUsers();

        //print_r($videos);
        $this->view->users = $users;

        //$page = $this->_getParam('page',1);
        //$paginator = Zend_Paginator::factory($videos);
        //$paginator->setItemCountPerPage(12);
        //$paginator->setCurrentPageNumber($page);
        //$this->view->paginator = $paginator;
    }

}


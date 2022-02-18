<?php

class VideoController extends Zend_Controller_Action
{

    /**
     *
     */
    public function init()
    {
        /* Initialize action controller here */
    }

    /**
     * @throws Zend_Paginator_Exception
     */
    public function indexAction()
    {
        // action Index
        $this->view->headTitle('Videos');
        $model = new My_Model_Video();
        $videos = $model->getVideos();

        //print_r($videos);
        //$this->view->videos = $videos;

        $page = $this->_getParam('page', 1);
        $paginator = Zend_Paginator::factory($videos);
        $paginator->setItemCountPerPage(12);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }

}


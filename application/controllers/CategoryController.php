<?php

class CategoryController extends Zend_Controller_Action
{

	public function init()
	{
		/* Initialize action controller here */
	}


	public function indexAction()
	{
		// action Index
		$this->view->headTitle('Category');
		$model = new My_Model_Category(); 
		$categs = $model->getCategories();
		
		//print_r($videos);
		$this->view->categs = $categs;

		//$page = $this->_getParam('page',1);
		//$paginator = Zend_Paginator::factory($videos);
		//$paginator->setItemCountPerPage(12);
		//$paginator->setCurrentPageNumber($page);
		//$this->view->paginator = $paginator; 
	}


}


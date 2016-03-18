<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index()
	{
		$data = $this->getData("cqssc", 0, array('method' => 'b'));
		$this->assign('data', $data);
		$this->display('index.tpl', $data);
	}

	public function getDate($day){
		$date = date("Y-m-d",strtotime("-".$day." day"));
		$dateArray = explode('-', $date);
		return array('year' => $dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);
	}

	public function getData($type, $preDay, $strategy){
		$date = $this->getDate($preDay);
		$this->load->model("lottery");
		return $this->lottery->getData($type, $date, $strategy);
	}
}

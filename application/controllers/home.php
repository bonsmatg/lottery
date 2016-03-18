<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index($type = "tjssc", $preDay = 2, $strategy = array('method' => 'b'))
	{
		$data = $this->getData($type, $preDay, $strategy);
		$this->assign('data', $data);
		$this->assign('type', $type);
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

	public function getDataByDate($type, $date, $strategy = array("method" => 'b')){
		$dateArray = explode('-', $date);
		$dateHashArray = array('year' => $dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);
		$this->load->model("lottery");
		$data = $this->lottery->getData($type, $dateHashArray, $strategy);
		$this->assign('data', $data);
		$this->display('index.tpl', $data);
	}
}

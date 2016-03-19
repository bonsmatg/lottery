<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index($type = "tjssc", $preDay = 3, $strategy = array('method' => 'b'))
	{
		$data = $this->getData($type, $preDay, $strategy);
		$this->assign('data', $data);
		$this->assign('type', $type);
		$this->assign('strategy', $strategy);
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

	public function getDataByDate($type){
		echo $type;
		var_dump($this->input->post());
		$strategy = array("method" => $this->input->post('mode'));
		$this->index($type, 3, $strategy);
//		$dateArray = explode('-', $date);
//		$dateHashArray = array('year' => $dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);
//		$this->load->model("lottery");
//		$data = $this->lottery->getData($type, $dateHashArray, $strategy);
//		$this->assign('data', $data);
//		$this->display('index.tpl', $data);
	}
}

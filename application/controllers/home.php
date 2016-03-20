<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index($type = "cqssc", $preDay = 0, $strategy = array('method' => 'b'))
	{
		$data = $this->getData($type, $preDay, $strategy);
		$this->assign('data', $data);
		$this->assign('type', $type);
		$this->assign('strategy', $strategy);
		$this->display('index.tpl', $data);
	}

    public function insertMax($type = "gd11x5"){
        $date= "2015-06-07";
        do {
            echo $date."<br>";
            $this->load->model("lottery");
            $dateArray = explode('-', $date);
            $dateVar = array('year' => $dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);
            foreach (array('b','s','o','e','c','m') as $value){
                $result = $this->lottery->getData($type, $dateVar, array('method' => $value));
                $this->lottery->insertMax($type, $date, $dateVar, $result[1], $value);
            }

            $date = date("Y-m-d", strtotime("$date +1 day"));
        }
        while($date != date("Y-m-d"));
//        while($date != "2009-11-11");

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
		$strategy = array("method" => $this->input->post('mode'));
		$this->index($type, 0, $strategy);
//		$dateArray = explode('-', $date);
//		$dateHashArray = array('year' => $dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);
//		$this->load->model("lottery");
//		$data = $this->lottery->getData($type, $dateHashArray, $strategy);
//		$this->assign('data', $data);
//		$this->display('index.tpl', $data);
	}
}

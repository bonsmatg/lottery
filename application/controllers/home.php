<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public $today;

	function __construct() {
		parent::__construct();
		$this->today = date('Y-m-d');
	}

	public function index($type = "cqssc")
	{
		$date = date('Y-m-d');
		$strategy = array("method" => 'b');
		$this->showData($type, $date, $strategy, -1);
	}

	public function showData($type, $date, $strategy, $option){
		$this->load->model("lottery");
        $data = $this->lottery->getData($type, $date, $strategy);

        while(empty($data)) {
            $date = date('Y-m-d', strtotime("$date $option day"));
            $data = $this->lottery->getData($type, $date, $strategy);
        }

		$this->assign('data', $data);
		$this->assign('type', $type);
		$this->assign('date', $date);
		$this->assign('today', $this->today);
		$this->assign('strategy', $strategy);
		$this->display('index.tpl', $data);
	}

	public function getDataByDate($type){
		$date = $this->input->post('date');
		$strategy = array("method" => $this->input->post('mode'));
		$this->showData($type, $date, $strategy, 1);
	}

    public function getPreNextData($type, $preOrNext){
        $date = $this->input->post('date');
        $strategy = array("method" => $this->input->post('mode'));

        $datePre = date('Y-m-d', strtotime("$date $preOrNext day"));
        $this->showData($type, $datePre, $strategy, $preOrNext);
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

    }
}

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index()
	{
		$this->load->model("lottery");
		$date = array('year' => 2007, 'month' => 4, 'day' => 1);
		$data = $this->lottery->getData("cqssc", $date, array('method' => "b"));
		print_r($data);
		$this->assign('data', $data);
		$this->display('index.tpl', $data);
	}
}

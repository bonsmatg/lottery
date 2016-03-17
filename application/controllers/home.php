<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

	public function index()
	{
		$this->load->model("lottery");
		$date = array('year' => date("Y"), 'month' => date("m"), 'day' => date("d") - 1);
		$data = $this->lottery->getData("tjssc", $date, array('method' => "b"));
		$this->assign('data', $data);
		$this->display('index.tpl', $data);
	}
}

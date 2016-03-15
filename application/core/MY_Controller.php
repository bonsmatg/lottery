<?php
if ( ! defined('BASEPATH') ) exit('No direct script access allowed');
class MY_Controller extends CI_Controller {
    public function __construct() {
        parent::__construct();
    }

    public function assign($key, $val)
    {
        $this->cismarty->assign($key, $val);
    }
     
    public function display($html)
    {
        $this->cismarty->display($html);
    }

    public function view($html, $data)
    {
        $this->cismarty->view($html, $data);
    }
}
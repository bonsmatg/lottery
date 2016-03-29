<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sync extends MY_Controller {

    function __construct() {
        parent::__construct();
    }

    public function index()
    {
        passthru("sh /var/www/html/sync.sh");
    }

}

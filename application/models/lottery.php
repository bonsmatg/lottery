<?php
header("Content-Type: text/html;charset=utf-8");

class Lottery extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function getData($lotteryType, $date, $strategy) {
        $condition = array('year' =>$date['year'], 'month' => $date['month'], 'day' => $date['day']);

        $this->db->where($condition);
        $rawData = $this->db->select('num,time,first,second,third,fourth,last')->from($lotteryType)
            ->order_by('num')->get()->result_array();
        foreach ($rawData as $key => $value) {
            foreach (array('first','second','third','fourth','last') as $keyOfNum) {
                $value[$keyOfNum] = array("num" => $value[$keyOfNum],
                    'info' => $this->compare(substr($lotteryType, 2),$rawData,$key,$value,$keyOfNum,$strategy));
//                print_r($this->compare(substr($lotteryType, 2),$rawData,$key,$value,$keyOfNum,$strategy));
            }
            $rawData[$key] = $value;
//            var_dump($rawData);
        }

        return $rawData;

    }

    function compare($category, $rawData, $key, $value, $keyOfNum, $strategy){

        if($category == 'ssc') {
            $type = array(  'b' => array('num' => [5,6,7,8,9], 'opposite' => 's'),
                            's' => array('num' => [0,1,2,3,4], 'opposite' => 'b'),
                            'o' => array('num' => [1,3,5,7,9], 'opposite' => 'e'),
                            'e' => array('num' => [0,2,4,6,8], 'opposite' => 'o'),
                            'c' => array('num' => [0,1,2,8,9], 'opposite' => 'm'),
                            'm' => array('num' => [3,4,5,6,7], 'opposite' => 'c')
            );
        }else{
            $type = array(  'b' => array('num' => [6,7,8,9,10,11], 'opposite' => 's'),
                            's' => array('num' => [1,2,3,4,5,6],   'opposite' => 'b'),
                            'o' => array('num' => [1,3,5,7,9,11],  'opposite' => 'e'),
                            'e' => array('num' => [2,4,6,8,10],    'opposite' => 'o'),
                            'c' => array('num' => [1,2,3,9,10,11], 'opposite' => 'm'),
                            'm' => array('num' => [4,5,6,7,8],     'opposite' => 'c')
            );
        }
        $result = 0;
        if(($key + 1) % 4 > 2) {
            if(in_array($value[$keyOfNum], $type[$type[$strategy['method']]['opposite']]['num'])){
                $result = 0;
            }
            else{
                if($key == 0){
                    $result = 1;
                }else{
                    $result = $rawData[$key - 1][$keyOfNum]['info']['result'] + 1;
                }
            }
        }else{
            if(in_array($value[$keyOfNum], $type[$strategy['method']]['num'])){
                $result = 0;
            }else{
                if($key == 0){
                    $result = 1;
                }else{
//                    var_dump($rawData[$key - 1][$keyOfNum]);
                    $result = $rawData[$key - 1][$keyOfNum]['info']['result'] + 1;
                }
            }
        }

        $result = array('result' => $result);
        return $result;

    }

}
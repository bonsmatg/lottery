<?php
header("Content-Type: text/html;charset=utf-8");

class Lottery extends CI_Model {

    public $maxNumber;
    function __construct() {
        parent::__construct();
    }

    function getData($lotteryType, $date, $strategy) {
        $this->maxNumber = [];
        $dateArray = explode('-', $date);
        $condition = array('year' =>$dateArray[0], 'month' => $dateArray[1], 'day' => $dateArray[2]);

        $this->db->where($condition);
        $rawData = $this->db->select('num,time,no,first,second,third,fourth,last')->from($lotteryType)
            ->order_by('num')->get()->result_array();
        if(empty($rawData)){
            return $rawData;
        }else{
            foreach ($rawData as $key => $value) {
                foreach (array('first','second','third','fourth','last') as $keyOfNum) {
                    $value[$keyOfNum] = array("num" => $value[$keyOfNum],
                        'info' => $this->compare(substr($lotteryType, 2),$rawData,$value,$keyOfNum,$strategy));
                }
                $rawData[$key] = $value;
            }
        }
        return [$rawData, $this->maxNumber];
    }

    function compare($category, $rawData, $value, $keyOfNum, $strategy){

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
        if(($value['no']) % 4 == 3 || ($value['no']) % 4 == 0) {
            if(in_array($value[$keyOfNum], $type[$type[$strategy['method']]['opposite']]['num'])){
                $result = 0;
            }
            else{
                if($value['no'] == 1){
                    $result = 1;
                }else{
                    $result = $rawData[$value['no'] - 2][$keyOfNum]['info']['result'] + 1;
                    if(array_key_exists($keyOfNum, $this->maxNumber)){
                        if($result > $this->maxNumber[$keyOfNum]){
                            $this->maxNumber[$keyOfNum] = $result;
                        }
                    }else{
                        $this->maxNumber[$keyOfNum] = $result;
                    }
                }
            }
        }else{
            if(in_array($value[$keyOfNum], $type[$strategy['method']]['num'])){
                $result = 0;
            }else{
                if($value['no'] == 1){
                    $result = 1;
                }else{
                    $result = $rawData[$value['no'] - 2][$keyOfNum]['info']['result'] + 1;
                    if(array_key_exists($keyOfNum, $this->maxNumber)){
                        if($result > $this->maxNumber[$keyOfNum]){
                            $this->maxNumber[$keyOfNum] = $result;
                        }
                    }else{
                        $this->maxNumber[$keyOfNum] = $result;
                    }
                }
            }
        }

        $result = array('result' => $result);
        return $result;

    }

    function insertMax($type, $date, $dateVar, $maxArray, $strategy){
        foreach ($maxArray as $pos => $value){
            $data = array(
                'type' => $type,
                'date' => $date,
                'year' => $dateVar['year'],
                'month' => $dateVar['month'],
                'day'   => $dateVar['day'],
                'weekday' => date("w",strtotime($date)),
                'position' => $pos,
                'strategy' => $strategy,
                'max' => $value
            );
            $this->db->insert('statistics',$data);
        }

    }

}
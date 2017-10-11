<?php

class Auth extends Controller
{
    
    public function getAuth($param)
    {
         if(count($param) != 1){
             return ['status'=>400, 'data'=>['there is not enough data']];
        }
        $model = new AuthModel();
        $time_life = $model->isLogin($param);
        $time_now =  time();
        if($time_life > $time_now)
            return ['status'=>200, 'data'=>true];
        return ['status'=>400, 'data'=>['hesh is not valid']];
    }
    
    public function postAuth($params)
    {
        if(count($params) != 4){
           //return ['status'=>200, 'data'=>['there is not enough data']]; 
            return ['status'=>400, 'data'=>['there is not enough data']];
        }
          
        $model = new AuthModel();
        $isUser = $model->isLoginExists($params['login']);
        if(!$isUser)
            return ['status'=>400, 'data'=>['login already exists']];
        
        $params['status'] = $this->setHash();
        $params['time_life'] =  time()+LIFE_ACTIVE_LOGIN;//1507554709
        $pass = md5($params['password']);
        $str= 'passsolt';
        $str = md5($str);
        $pass_db = md5($params['password'].$str);
        $params['password'] = $pass_db;

        return $model->createUser($params);
    }
    
    //active+life
     public function putAuth($params)
    {
       // return ['status'=>200, 'data'=>$params];
         //return ['status'=>200, 'data'=>$params['login']];
            if(count($params) != 2){
                return ['status'=>400, 'data'=>['there is not enough data']];
            }
            
            $pass = md5($params['password']);
            $str= 'passsolt';
            $str = md5($str);
            $pass_db = md5($params['password'].$str);
            $params['password'] = $pass_db;

            $model = new AuthModel();
            $isUser = $model->isUser($params['login']);
            if(!$isUser)
                return ['status'=>400, 'data'=>['user not exists']];
            
            $params['status'] = $this->setHash(); 
            $params['time_life'] =  time()+LIFE_ACTIVE_LOGIN;
            return $model->setLogin($params);
    }
    

    private function setHash(){
        $model = new AuthModel();
        $countUsers = $model->countUser();
        //generate rand string
        $randStr = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        $rand = '';
        for($i=0; $i<5; $i++) {
            $key = rand(0, strlen($randStr)-1);
            $rand .= $randStr[$key];
        }
        
        return md5($rand.$countUsers);
    }
}

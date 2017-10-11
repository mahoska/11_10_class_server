<template>
<div>
    <p class="bg-danger" id="err">{{err_param}}</p>
    <div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <figure>
            <figcaption><h3>{{carItem.name}}</h3></figcaption>
            <img alt="car"  :src="carItem.img"  style="height:200px;"/>
          </figure>
        </div>
        <table class="table panel_table">
          <tr>
            <td class="bold">Year of issue:</td>
            <td>{{carItem.year_of_issue}}</td>
          </tr>
          <tr>
            <td class="bold">Max speed:</td>
            <td>{{carItem.max_speed}}</td>
          </tr>
          <tr>
              <td class="bold">Price:</td>
              <td>{{carItem.price}} EUR</td>
          </tr>
          <tr>
              <td class="bold">Colors:</td>
              <td>
                  <ul v-for="color in carItem.colors">
                    <li>{{color}}</li>
                  </ul>
              </td>
          </tr>
        </table>
      </div> 

      <div class="order-form left ">
        <h4>Order form</h4>
        <p class="bg-success" id="isOrder" style="margin-top: 10px; color:blue; text-align: right;" >
          <b>{{isOrder}}</b>
        </p>
        <p class="bg-danger" id="err">{{err}}</p>
        <div  class="form-group">
          <input type="text" class="form-control"  placeholder="First Name" v-model.trim="first_name">
        </div>
        <div  class="form-group">
          <input type="text" class="form-control"  placeholder="Last Name" v-model.trim="last_name">
        </div>
        <label>Select Payment Method</label>
        <div class="form-group radio_div">
          <div class="radio">
            <input type="radio" id="cash"  name="payment_method" v-model="payment_method"  value="cash"   />
            <label for="cash" class="small_check">Cash</label>
          </div>
          <div class="radio">
            <input type="radio" id="credit_card" name="payment_method" v-model="payment_method"  value="credit card">
            <label for="credit_card" >Credit card</label>
          </div>
        </div> 
        <button class="btn add_bag_btn large" @click="ordered(carItem.info.id)">Create order</button>                         
      </div>
    </div>
</div>  
</template>

<script>
import axios from 'axios';
export default {
  name: 'carItem',
  data () {
    return {
      carItem: {},
      err: '',
      isOrder: "",
      first_name: "",
      last_name: "",
      payment_method: "cash",
      err_param:"",
      err_work:"",
      is_not_err_work :true,
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
      
  }
},
  created(){			
    var self = this		
     var id = this.$route.params.id
     //alert(id)
      axios.get('http://localhost:88/REST/client/api/cars/'+id+".json", this.config)
      
      //axios.get('http://192.168.0.15/~user15/REST/client/api/cars/'+id+".json", this.config)
            .then(function (response) {
              self.carItem = response.data['data'];

              console.log(response.data)
      })
      .catch(function (error) {
        console.log(error);
        //self.err_work = self.error_str
        //self.is_not_err_work = false;
      });
      
  },
  methods: {
    ordered(car_id){
      //проверка авторизации
      this.err = ""
      // //id_car, color, id_user, payment_method
      var req_str = "orderInfo[id_car]="+ car_id+"&orderInfo[color]="+this.color_order+"&orderInfo[id_user]="+this.client_id+"&orderInfo[payment_method]="+this.payment_method
      var self = this;
       var data = {
          "id_car":'1',
          "login":'blue',
          "password":'111',
          "payment_method":'cash'
        }
      axios.post('http://localhost:88/REST/client/api/order/', data, this.config)         
      //axios.post('http://192.168.0.15/~user15/REST/client/api/order/', data, this.config)
            .then(function (response) {
          console.log(answer)
          if(answer=='1') 
          self.isOrder = "Your order is accepted"
          self.payment_method = "cash"
          self.color_order = ''
          setTimeout(function () {
             self.isOrder = ""
          },1500);
                       
      })
      .catch(function (error) {
        console.log(error);
        //self.err_work = self.error_str
        //self.is_not_err_work = false;
      });
            
    }
        
  
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.centr{
	text-align:center;
}


.bold{
    font-weight: bold;
}

.panel_table td{
    text-align: left;
}

.left{
    text-align:left;
}

.add_bag_btn{
	background-color : black;
	color: white;
  width: 100%;
}

</style>

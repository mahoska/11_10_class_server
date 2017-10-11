<template>
        <div>
          <table class="table">
            <tr v-for="car in  cars"  >
              <td>
                <router-link  :to="'/carItem/'+car.id">
                  <img alt="car" class="car-img"  :src="car.img" @click="autoInfo(car.id)"/>
                </router-link>
              </td>
              <td>{{ car.brand }}</td>
              <td>{{ car.model }}</td>
            </tr>
          </table>
        </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'carList',
  data () {
    return {
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
      cars:{},
      //filter_cars: {},
      err_year: "",
      err_work: "",
      err_param:"",
      error_str : "We apologize, we have temporary problems with the service. return to us later"
  }
},
  created(){			
        var self = this
        axios.get('http://localhost:88/REST/client/api/cars/', this.config)
        // axios.get('http://192.168.0.15/~user15/REST/client/api/cars/', this.config)
              .then(function (response) {
                  self.cars = response.data['data'].cars
                  self.$emit('clear')
                  // console.log(self.cars);
        })
        .catch(function (error) {
          console.log(error);
          //self.err_work = self.error_str
          //self.is_not_err_work = false;
        });
  },

  methods: {
    autoInfo(car_id){
            //this.clearError()
            //this.clearFilter()
            this.$parent.$options.methods.clearFilter();
            //this.shortInfoCars = false
            //this.fullInfoCar = true
            var self = this
            /*
            myAjax.post("client.php","getCarInfo[car_id] = "+ car_id,
                function(dataCar){
                    var data = JSON.parse(dataCar)
                    if( data['sucess']== "1"){
                        self.carItem.info  = data['info']
                        self.carItem.colors  = data['colors']
                        self.fullInfoCarRedirect = true
                    }else{
                        if(data['error']!=""){
                           self.err_param = data['error']
                           self.is_not_err_param = false;
                       } else{
                        self.err_work = error_str
                         self.is_not_err_work = false;
                        }
                       
                    }
            });
            */
        },
        
  
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.car-img{
   max-height:100px;
   max-width:100px;
   cursor:pointer;
}



</style>

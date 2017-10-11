<template>
        <div>
          <table class="table">
            <tr v-for="car in  filters"  >
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
  name: 'carFilter',
  props: ['isFilter'],
  data () {
    return {
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
      cars:{},
      is_filter: true,
      err_year: "",
      err_work: "",
      err_param:"",
      error_str : "We apologize, we have temporary problems with the service. return to us later",

    



  }
},
  created(){						
    if (localStorage['filter_cars']) {
        this.cars =  JSON.parse(localStorage['filter_cars'])
    }  
  },
  computed:{    
    filters(){
      //alert(1)
      var filterList = this.cars
      if(this.isFilter  ||  !this.isFilter){
        if (localStorage['filter_cars']) {
          filterList =  JSON.parse(localStorage['filter_cars'])
        }  
      }
      return filterList
    }
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

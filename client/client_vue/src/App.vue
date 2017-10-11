<template>
  <div id="app">
    <!--img src="./assets/logo.png"-->
  <div class="carlist container centr">
     <div class="row">
        <div class="col-sm-6 col-md-4">

          <div class="reg_form" v-if="is_login">
            <div  class="form-group">
              <label for="login">Login</label>
              <input type="text" class="form-control" id="login"  placeholder="login" v-model.trim="login" >
            </div>
            <div  class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password" placeholder="password" v-model.trim="password" >
            </div>
            <button class="btn black_btn" @click="flogin" >login</button>
            <button class="btn black_btn" @click="open_registration">registration</button> 
          </div>

           <div class="reg_form" v-if="is_registr">
           <div  class="form-group">
              <label for="name">First name</label>
              <input type="text" class="form-control" id="name"  placeholder="name" v-model.trim="name" >
            </div>
            <div  class="form-group">
              <label for="sname">Last name</label>
              <input type="text" class="form-control" id="sname" placeholder="last name" v-model.trim="sname" >
            </div>
            <div  class="form-group">
              <label for="login">Login</label>
              <input type="text" class="form-control" id="login"  placeholder="login" v-model.trim="rlogin" >
            </div>
            <div  class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password" placeholder="password" v-model.trim="rpassword" >
            </div>
            <button class="btn black_btn" @click="registration">registration</button> 
            <button class="btn black_btn" @click="cancel" type="cancel">cancel</button>
          </div>

          <div class="reg_form" v-if="is_login_check">
           <div  class="form-group">
              <label for="name">You login as:{{login}}</label>
              <button class="btn black_btn" @click="logout" >Logout</button>
            </div>
          </div>

        <!--filter form-->
          <div class="filter_selection  filter-form">
            <div class="form-group">
              <label>Year (obligatory):</label>
                <div class="row">
                  <p class="bg-danger" id="err" style="width: 100%">{{err_year}}</p>
                  <div class="col-sm-6 col-md-6">
                    <input type="text" class="form-control"placeholder="from"  v-model.trim="year_from">   
                  </div> 
                  <div class="col-sm-6 col-md-6">
                    <input type="text" class="form-control" placeholder="to" v-model.trim="year_to" @blur="changeSelect()">
                  </div>
                </div>
              </div>
            <div class="form-group">
              <select id="brands" class="form-control"  v-model="brand" @change="changeSelect()">
                <option value="-">brands</option>
                <option v-for="brand in brands" :value="brand.id">
                  {{brand.name}}
                </option>
              </select>
            </div>
            <div class="form-group">
              <select id="models" class="form-control"  v-model="model" @change="changeSelect()">
                <option value="-">models</option>
                <option v-for="model in models" :value="model.id">
                  {{model.name}}
                </option>
              </select>
            </div>
  
            <div class="form-group">
              <label>Engine capacity:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from"  v-model.trim="engine_capacity_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control" placeholder="to" v-model.trim="engine_capacity_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Speed:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from" v-model.trim="speed_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control" placeholder="to" v-model.trim="speed_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Price:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from" v-model.trim="price_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                   <input type="text" class="form-control" placeholder="to" v-model.trim="price_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <select id="color" v-model="color" class="form-control" @change="changeSelect()">
                <option value="-">colors</option>
                <option  v-for="color in colors" :value="color.id">
                  {{color.name}}
                </option>
              </select>
            </div> 
            <button class="btn add_bag_btn large" @click="changeSelect()">Filter</button>
            <router-link class="btn add_bag_btn large" :to="'/'" style="margin-top:10px">
              Clear filter
            </router-link>
        </div>
      </div>


      <div class="col-sm-8 col-md-8">
        <img src="./assets/autoshop.png" class="img-logo" style="margin-bottom:20px">

        <router-view :isFilter="is_filter" @clear="clearFilter"/>
     </div>

      </div>
  </div>

  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'app',
  data () {
    return {
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
      models : {},
      brands : {},
      colors: {},
      model : '-',
      brand: '-',
      color: '-',
      year_from: '-',
      year_to: '-',
      speed_from: '-',
      speed_to: '-',
      engine_capacity_from: '-',
      engine_capacity_to: '-',
      price_from: '-',
      price_to: '-',
      cars: {},
      carsAll: {}, 
      //shortInfoCars: false,
      fullInfoCarRedirect : false,
      err_year: "",
      err_work: "",
      err_param:"",
      error_str : "We apologize, we have temporary problems with the service. return to us later",
    
      login:"",
      password:"",
      is_login:true,
      is_registr:false,
      is_login_check:false,
      name:"",
      sname:"",
      rlogin:"",
      rpassword:"",

      is_filter:true
  }
},
created(){
var self = this
      axios.get('http://localhost:88/REST/client/api/cars/', this.config)
      // axios.get('http://192.168.0.15/~user15/REST/client/api/cars/', this.config)
            .then(function (response) {
                //self.cars = response.data['data'].cars
                self.carsAll = response.data['data'].cars
                self.models = response.data['data'].models
                self.brands = response.data['data'].brands
                self.colors = response.data['data'].colors
                //console.log(self.cars)
                //if (localStorage['filter_cars']) {
                   //self.cars =  JSON.parse(localStorage['filter_cars'])
                //}
                 //localStorage['filter_cars'] = JSON.stringify(self.cars)

      })
      .catch(function (error) {
        console.log(error);
        //self.err_work = self.error_str
        //self.is_not_err_work = false;
      });
  },
  methods:{


        changeSelect(){
       var self = this
        if(this.fullInfoCarRedirect == true)this.cars =  this.carsAll 
          if(this.year_from!='-' && this.year_to=='-') 
              this.year_to = this.year_from
          var self = this          
          if(this.year_to == "-" || this.year_from == "-") this.err_year = "this parameter is required"
            else{
              this.err_year = ""
              if(this.speed_from!='-' && this.speed_to=='-') 
                 this.speed_to = this.speed_from
              if(this.price_from!='-' && this.price_to=='-') 
                 this.price_to = this.price_from
                
              if(this.engine_capacity_from!='-' && this.engine_capacity_to=='-') 
                 this.engine_capacity_to = this.engine_capacity_from
              var req_str = this.year_from+"/"+this.year_to+"/"
                +this.model+"/"+this.brand +"/"+this.engine_capacity_from+"/"+this.engine_capacity_to
                +"/"+this.speed_from+ "/"+this.speed_to+"/"+this.price_from+"/"+this.price_to+"/"+this.color+"/"
              axios.get("http://localhost:88/REST/client/api/cars/"+req_str, this.config)
              // axios.get('http://192.168.0.15/~user15/REST/client/api/cars/'+req_str, this.config)
                .then(function (response) {
                    localStorage['filter_cars'] = JSON.stringify(response.data['data'])
                    //self.fullInfoCarRedirect = false
                    //if(self.is_filter == true)self.is_filter=false
                    //else self.is_filter=true
                    self.is_filter = !self.is_filter
                    //alert(self.is_filter )
                    self.$router.push('/carFilter/')
                  })
              .catch(function (error) {
                self.err_work = self.error_str
                self.is_not_err_work = false;
                console.log(error);
              });
              //this.$router.push('/carFilter/')
           }
            
        },

        open_registration(){
            this.is_login = false
            this.is_registr = true
            this.is_login_check = false
        },

        registration(){
          var data = new FormData()
          data.append("login", this.rlogin)
          data.append("password",this.rpassword)
          data.append("name",this.name)
          data.append("sname",this.sname)
          var self = this
            axios.post('http://localhost:88/REST/client/api/auth/', data, this.config)         
            //axios.post('http://192.168.0.15/~user15/REST/client/api/auth/', data, this.config)
            .then(function (response) {
              console.log(response)
              self.is_login_check = true
              self.is_login = false
              self.is_registr = false
              self.login = self.rlogin
              localStorage['hash_log'] = JSON.stringify(response.data['data'])
              //alert("log")
              /*setTimeout(function () {
                self.isOrder = ""
              },1500);*/
                       
          })
          .catch(function (error) {
            console.log(error);
          });
        
        },

        flogin(){
          var self = this
          /*    var data = new FormData()
          data.append("login", this.rlogin)
          data.append("password",this.rpassword)*/
          //axios.put('http://192.168.0.15/~user15/REST/client/api/auth/', 
          axios.put('http://localhost:88/REST/client/api/auth/', 
          {
          login: this.login,
          password: this.password
          }, this.config)
          .then(function (response) {
            console.log(response.data);
            self.is_login_check = true
            self.is_login = false
            self.is_registr = false
            localStorage['hash_log'] = JSON.stringify(response.data['data'])
          })
          .catch(function (error) {
            console.log(error);
          });
        },

        logout(){
            localStorage['hash_log'] = ""
            this.is_login_check = false
            this.is_login = true
            this.is_registr = false
            this.login = ""
        },

        cancel(){
            this.is_login = true
            this.is_registr = false
            this.is_login_check = false
            this.rlogin = this.rpassword = this.name = this.sname = ""
        },
        
        clearFilter(){
            this.model = '-'
            this.brand = '-'
            this.color = '-'
            this.year_from = '-'
            this.year_to = '-'
            this.speed_from = '-'
            this.speed_to = '-'
            this.engine_capacity_from = '-'
            this.engine_capacity_to = '-'
            this.price_from = '-'
            this.price_to = '-' 
            this.err_year = ''
        }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 20px;
}

.filter-form{
	margin-bottom:10px;
}

.filter-form label{
   font-weight: bold;
}

.add_bag_btn{
	background-color : black;
	color: white;
  width:100%;

}

.black_btn{
	background-color : black;
	color: white;
  width:40%;
  margin-left:5%;
}

.reg_form{
  border: 1px solid lightgray;
  border-radius: 5px;
  padding:20px;
  text-align: left;
  margin-bottom:20px;
}

.img-logo{
  width:100%;
}
</style>

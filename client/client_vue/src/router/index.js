import Vue from 'vue'
import Router from 'vue-router'
import CarList from '@/components/CarList'
import CarItem from '@/components/CarItem'
import CarFilter from '@/components/CarFilter'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'carList',
      component: CarList
    },
    {
      path: '/carItem/:id',
      name: 'CarItem',
      component: CarItem
    },
    ,
    {
      //path: '/carFilter/:year_from/:year_to/:model/:brand/:engine_capacity_from/:engine_capacity_to/:speed_from/:speed_to/:price_from/:price_to/:color',
      path: '/carFilter/',
      name: 'CarFilter',
      component: CarFilter
    },
  ]
})


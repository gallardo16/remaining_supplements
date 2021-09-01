import Vue from 'vue'
import Supplements from '../supplements.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Supplements)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})

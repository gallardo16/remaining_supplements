import Vue from 'vue'
import Supplements from '../supplements.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-supplements'
  const supplements = document.querySelector(selector)
  if (supplements) {
    new Vue({
      render: (h) => h(Supplements)
    }).$mount(selector)
  }
})

import Vue from 'vue/dist/vue.esm'
import modal from '../modal.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#modal',
    components: { modal }
  })
})
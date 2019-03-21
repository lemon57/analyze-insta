import Vue from 'vue'
import Sheet from '../components/sheet.vue'
import Vuetify from 'vuetify'
import TurbolinksAdapter from 'vue-turbolinks'

 Vue.use(Vuetify)
 Vue.use(TurbolinksAdapter)
document.addEventListener('turbolinks:load', () => {
  // var el = document.body.appendChild(document.createElement('hello'))
  var el = '[data-behavior="vue1"]';
  // var el = document.getElementById('hello')
  if (el != null) {
  var app = new Vue({
    el,
    render: h => h(Sheet),
    // el: el,
    // template: '<App/>',
    // components: { App },
  })
  }
  console.log(app)
})

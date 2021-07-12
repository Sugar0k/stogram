// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require popper
// //= require jquery
// //= require jquery_ujs
// import 'core-js/stable'
// import 'regenerator-runtime/runtime'
import "../controllers/posts"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import "bootstrap"
// import "jquery"
// import "popper"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


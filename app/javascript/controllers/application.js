import { Application } from "@hotwired/stimulus"

// app/assets/javascripts/application.js
console.log("JavaScript loaded!");

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-email"
export default class extends Controller {
    static targets = [ "newEmailModal" ]
  connect() {
      console.log("NewEmailController connected")
  }
}

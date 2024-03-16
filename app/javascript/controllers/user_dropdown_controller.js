import { Controller } from "@hotwired/stimulus"

export default class UserController extends Controller {
  static targets = [ "dropdown" ]

  toggleDropdown(event) {
    event.preventDefault()
    this.dropdownTarget.classList.toggle('hidden')
  }
}

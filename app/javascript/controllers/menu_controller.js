import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "searchModal" ]
  connect() {
  }

  toggleSearchModal(event) {
    event.preventDefault()
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    this.searchModalTarget.classList.toggle('hidden')
    const modalState = rootController.searchModalOpen
    rootController.setSearchModalOpen(!modalState)
  }
}

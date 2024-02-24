import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.searchModalOpen = false
    this.userModalOpen = false
  }

  setSearchModalOpen(state) {
    this.searchModalOpen = state
  }

  setUserModalOpen(state) {
    this.userModalOpen = state
  }
}

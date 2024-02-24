import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.searchModalOpen = false
  }

  setSearchModalOpen(state) {
    this.searchModalOpen = state
  }
}

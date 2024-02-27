import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "searchModal", "userModal", "userSettingsModal" ]
  connect() {
  }

  toggleSearchModal(event) {
    event.preventDefault()
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    this.searchModalTarget.classList.toggle('hidden')
    const modalState = rootController.searchModalOpen
    rootController.setSearchModalOpen(!modalState)
  }

  toggleUserModal(event) {
    event.preventDefault()
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    this.userModalTarget.classList.toggle('hidden')
    const modalState = rootController.userModalOpen
    rootController.setUserModalOpen(!modalState)
  }

  openUserSettingsModal(event) {
    event.preventDefault()
    this.toggleUserModal(event)
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    this.userSettingsModalTarget.classList.toggle('hidden')
    const modalState = rootController.userSettingsModalOpen
    rootController.setUserSettingsModalOpen(!modalState)
  }

  closeUserSettingsModal(event) {
    event.preventDefault()
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    this.userSettingsModalTarget.classList.toggle('hidden')
    const modalState = rootController.userSettingsModalOpen
    rootController.setUserSettingsModalOpen(!modalState)
  }
}

import { Controller } from "@hotwired/stimulus"

export default class SearchController extends Controller {
  static targets = [ "searchItem", "searchModal" ]

  connect() {
    this.listItemIndex = 0
    this.highlight()
    this.searchKeydown = this.searchKeydown.bind(this)
    window.addEventListener('searchKeydown', this.searchKeydown)
  }

  disconnect() {
    window.removeEventListener('searchKeydown', this.searchKeydown)
  }

  next() {
    this.listItemIndex++
    if (this.listItemIndex >= this.searchItemTargets.length) {
      this.listItemIndex = 0
    }
    this.highlight()
  }

  previous() {
    this.listItemIndex--
    if (this.listItemIndex < 0) {
      this.listItemIndex = this.searchItemTargets.length - 1
    }
    this.highlight()
  }

  highlight() {
    this.searchItemTargets.forEach((element, idx) => {
      element.classList.toggle('search-item-highlight', idx === this.listItemIndex)
    })
  }

  openSearchModal() {
    this.searchModalTarget.classList.remove('hidden')
  }

  closeSearchModal() {
    this.searchModalTarget.classList.add('hidden')
  }

  searchKeydown(event) {
    const rootController = this.application.controllers.find(c => c.identifier === "root")

    if (event.keyCode === 191) {
      this.openSearchModal()
      rootController.setSearchModalOpen(true)
    }

    if (event.key === 'Escape') {
      this.closeSearchModal()
      rootController.setSearchModalOpen(false)
    }

    if (event.key === 'ArrowUp') {
      if (rootController.searchModalOpen) {
        this.previous()
      }
    }

    if (event.key === 'ArrowDown') {
      if (rootController.searchModalOpen) {
        this.next()
      }
    }
  }
}

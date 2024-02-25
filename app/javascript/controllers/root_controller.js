import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filter" ]
  connect() {
    this.filterIndex = 0
    this.highlightFilter()

    this.searchModalOpen = false
    this.userModalOpen = false
  }

  setSearchModalOpen(state) {
    this.searchModalOpen = state
  }

  setUserModalOpen(state) {
    this.userModalOpen = state
  }

  highlightFilter() {
    this.filterTargets.forEach((filter, index) => {
      filter.classList.toggle("text-neutral-900", index === this.filterIndex)
      filter.classList.toggle("bg-neutral-200", index === this.filterIndex)
      filter.classList.toggle("dark:text-white", index === this.filterIndex)
      filter.classList.toggle("dark:bg-neutral-800/80", index === this.filterIndex)
    })
  }

  nextFilter() {
    this.filterIndex++
    if (this.filterIndex >= this.filterTargets.length) {
      this.filterIndex = 0
    }
    this.highlightFilter()
  }

  navbarKeydown(event) {
    if(event.key === 'Tab') {
      event.preventDefault()
      this.nextFilter()
    }
  }
}

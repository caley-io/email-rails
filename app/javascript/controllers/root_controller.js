import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filter", "listItem" ]
  connect() {
    this.filterIndex = 0
    this.highlightFilter()
    this.listItemIndex = 0
    this.highlightListItem()

    this.searchModalOpen = false
    this.userModalOpen = false
    this.userSettingsModalOpen = false
  }

  setSearchModalOpen(state) {
    this.searchModalOpen = state
  }

  setUserModalOpen(state) {
    this.userModalOpen = state
  }

  setUserSettingsModalOpen(state) {
    this.userSettingsModalOpen = state
  }

  highlightFilter() {
    this.filterTargets.forEach((filter, index) => {
      filter.classList.toggle("text-neutral-900", index === this.filterIndex)
      filter.classList.toggle("bg-neutral-200", index === this.filterIndex)
      filter.classList.toggle("dark:text-white", index === this.filterIndex)
      filter.classList.toggle("dark:bg-neutral-700/50", index === this.filterIndex)
    })
  }

  highlightListItem() {
    this.listItemTargets.forEach((listItem, index) => {
      // listItem.classList.toggle("text-neutral-900", index === this.listItemIndex)
      listItem.classList.toggle("bg-neutral-200/70", index === this.listItemIndex)
      // listItem.classList.toggle("dark:text-white", index === this.listItemIndex)
      listItem.classList.toggle("dark:bg-neutral-700/50", index === this.listItemIndex)
    })
  }

  nextFilter() {
    this.filterIndex++
    if (this.filterIndex >= this.filterTargets.length) {
      this.filterIndex = 0
    }
    this.highlightFilter()
  }

  nextListItem() {
    this.listItemIndex++
    if (this.listItemIndex >= this.listItemTargets.length) {
      this.listItemIndex = 0
    }
    this.highlightListItem()
  }

  previousListItem() {
    this.listItemIndex--
    if (this.listItemIndex < 0) {
      this.listItemIndex = this.listItemTargets.length - 1
    }
    this.highlightListItem()
  }

  rootKeydown(event) {
    if(event.key === 'Tab') {
      if (this.searchModalOpen || this.userModalOpen || this.userSettingsModalOpen) {
        event.preventDefault()
      } else {
        event.preventDefault()
        this.nextFilter()
      }
    }
    if(event.key === 'ArrowDown') {
      if (this.searchModalOpen || this.userModalOpen || this.userSettingsModalOpen) {
        event.preventDefault()
      } else {
        event.preventDefault()
        this.nextListItem()
      }
    }
    if(event.key === 'ArrowUp') {
      if (this.searchModalOpen || this.userModalOpen || this.userSettingsModalOpen) {
        event.preventDefault()
      } else {
        event.preventDefault()
        this.previousListItem()
      }
    }
  }
}

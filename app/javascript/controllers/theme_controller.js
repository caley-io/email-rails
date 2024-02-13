import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = [ "body", "moon", "sun"]

  connect() {
    this.currentTheme = localStorage.getItem('theme');
    this.setTheme()
    this.setToggle()
  }

  saveTheme(theme) {
    localStorage.setItem('theme', theme);
  }

  setTheme() {
    if (this.currentTheme === 'dark') {
      this.bodyTarget.classList.add('dark')
    } else {
      this.bodyTarget.classList.remove('dark')
    }
  }

  setToggle() {
    if (this.currentTheme === 'dark') {
      this.sunTarget.classList.add('hidden')
    } else {
      this.moonTarget.classList.add('hidden')
    }
  }

  toggle() {
    let theme = localStorage.getItem('theme');
    if (theme === 'dark') {
      this.bodyTarget.classList.remove('dark')
      this.sunTarget.classList.remove('hidden')
      this.moonTarget.classList.add('hidden')
      this.saveTheme('light');
    } else {
      this.bodyTarget.classList.add('dark')
      this.sunTarget.classList.add('hidden')
      this.moonTarget.classList.remove('hidden')
      this.saveTheme('dark')
    }
  }
}

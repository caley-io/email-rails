import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = [ "body"]

  connect() {
    this.currentTheme = localStorage.getItem('theme');
    this.setTheme()
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

  toggle() {
    let theme = localStorage.getItem('theme');
    if (theme === 'dark') {
      this.bodyTarget.classList.remove('dark')
      this.saveTheme('light');
    } else {
      this.bodyTarget.classList.add('dark')
      this.saveTheme('dark')
    }
  }
}

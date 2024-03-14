import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["body"]

  connect() {
    this.currentTheme = localStorage.getItem('theme');
    this.setAppTheme()
  }

  saveTheme(theme) {
    localStorage.setItem('theme', theme);
  }

  setAppTheme() {
    if (this.currentTheme === 'dark') {
      this.setDarkTheme()
    } else {
      this.setLightTheme()
    }
  }

  // TODO: Fix this ugly mess
  setLightTheme() {
    this.bodyTarget.classList.remove('dark')
    this.saveTheme('light');
  }

  // TODO: Fix this ugly mess
  setDarkTheme() {
    this.bodyTarget.classList.add('dark')
    this.saveTheme('dark');
  }
}

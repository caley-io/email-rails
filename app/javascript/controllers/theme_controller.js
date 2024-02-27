import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = [ "body", "moon", "sun"]

  connect() {
    this.currentTheme = localStorage.getItem('theme');
    this.setAppTheme()
  }

  saveTheme(theme) {
    localStorage.setItem('theme', theme);
  }

  setAppTheme() {
    if (this.currentTheme === 'dark' || this.currentTheme === null) {
      this.setDarkTheme()
    } else {
      this.setLightTheme()
    }
  }

  // TODO: Fix this ugly mess
  setLightTheme() {
    this.bodyTarget.classList.remove('dark')
    this.sunTarget.classList.remove('border-transparent')
    this.sunTarget.classList.add('border-emerald-300')
    this.moonTarget.classList.add('border-transparent')
    this.moonTarget.classList.remove('border-emerald-300')
    this.saveTheme('light');
  }

  // TODO: Fix this ugly mess
  setDarkTheme() {
    this.bodyTarget.classList.add('dark')
    this.moonTarget.classList.remove('border-transparent')
    this.moonTarget.classList.add('border-emerald-300')
    this.sunTarget.classList.add('border-transparent')
    this.sunTarget.classList.remove('border-emerald-300')
    this.saveTheme('dark');
  }

}

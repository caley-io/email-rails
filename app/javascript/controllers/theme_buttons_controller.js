import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-buttons"
export default class extends Controller {
  static targets = ["moon", "sun"]

  connect() {
    this.currentTheme = localStorage.getItem('theme');
    this.setActiveThemeButton()
  }

  setActiveThemeButton() {
    if (this.currentTheme === "light") {
      this.sunTarget.classList.remove('border-transparent')
      this.sunTarget.classList.add('border-emerald-300')
      this.moonTarget.classList.add('border-transparent')
      this.moonTarget.classList.remove('border-emerald-300')
    } else {
      this.moonTarget.classList.remove('border-transparent')
      this.moonTarget.classList.add('border-emerald-300')
      this.sunTarget.classList.add('border-transparent')
      this.sunTarget.classList.remove('border-emerald-300')
    }
  }
}

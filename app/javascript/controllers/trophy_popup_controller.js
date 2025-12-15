import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { show: Boolean }

  connect() {
    if (this.showValue) {
      this.open()
    }
  }

  open() {
    this.element.classList.add("is-visible")
    // Confettis 
  }

  close() {
    this.element.classList.remove("is-visible")
  }
}
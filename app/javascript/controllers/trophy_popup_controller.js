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
   window.confetti({
    particleCount: 120,
    spread: 70,
    origin: { y: 0.6 },
    disableForReducedMotion: true
  })
}
  close() {
    this.element.classList.remove("is-visible")
    // Révéler les trophées cachés après avoir fermé la popup
    const hiddenTrophies = document.querySelector(".hidden-trophies")
    if (hiddenTrophies) {
      hiddenTrophies.style.display = "block"
    }
  }
}
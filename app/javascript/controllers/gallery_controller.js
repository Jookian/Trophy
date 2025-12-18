import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]
  static values = { index: Number }

  open(event) {
     console.log("📸 gallery open")
    this.modalTarget.classList.add("is-visible")

    const index = event.currentTarget.dataset.galleryIndexValue
    const images = this.modalTarget.querySelectorAll(".gallery-image")

    images[index]?.scrollIntoView({ behavior: "instant", inline: "center" })
  }

  close() {
    this.modalTarget.classList.remove("is-visible")
  }
}

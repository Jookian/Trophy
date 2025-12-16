
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["popup"]

   connect() {
    console.log("✅ Confirm controller connected")
  }

  open(event) {
    event.preventDefault()
    this.formId = event.currentTarget.dataset.confirmFormId
    this.popupTarget.classList.add("is-visible")
  }

  close() {
    this.popupTarget.classList.remove("is-visible")
  }

  confirm() {
    document.getElementById(this.formId).submit()
  }
}

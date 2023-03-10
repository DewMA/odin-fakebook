import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    document.getElementById("modal").style.display = "flex"
    document.getElementById("container").style.overflow = "hidden"
  }

  closeModal(){
    document.getElementById("modal").style.display = "none"
    document.getElementById("container").style.overflow = "scroll"
  }
}

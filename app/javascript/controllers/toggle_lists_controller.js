import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-lists"
export default class extends Controller {
  connect() {
    console.log("Hello from toggle_controller.js")
  }

  static targets = ["myBookings","myServices", "myGigs"]

  firemyBookings() {
    console.log("firemyBookings")
    this.myBookingsTarget.classList.remove("d-none")
    this.myServicesTarget.classList.add("d-none");
    this.myGigsTarget.classList.add("d-none");
  }
  firemyServices() {
    console.log("firemyServices")
    this.myBookingsTarget.classList.add("d-none")
    this.myServicesTarget.classList.remove("d-none");
    this.myGigsTarget.classList.add("d-none");
  }
  firemyGigs() {
    console.log("firemyGigs")
    this.myBookingsTarget.classList.add("d-none")
    this.myServicesTarget.classList.add("d-none");
    this.myGigsTarget.classList.remove("d-none");
  }
}

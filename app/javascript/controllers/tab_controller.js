import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["activeBookings", "pastBookings", "pastBookingsBtn", "activeBookingsBtn"]

  toggleActive() {
    this.activeBookingsTarget.classList.remove("d-none");
    this.pastBookingsTarget.classList.add("d-none");
    this.activeBookingsBtnTarget.classList.add("btn-white");
    this.pastBookingsBtnTarget.classList.remove("btn-white");
    this.pastBookingsBtnTarget.classList.add("btn-ghost");
  }

  togglePast() {
    this.activeBookingsTarget.classList.add("d-none");
    this.pastBookingsTarget.classList.remove("d-none");
    this.pastBookingsBtnTarget.classList.add("btn-white");
    this.activeBookingsBtnTarget.classList.remove("btn-white");
    this.activeBookingsBtnTarget.classList.add("btn-ghost");
  }

  connect() {
    console.log("Hello from toggle_controller.js")
  }
}

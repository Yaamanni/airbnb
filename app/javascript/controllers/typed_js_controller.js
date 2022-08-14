import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Grab and book now, Mai Tu Liao!", "Your next adventure awaits!"],
      typeSpeed: 55,
      backSpeed: 0,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    });
  }
}

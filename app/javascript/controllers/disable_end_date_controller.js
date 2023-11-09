
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-end-date"
export default class extends Controller {
  static values = {
    endDateTarget: String,
  }

  connect() {
    this.initialize()
  }

  initialize() {
    this.endDateTarget = document.getElementById('work_experience_end_date');
    this.element.setAttribute("data-action", "click->disable-end-date#disableEndDate");
    this.disableEndDate();
  }

  disableEndDate() {
    if (this.element.checked) {
      this.endDateTarget.value = null;
      this.endDateTarget.setAttribute("disabled", true);
    } else {
      this.endDateTarget.removeAttribute("disabled");
    }
  }
}

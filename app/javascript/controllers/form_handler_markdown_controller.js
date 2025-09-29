import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-handler-markdown"
export default class extends Controller {
  beforeSubmit(event) {
    // Find all elements with the markdown controller
    const markdownElements = this.element.querySelectorAll("[data-controller~='markdown']");

    markdownElements.forEach((el) => {
      const controller = this.application.getControllerForElementAndIdentifier(el, "markdown");
      if (controller && typeof controller.sync === "function") {
        console.log("calling sync for element " + el);
        controller.sync();
      }
    });

    // Now all textarea values are updated and ready for submit
  }
}

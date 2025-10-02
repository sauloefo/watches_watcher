import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    formFieldId: String
  }

  connect() {
    this.verifyElementIsDialog()
  }

  setFormField(event) {
    const countryName = event.target.value

    const field = document.getElementById(this.formFieldIdValue)

    field.value = countryName

    this.modal.close()
  }

  verifyElementIsDialog() {
    const tagName = this.element.tagName
    if (tagName !== "DIALOG") {
      throw new Error(`country-picker must be attached to a dialog element instead of ${tagName}`)
    }
  }

  get modal() {
    return this.element
  }
}

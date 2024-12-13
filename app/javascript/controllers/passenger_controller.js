// app/javascript/controllers/passengers_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "container", "template", "fields", "removeButton" ]

  connect() {
    console.log("Passengers controller connected!")
    console.log("Container target:", this.containerTarget)
    console.log("Template target:", this.templateTarget)
    console.log("Fields targets:", this.fieldsTargets)
    console.log("Remove button targets:", this.removeButtonTargets)
    this.updateRemoveButtons()
  }

  add(event) {
    console.log("Add button clicked!")
    event.preventDefault()
    
    // Get template content and replace placeholder index
    console.log("Template content before:", this.templateTarget.innerHTML)
    const content = this.templateTarget.innerHTML
      .replace(/NEW_RECORD/g, new Date().getTime())
      .replace(/_index_/g, this.fieldsTargets.length + 1)
    console.log("Content after replacement:", content)
    
    // Add new fields to the container
    this.containerTarget.insertAdjacentHTML('beforeend', content)
    console.log("New fields added to container")
    this.updateRemoveButtons()
  }

  remove(event) {
    console.log("Remove button clicked!")
    event.preventDefault()
    
    const fields = event.target.closest('[data-passengers-target="fields"]')
    fields.remove()
    
    // Update passenger numbers
    this.fieldsTargets.forEach((field, index) => {
      const heading = field.querySelector('h3')
      if (heading) {
        heading.textContent = `Passenger ${index + 1}`
      }
    })
    
    this.updateRemoveButtons()
  }

  updateRemoveButtons() {
    console.log("Updating remove buttons. Fields count:", this.fieldsTargets.length)
    // Hide remove buttons if only one passenger remains
    const shouldHideButtons = this.fieldsTargets.length <= 1
    this.removeButtonTargets.forEach(button => {
      button.style.display = shouldHideButtons ? 'none' : 'block'
    })
  }
}
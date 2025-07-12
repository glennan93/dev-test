import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["make", "model"]

    connect() {
        console.log("CarFormController connected")
    }

    makeChanged() {
        console.log("Make changed")
        const makeId = this.makeTarget.value
        fetch(`/models/for_make?make_id=${makeId}`)
        .then(response => response.json())
        .then(models => {
            this.modelTarget.innerHTML = '<option value="">Select a Model</option>'
            models.forEach(model => {
                const option = document.createElement("option")
                option.value = model.id
                option.text = model.name
                this.modelTarget.appendChild(option)
            })
        })
    }
}
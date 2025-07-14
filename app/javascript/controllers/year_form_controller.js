import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["make", "model", "year"]

    connect() {
        console.log("YearFormController connected")
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
            // Resets year selection when make is changed
            this.yearTarget.innerHTML = '<option value="">Select a Year</option>'
        })
    }

    modelChanged() {
        console.log("Model changed")
        const makeId = this.makeTarget.value
        const modelId = this.modelTarget.value
        fetch(`/years/for_model?make_id=${makeId}&model_id=${modelId}`)
            .then(response => response.json())
            .then(years => {
                this.yearTarget.innerHTML = '<option value="">Select a Year</option>'
                years.forEach(year => {
                    const option = document.createElement("option")
                    option.value = year.id
                    option.text = year.year
                    this.yearTarget.appendChild(option)
                })
            })
    }
}
// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import CarFormController from "controllers/car_form_controller"
import YearFormController from "controllers/year_form_controller"
application.register("car-form", CarFormController)
application.register("year-form", YearFormController)
eagerLoadControllersFrom("controllers", application)

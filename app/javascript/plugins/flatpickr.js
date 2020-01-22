import flatpickr from "flatpickr"
import { Russian } from "flatpickr/dist/l10n/ru"
require("flatpickr/dist/flatpickr.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        enableTime: true,
        time_24hr: true,
        dateFormat: "d-m-Y H:i",
        minDate: new Date(),
        locale: Russian,

    })
})
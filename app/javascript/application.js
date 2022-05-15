// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

$(function() {
$(".alert").delay(4000).slideUp(200, function() {
    $(this).alert('close');
});
});
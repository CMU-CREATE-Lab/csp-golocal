# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

## NOTE: Bootstrap 3 can't use imports
#pin "jquery", to: "https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"
#pin "bootstrap", to: "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
pin "marked", to: "https://ga.jspm.io/npm:marked@16.3.0/lib/marked.esm.js"

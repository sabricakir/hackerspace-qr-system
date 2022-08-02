import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets=["email", "password", "password_confirmation"]
    
    emailHide(e){
        this.emailTarget.classList.toggle("hidden-field")
    }
    passwordHide(e){
        this.passwordTarget.classList.toggle("hidden-field")
        this.password_confirmationTarget.classList.toggle("hidden-field")
    }
}

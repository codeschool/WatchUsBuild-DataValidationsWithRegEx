class @Validation

  nameRegex = /[a-z\s]+/

  checkName: () ->
    form = $('#new_registration')
    form.submit (event) =>
      nameEle = $('#registration_name')
      name = nameEle.val()
      if(!name.match(nameRegex))
        event.preventDefault()
        alert('Your name cannot contain numbers')

$(document).ready () =>
  val = new Validation()
  val.checkName()

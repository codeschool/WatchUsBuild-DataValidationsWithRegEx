class @Validation

  nameRegex = /[a-z\s]+/

  checkName: () ->
    form = $('#new_registration')
    form.submit (event) =>
      nameEle = $('#registration_name')
      name = nameEle.val()
      if(!name.match(nameRegex))
        event.preventDefault()

$(document).ready () =>
  val = new Validation()
  val.checkName()

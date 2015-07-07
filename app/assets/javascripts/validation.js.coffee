class @Validation

  nameRegex = /^[a-z\s]+$/

  checkName: () ->
    form = $('#new_registration')
    form.submit (event) =>
      @nameEle = $('#registration_name')
      @validateName()

  validateName: () ->
    name = @nameEle.val()
    if(!name.match(nameRegex))
      event.preventDefault()
      @addError()
      alert('Your name only be lowercase letters and spaces.')
    else
      @addGood()

  addError: () ->
    @nameEle.addClass('error').removeClass('good')

  addGood: () ->
    @nameEle.addClass('good').removeClass('error')
    

$(document).ready () =>
  val = new Validation()
  val.checkName()




class @Validation

  nameRegex = /^[a-z\s]+$/

  checkName: () ->
    @nameError = $('.nameError')
    form = $('#new_registration')
    form.submit (event) =>
      @nameEle = $('#registration_name')
      @validateName()

  validateName: () ->
    name = @nameEle.val()
    if(!name.match(nameRegex))
      event.preventDefault()
      @addError()
    else
      @addGood()

  addError: () ->
    @nameEle.addClass('error').removeClass('good')
    @nameError.html('Your name only be lowercase letters and spaces.')

  addGood: () ->
    @nameEle.addClass('good').removeClass('error')
    @nameError.html('')
    

$(document).ready () =>
  val = new Validation()
  val.checkName()




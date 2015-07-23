var Validation = function(){
  //our pattern will go here
  this.nameRegex = /^[a-z\s]+$/
}

Validation.prototype.checkName = function(){
  this.nameError = $('.nameError');
  this.nameEle = $('#registration_name')
  form = $('#new_registration');
  var me = this;
  form.submit(event, function(){
    me.validateName()
  })
}

Validation.prototype.validateName = function(){
  var name = this.nameEle.val();
  if(!name.match(this.nameRegex)){
    event.preventDefault()
    this.addError()
  }else{
    this.addGood()
  }
}

Validation.prototype.addError = function(){
  this.nameEle.addClass('error').removeClass('good')
  this.nameError.html('Your name only be lowercase letters and spaces.')
}

Validation.prototype.addGood = function(){
  this.nameEle.addClass('good').removeClass('error')
  this.nameError.html('')

}

$(document).ready(function(){
  val = new Validation()
  val.checkName()
});



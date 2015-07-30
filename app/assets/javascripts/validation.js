var Validation = function(){
  
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
  //acutally check pattern here!

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

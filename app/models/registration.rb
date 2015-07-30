class Registration < ActiveRecord::Base

  has_one :company

  #use rails validates method with regex && validates and how it does not work best
  after_save :record_company

  #swap bad words that have regex after them.
  def sub_bad_words

  end

  #extract company name from email
  def record_company

  end

end

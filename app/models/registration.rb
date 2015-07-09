class Registration < ActiveRecord::Base

  has_one :company

  SWAP_PATTERN = /(?=\b((bad|negative|hate)\sregex)\b)(\w+)/

  #use rails validates method with regex
  validates :email, format: {with: /\w+@\w+\.com/}
  after_save :record_company

  #extract company name from email
  def record_company
    comp = company || Company.new(registration_id: id)
    comp.name = email.match('\w+@(\w+)\.(?:com|edu|net|org)')[1]
    comp.save 
  end

  #swap bad words that have regex after them.
  def sub_bad_words
    return unless comment.match(SWAP_PATTERN) 
    comment.gsub!(SWAP_PATTERN, 'awesome')
    sub_message
    save
  end

  def sub_message
    comment.gsub!(/(!Sorry.*words!)/, '')
    save
  end

end

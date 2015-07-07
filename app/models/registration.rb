class Registration < ActiveRecord::Base

  #use rails validates method with regex
  validates :email, format: {with: /\w+@\w+\.com/}


  #use a keyword that indicates it was denied
  def denied?
    comment =~ /denied/
  end

end

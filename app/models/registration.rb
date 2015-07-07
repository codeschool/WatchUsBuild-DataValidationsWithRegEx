class Registration < ActiveRecord::Base

  validates :email, format: {with: /\w+@\w+\.com/}

end

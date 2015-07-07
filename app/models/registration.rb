class Registration < ActiveRecord::Base

  #trigger settings - Changes require: rake db:migrate:redo VERSION=20150707153822
  COMMENT_PATTERN = "heck|geeze|bad"
  BAD_COMMENT_TEXT = "This comment has been denied." 

  #use rails validates method with regex
  validates :email, format: {with: /\w+@\w+\.com/}

  #use a keyword that indicates it was denied
  def denied?
    comment =~ /denied/
  end

end

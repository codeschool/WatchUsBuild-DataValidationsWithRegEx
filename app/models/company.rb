class Company < ActiveRecord::Base

  belongs_to :registration

  def logo
    get_logo['responseData']['results'][0]["unescapedUrl"]
  end

  def get_logo
    @get_logo ||= JSON.parse `curl "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{name}&imgsz=large&as_filetype=jpg"`
  end

end

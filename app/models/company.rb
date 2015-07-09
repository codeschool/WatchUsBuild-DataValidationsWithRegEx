class Company < ActiveRecord::Base

  belongs_to :registration

  def logo
    return '' unless available?
    get_logo['responseData']['results'][0]["unescapedUrl"]
  end

  private

  def get_logo
    @get_logo = begin
      uri = URI.parse("http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{name}&imgsz=large&as_filetype=jpg")
      JSON.parse Net::HTTP.get_response(uri).body
    end
  end

  def available?
    get_logo and 
    get_logo['responseData'] and 
    get_logo['responseData']['results'] and 
    get_logo['responseData']['results'][0]
  end

end

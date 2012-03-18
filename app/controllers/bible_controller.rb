class BibleController < ApplicationController
  def quote
    response.headers['Cache-Control'] = "public, max-age=#{30.days}"

    render :text => Bible.quote(params[:q])
  rescue BibleQuote::QuoteLinkMalformed, BibleQuote::QuoteLinkCantBeBlank
    render :text => "Error", :status => 400
  rescue OpenURI::HTTPError
    render :text => "Error", :status => 404
  end
end

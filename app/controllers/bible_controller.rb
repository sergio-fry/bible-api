class BibleController < ApplicationController
  def quote
    response.headers['Cache-Control'] = "public, max-age=#{30.days}"

    @quotes= Bible.quotes(params[:q])

    render :text => @quotes.to_json
  rescue BibleQuote::QuoteLinkMalformed, Bible::QuoteLinkCantBeBlank
    render :text => "Error", :status => 400
  rescue OpenURI::HTTPError
    render :text => "Error", :status => 404
  end
end

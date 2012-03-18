class Bible
  BASE_URL = "http://rus.easy.bibleonline.ru/"

  def self.quote(quote_link)
    quote = BibleQuote.new(quote_link)

    doc = Nokogiri::HTML(open(BASE_URL + "1/#{quote.chapter}"))

    doc.css("ol li")[quote.verse-1].text
  end
end

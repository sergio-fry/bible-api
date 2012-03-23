class Bible
  BASE_URL = "http://rus.easy.bibleonline.ru/"

  class QuoteLinkCantBeBlank < StandardError; end;

  def self.quotes(quote_link)
    raise QuoteLinkCantBeBlank.new if quote_link.blank?

    result = []

    quote_link.split(",").each do |ql|
      quote = BibleQuote.new(ql)

      doc = Nokogiri::HTML(open(BASE_URL + "1/#{quote.chapter}"))

      result << {
        :quote_link => quote.quote_link,
        :verses => [{ :text => doc.css("ol li")[quote.verse-1].text, :number => quote.verse }]
      }
    end

    result
  end
end

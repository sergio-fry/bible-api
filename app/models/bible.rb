# encoding: utf-8
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
        :verses => quote.verses.map { |verse| { :text => doc.css("ol li")[verse-1].text, :number => verse } }
      }
    end

    result
  end

  def self.book_number(book_name)
    case book_name.mb_chars.downcase
    when "быт"
      1
    when "исх"
      2
    when "лев"
      3
    when "чис", "числ"
      4
    when "втор"
      5
    when "нав", "иснав"
      6
    when "суд", "судей"
      7
    when "руф", "руфь"
      8
    when "1цар"
      9
    when "2цар"
      10
    when "3цар"
      11
    when "4цар"
      12
    else
      raise "Unknown book name '#{book_name}'"
    end
  end
end

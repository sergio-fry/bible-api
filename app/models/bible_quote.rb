class BibleQuote
  attr_reader :quote_link

  REGEXP = /([[:alnum:]]+)[^[:alnum:]]+([[:digit:]]+)[^[:alnum:]]+([[:digit:]]+)/

  class QuoteLinkMalformed < StandardError; end;
  class QuoteLinkCantBeBlank < StandardError; end;

  def initialize(quote_link)
    raise QuoteLinkCantBeBlank.new if quote_link.blank?
    @quote_link = quote_link.strip
  end

  def book_name
    match = @quote_link.match(REGEXP)
    raise QuoteLinkMalformed.new unless match
    match[1]
  end

  def chapter
    match = @quote_link.match(REGEXP)
    raise QuoteLinkMalformed.new unless match
    match[2].to_i
  end

  def verse
    match = @quote_link.match(REGEXP)
    raise QuoteLinkMalformed.new unless match
    match[3].to_i
  end
end

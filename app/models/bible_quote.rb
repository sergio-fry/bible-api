class BibleQuote
  attr_reader :quote_link

  REGEXP = /([[:alnum:]]+)[^[:alnum:]]+([[:digit:]]+)[^[:alnum:]]+([[:digit:]]+)(-[[:digit:]]+)?/

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

  def verses
    match = @quote_link.match(REGEXP)
    raise QuoteLinkMalformed.new unless match
    from = match[3]
    to = match[4].present? ? match[4][1..-1] : match[3]
    (from.to_i..to.to_i).to_a
  end
end

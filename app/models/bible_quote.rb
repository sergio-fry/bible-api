class BibleQuote
  REGEXP = /([[:alnum:]]+)[^[:alnum:]]+([[:digit:]]+)[^[:alnum:]]+([[:digit:]]+)/
  def initialize(quote_link)
    @quote_link = quote_link.strip
  end

  def book_name
    match = @quote_link.match(REGEXP)
    raise "Can't detect book name" unless match
    match[1]
  end

  def chapter
    match = @quote_link.match(REGEXP)
    raise "Can't detect chapter" unless match
    match[2].to_i
  end

  def verse
    match = @quote_link.match(REGEXP)
    raise "Can't detect verse" unless match
    match[3].to_i
  end
end

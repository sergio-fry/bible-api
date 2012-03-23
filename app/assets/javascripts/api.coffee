BIBLE_API_URL = "http://bible-api.herokuapp.com/bible/quote"

jQuery.bible_api = jQuery.extend {}, {
  get_quote: (quote_link, callback) ->
    $.getJSON "http://bible-api.herokuapp.com/bible/quote?q=#{quote}&callback=?", (data) =>
      callback(data)
  }

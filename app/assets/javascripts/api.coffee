BIBLE_API_URL = "http://bible-api.heroku.com/bible/quote"

jQuery.bible_api = jQuery.extend {}, {
  get_quote: (quote_link, callback) ->
    $.getJSON BIBLE_API_URL, { q: quote_link }, (data) =>
      callback(data)
  }

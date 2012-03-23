BIBLE_API_URL = "http://bible-api.heroku.com/bible/quote"

jQuery.bible_api.get_quote = (quote_link, callback) ->
  $.getJSON BIBLE_API_URL, { q: $(this).data("bible_links") }, (data) =>
    callback(data)

BIBLE_API_URL = "http://bible-api.herokuapp.com/bible/quote"

jQuery.bible_api = jQuery.extend {}, {
  get_quotes: (quote_link, callback, error) ->
    $.ajax "http://bible-api.herokuapp.com/bible/quote?q=#{quote_link}&callback=?", {
      dataType: "jsonp",
      success: callback,
      error: error
  }

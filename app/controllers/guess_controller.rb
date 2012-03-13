# encoding: utf-8
class GuessController < ApplicationController
  # http://goo.gl/NjzGX
  def book_name
    name = case params[:q].gsub(".", "")
    when "Быт"
      "Книга Бытие"
    when "Исх"
      "Книга Исход"
    when "Втор"
      "Второзаконие"
    when "Чис", "Числ"
      "Книга Числа"
    when "Лев"
      "Книга Левит"
    end

    render :text => name
  end
end

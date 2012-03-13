# encoding: utf-8
require 'spec_helper'

describe GuessController do
  describe "#book_name" do
    { 
      "Быт." => "Книга Бытие",
      "Исх." => "Книга Исход",
      "Лев." => "Книга Левит",
      "Чис." => "Книга Числа",
      "Числ." => "Книга Числа",
      "Втор." => "Второзаконие"
    }.each do |q, name|
      it "should guess name #{q}" do
        get :book_name, :q => q
        response.body.should eq(name)
      end
    end
  end
end

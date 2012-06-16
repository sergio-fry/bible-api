# encoding: utf-8
require 'spec_helper'

describe Bible do
  before do
    stub_request(:get, "http://rus.easy.bibleonline.ru/1/3").
      to_return(:status => 200, :body => File.new(File.join(Rails.root, "spec/fixtures/bibleonlineru_01_03")))
  end

  describe "#quotes" do
    before { @quotes = Bible.quotes("Быт. 3:1") }

    it "should return quote text" do
      @quotes.first[:verses].first[:text].should eq("Змей был хитрее всех зверей полевых, которых создал Господь Бог. И сказал змей жене: подлинно ли сказал Бог: не ешьте ни от какого дерева в раю?")
    end

    it "should return verse number" do
      @quotes.first[:verses].first[:number].should eq(1)
    end

    it "should return quote_link" do
      @quotes.first[:quote_link].should eq("Быт. 3:1")
    end
  end

  describe "#book_number" do
    {
      "Быт" => 1,
      "Исх" => 2,
      "Лев" => 3,
      "Числ" => 4,
      "Чис" => 4,
      "Втор" => 5,
      "Нав" => 6,
      "ИсНав" => 6,
      "Суд" => 7,
      "Судей" => 7,
      "Руф" => 8,
      "Руфь" => 8,
      "1Цар" => 9,
      "2Цар" => 10,
      "3Цар" => 11,
      "4Цар" => 12,
    }.each do |book_name, book_number|
      context "bookname is '#{book_name}'" do
        it "should be eq #{book_number}" do
          Bible.book_number(book_name).should eq(book_number)
        end
      end
    end

    it "should accept lowcase names" do
      Bible.book_number("быт").should eq(1)
    end
  end
end

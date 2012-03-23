# encoding: utf-8
require 'spec_helper'

describe BibleQuote do
  describe "book name detection" do
    it "should detect book name" do
      bible_quote = BibleQuote.new "Act 3:12"
      bible_quote.book_name.should eq("Act")
    end

    it "should remove punctuation" do
      bible_quote = BibleQuote.new "Act. 3:12"
      bible_quote.book_name.should eq("Act")
    end

    it "should trim spaces" do
      bible_quote = BibleQuote.new " Act 3:12"
      bible_quote.book_name.should eq("Act")
    end

    it "should accept utf chars" do
      bible_quote = BibleQuote.new "Быт. 3:12"
      bible_quote.book_name.should eq("Быт")
    end
  end

  describe "chapter detection" do
    it "should detect chapter number" do
      bible_quote = BibleQuote.new "Act 3:12"
      bible_quote.chapter.should eq(3)
    end
  end

  describe "verse detection" do
    it "should detect verse number" do
      bible_quote = BibleQuote.new "Act 3:12"
      bible_quote.verses.should eq([12])
    end

    it "should detect range of verses" do
      bible_quote = BibleQuote.new "Act 3:8-12"
      bible_quote.verses.should eq((8..12).to_a)
    end
  end
end

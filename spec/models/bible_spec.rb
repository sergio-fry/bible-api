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
end

# encoding: utf-8
require 'spec_helper'

describe Bible do
  before do
    stub_request(:get, "http://rus.easy.bibleonline.ru/1/3").
      to_return(:status => 200, :body => File.new(File.join(Rails.root, "spec/fixtures/bibleonlineru_01_03")))

    @bible = Bible.new
  end

  it "should return quote text" do
    @bible.quote("Быт. 3:1").should eq("Змей был хитрее всех зверей полевых, которых создал Господь Бог. И сказал змей жене: подлинно ли сказал Бог: не ешьте ни от какого дерева в раю?")

    @bible.quote("Быт. 3:10").should eq("Он сказал: голос Твой я услышал в раю, и убоялся, потому что я наг, и скрылся.")
  end
end

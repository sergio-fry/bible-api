# encoding: utf-8
require 'spec_helper'

describe BibleController do
  describe "#quote" do
    before do
      stub_request(:get, "http://rus.easy.bibleonline.ru/1/3").
        to_return(:status => 200, :body => File.new(File.join(Rails.root, "spec/fixtures/bibleonlineru_01_03")))
    end

    it "should be success" do
      get :quote, :q => "Быт. 3:4"
      response.should be_success
    end
  end
end

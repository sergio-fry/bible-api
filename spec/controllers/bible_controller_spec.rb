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

    it "should assign quotes" do
      get :quote, :q => "Быт. 3:4"
      assigns(:quotes).should have(1).item
    end

    it "should be json" do
      get :quote, :q => "Быт. 3:4"

      lambda do
        JSON.parse response.body
      end.should_not raise_error(JSON::ParserError)
    end

    it "should be 400 if q is not present" do
      get :quote
      response.code.to_i.should eq(400)
    end

    it "should be 400 if quote_link malformed" do
      get :quote, :q => "300:4"
      response.code.to_i.should eq(400)
    end

    it "should be 404 if chapter not found" do
      stub_request(:get, "http://rus.easy.bibleonline.ru/1/300").
        to_return(:status => 404, :body => "")

      get :quote, :q => "Быт. 300:4"
      response.code.to_i.should eq(404)
    end
  end
end

class BibleController < ApplicationController
  def quote
    render :text => Bible.quote(params[:q])
  end
end

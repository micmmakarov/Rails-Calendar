class HomeController < ApplicationController
  def index
  end
  def calendar
    direction = params[:direction]
    @year = params[:year]
    @month = params[:month]

    puts "#####" +@year
    puts "#####" +@month
    puts "#####"
    old_date = Date.civil(@year.to_i,@month.to_i,1)

    if direction.to_s == "previous"
      new_date = old_date.to_time.advance(:months => -1).to_date
    end
    if direction.to_s == "next"
      new_date = old_date.to_time.advance(:months => 1).to_date
    end

    @year = new_date.year
    @month = new_date.month

    respond_to do |format|
      format.js
    end

  end
end

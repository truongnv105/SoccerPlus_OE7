class NewsController < ApplicationController
  def index
    if params[:content_href].present?
      doc = Nokogiri::HTML(open("http://bongdaso.com/#{params[:content_href]}"))
      @search = doc.css(".left_pane img").each do |link|
        check_url link
      end
      @search = doc.css(".left_pane")
    else
      doc = Nokogiri::HTML(open("http://bongdaso.com/news.aspx"))
      @left = doc.css(".left_block #infocus_left img").each do |link|
        check_url link
      end
      @left = doc.css(".left_block #infocus_left")

      @right = doc.css(".left_block #infocus_right img").each do |link|
        check_url link
      end
      @right = doc.css(".left_block #infocus_right")
    end
  end

  private

  def check_url link
    if !link.attributes["src"].value.include? "http"
      link.attributes["src"].value = "http://bongdaso.com/#{link.attributes['src'].value}"
    end
  end
end

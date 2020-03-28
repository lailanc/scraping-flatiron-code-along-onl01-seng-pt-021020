require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def get_page
  doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))  
  #binding.pry
  end 
  
  #uses a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping" 
  
  def get_courses
    doc.css = ".post"  
  end 
  
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end

 
Scraper.new.get_page




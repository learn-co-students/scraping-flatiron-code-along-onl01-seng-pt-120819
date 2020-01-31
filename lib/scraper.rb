require 'nokogiri' #uses Nokogiri to get the HTML from a web page
require 'open-uri'
require 'pry'
 
require_relative './course.rb'
 
class Scraper
 
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses # uses a CSS selector to return an array of Nokogirir XML elements representing the courses described on the web page we are scraping
    self.get_page.css(".post")
  end

  def make_courses #iterates over the courses array returned by #get_courses and creates a new Course instance out of every array element
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end
end


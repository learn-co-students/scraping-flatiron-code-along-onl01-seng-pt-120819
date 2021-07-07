class Course
  attr_accessor :title, :schedule, :description
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
 
  def self.reset_all
    @@all.clear
  end
  
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
    
end


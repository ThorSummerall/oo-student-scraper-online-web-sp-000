require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students = []

    doc.css("div.student-card").each do |info|
      students << {
        :name => info.css("h4.student-name").text,
        :location => info.css("p.student-location").text,
        :profile_url => info.css("a").attribute("href").value
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(index_url))

    student = []

    doc.css("div.social-icon-container").each do |info|
      student << {
        :twitter => info.css("a").attribute("href").value,
        :linkedin => info.css("a").attribute("href").value,
        :github => info.css("a").attribute("href").value,
        :blog => info.css("a").attribute("href").value,
        :profile_quote => info.css("a").attribute("href").value,
        :bio => info.css("a").attribute("href").value
      }
    end
  end
end

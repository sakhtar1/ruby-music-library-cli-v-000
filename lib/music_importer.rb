require 'pry'

class MusicImporter



    def self.scrape
      doc = Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
      services = doc.search("li menu-item-1694'] a['href']").text
      binding.pry
    end

  


end

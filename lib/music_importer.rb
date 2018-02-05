require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end


  def self.scrape
    doc = Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
    services = doc.search("li menu-item-1694'] a['href']").text
    binding.pry
  end

end

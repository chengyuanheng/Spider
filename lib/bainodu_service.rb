class BainoduService

  def initialize
    url = "http://www.bainodu.com/archives"
    doc = Nokogiri::HTML(open(url))
    @urls = doc.css('.fancy-ul li a').map{|a| a.attributes['href'].value }
  end

  def spider
    path = "../www.bainodu.com/"
    FileUtils.mkdir_p(path) unless File.exists?(path)
    @urls.each do |url|
      _doc = Nokogiri::HTML(open(url))
      title = _doc.css('h2.grap--h2').children.text
      content = _doc.css('.grap > p').children.map{|line| line.text}.join("\n")

      p "=====#{title}======"
      open("#{path}#{title}.txt", 'w') do |f|
        f.write content
      end
    end
  end

end

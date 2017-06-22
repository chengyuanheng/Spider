class SpiderService

  def initialize
    @urls = ["http://www.bainodu.com"]
  end


  def spider
    @urls.each do |url|
      case url
      when 'http://www.bainodu.com' then BainoduService.new.spider
      end
    end
  end

end

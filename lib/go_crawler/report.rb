module GoCrawler
  class Report
    def initialize(sitemap)
      @sitemap = sitemap
    end

    def print
      line
      puts "Sitemap"
      line
      
      @sitemap.each do |page|
        render(page)
        puts "\n"
      end

      line
    end

    def render(page)
      puts "-> #{page.url}"
      puts "  + Total assets: #{ page.assets.size }"
      
      puts "  + Javascripts: #{page.javascripts.size}"
      page.javascripts.each do |js|
        puts "    - #{js}"
      end

      puts "  + Stylesheets: #{page.stylesheets.size}"
      page.stylesheets.each do |img|
        puts "    - #{img}"
      end

      puts "  + Images: #{page.images.size}"
      page.images.each do |img|
        puts "    - #{img}"
      end
    end

    private
    def line
      puts "-" * 80
    end
  end
end
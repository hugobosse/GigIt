# require 'open-uri'
# require 'nokogiri'


# urls = []

# html_file = open("https://www.privateaser.com/reservation-bar?latitude-min=48.701969896911834&latitude-max=49.02719485389125&longitude-min=1.8399721924804453&longitude-max=3.0045229737304453&zoom=10")
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('.etab-panel').each do |url|
#   urls << url.attribute('href')
# end

# bar = []
# urls.each do |url|
#   html_file = open('https://www.privateaser.com/lieu/652-le-49-3')
#   html_doc = Nokogiri::HTML(html_file)
#   bar << {
#     description: html_doc.search('.collapser').text.strip,
#     address: html_doc.search('.a link-scroll').text.strip
#   }


# puts bar





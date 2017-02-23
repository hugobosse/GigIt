require 'open-uri'
require 'nokogiri'
require 'json'


urls = []

html_file = open("https://www.privateaser.com/reservation-bar?latitude-min=48.817485900526044&latitude-max=48.89880296945104&longitude-min=2.1975428406738047&longitude-max=2.4886805359863047&zoom=12")
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.etab-panel').each do |url|
  urls << url.attribute('href')
end

bar = []
urls.each do |url|
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)
  bar << {
    description: html_doc.search('.collapser').text.strip,
    address: html_doc.search('#access :first-child').text.strip,
    name: html_doc.search('h1 span').text.strip,
    photo_url: html_doc.search('.cover-photo').attribute('style').text.gsub('background-image: url(\'', '').gsub('\');', '')
  }
end

File.open("db/bars.json","w") do |f|
  f.write(bar.to_json)
end

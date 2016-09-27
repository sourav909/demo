desc "rank"
task :rank => :environment do
 Red.each do |rank|
      url = "http://www.alexa.com/siteinfo/#{rank.email}"
      doc = Nokogiri::HTML(open(url))
      global = doc.at_css(".globleRank .align-vmiddle").text
      rank.update_attribute(:global, global)
      country = doc.at_css(".countryRank .align-vmiddle").text
      rank.update_attribute(:country, country)
  end
end


require 'rubygems'
require 'nokogiri'
require 'open-uri'

	class Scrapper
		@@hash = Hash.new
		@@hash1 = Hash.new
		@@townName = []
		@@link = []

		def ville_ain_nom
			page1 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/ain.html")) 
			page1.xpath("/html/body/div/main/section[3]/div/table/tbody/tr/td/a").each do |nom|
			@@hash[nom.text] = nom['href']
			@@townName << nom.text
			@@link << nom['href']

			end

			for i in 1..170
				html = "http://annuaire-des-mairies.com/" + @@link[i]
				page1 = Nokogiri::HTML(open(html)) 
				az = page1.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
				mail = az.text
				@@hash1[@@townName[i]] = mail 
			end
			puts @@hash1
		end



		def ville_aisne
			page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/aisne.html")) 
			page2.xpath("/html/body/div/main/section[3]/div/table/tbody/tr/td/a").each do |nom|
				@@hash[nom.text] = nom['href']
				@@townName << nom.text
				@@link << nom['href']
			end
			puts @@link
			for i in 1..5
				html = "http://annuaire-des-mairies.com/" + @@link[i]
				page1 = Nokogiri::HTML(open(html))
				real = page2.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
				email = real.text
				@@hash1[@@townName[i]] = email 
  			end
  			puts @@hash1
		end
		def alpes_de_haute_provence
			page3 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/alpes-de-haute-provence.html")) 
			page3.xpath("/html/body/div/main/section[3]/div/table/tbody/tr/td/a").each do |nom|
				@@hash[nom.text] = nom
				@@townName << nom.text
				@@link << nom['href']
			end
			
			for i in 1..90
				html = "http://annuaire-des-mairies.com/" + @@link[i]
				page3 = Nokogiri::HTML(open(html))
				om = page3.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
				email = om.text
				@@hash1[@@townName[i]] = email 
	  		end
  		puts @@hash1
		end
		
	end
	Scrapper.new.alpes_de_haute_provence
require 'nokogiri'
require 'open-uri'

class UrlContent < ApplicationRecord

    validates :content, presence: true

    def self.parser(url)
        uri = Addressable::URI.parse(url)
        url = "http://#{url}" if(!uri.scheme)
        url = url.to_s
        begin
            html = open(url)
        rescue SocketError => error
            if error 
                return 403
            end 
        end  
        doc = Nokogiri::HTML(html)
        content = doc.css('h1, h2, h3, a').map(&:text).join(" ")    
    end 

end





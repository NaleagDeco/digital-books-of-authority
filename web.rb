require 'bundler/setup'

require 'nokogiri'
require 'open-uri'

require 'json'
require 'sinatra'

get '/' do
  haml(:index, format: :html5)
end

post '/cases' do
  decision_urls = params.select { |key| key.to_s.match(/^decisionurl\d+/) }
  decisions = decision_urls.values.map do |item|
    url = URI.parse item
    doc = Nokogiri::HTML(open(url))
    doc.css('#originalDocument').first
  end

  params[:decisions] = []
  decisions.each { |item| params[:decisions] << item }

  erb(:frontpage, locals: params)
end

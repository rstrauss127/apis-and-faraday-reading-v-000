class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = '0WCRVGMP2YM5HJCJOI44IFO3KOWPCCA5BGBFWXBU4UN3PGGO'
      req.params['client_secret'] = 'CCAZ1PPLB3IIONOYJGRC5VDJ5OVFRHRODEB0M4ZAX32OJXUO'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end

end

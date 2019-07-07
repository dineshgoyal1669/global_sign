class CryptoCurrenciesController < ApplicationController
	def index
		@list = CoinMarketCap.get_list
	end	
end

class HomeController < ApplicationController
    def home
        @markets = get_markets
        time = Time.now.to_i
        last_time = time - 24*60*60
        @markets.each do |market|
            transactions = get_market_transactions(market, last_time)
            market[:max_transaction] = transactions.max.round(2)
        end
    end

    def get_markets
        markets_response = HTTParty.get('https://www.buda.com/api/v2/markets')
        markets = markets_response["markets"].map{ |market| {"market_id": market["id"], "quote_currency": market["quote_currency"], "max_transaction": 0}}
        markets
    end

    def get_market_transactions(market, timestamp)
        trades_response = HTTParty.get("https://www.buda.com/api/v2/markets/#{market[:market_id]}/trades?timestamp=#{timestamp}000&limit=100")
        transactions = trades_response["trades"]["entries"].map{ |trade| trade[2].to_f}
        transactions
    end 
end
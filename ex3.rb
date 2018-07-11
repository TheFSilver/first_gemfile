# frozen_string_literal: true

def trader_du_dimanche(prices)
  profit = best_buy = best_sell = 0
  days = []
  (0..(prices.length - 1)).each do |date_buy|
    ((date_buy + 1)..(prices.length - 1)).each do |date_sell|
      next unless prices[date_sell] - prices[date_buy] > profit
      profit = prices[date_sell] - prices[date_buy]
      best_buy = date_buy
      best_sell = date_sell
      puts profit
    end
  end
  print "#{days.push(best_buy) && days.push(best_sell)}\n"
  days
end

trader_du_dimanche([17, 3, 6, 9, 15, 8, 6, 1, 10])

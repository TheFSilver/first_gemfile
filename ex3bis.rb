# frozen_string_literal: true

def trader_du_lundi(stocks)
  i = 0
  stocks_names = stocks.flat_map(&:keys).uniq
  array_by_stocks = stocks_names.map { |name| stocks.map { |daily_hash| daily_hash[name] } }

  while i < array_by_stocks.length
    trader_du_dimanche(array_by_stocks[i], i, stocks_names)
    i += 1
  end
end

def trader_du_dimanche(prices_array, num, stock_name)
  maxprofit = 0
  best_buy = nil
  best_sell = nil

  (0..(prices_array.length - 2)).each do |date_buy|
    ((date_buy + 1)..prices_array.length - 1).each do |date_sell|
      next unless prices_array[date_sell] - prices_array[date_buy] > maxprofit
      best_buy = date_buy
      best_sell = date_sell
      maxprofit = prices_array[date_sell] - prices_array[date_buy]
    end
  end

  puts "Entreprise #{stock_name[num]} : [Meileur jour pour acheter : #{best_buy}, Meileur jour pour vendre : #{best_sell}]   # Prix de vente : #{prices_array[best_sell]}$ - Prix d'achat : #{prices_array[best_buy]}$ == Marge de #{maxprofit}$"
end

stocks = [{ GOO: 15, MMM: 14, ADBE: 12, EA: 13, BA: 8, KO: 10, XOM: 20, GPS: 7, MCD: 11, DIS: 15, CRM: 6, JNJ: 10 },
          { GOO: 8, MMM: 20, ADBE: 3, EA: 10, BA: 5, KO: 19, XOM: 12, GPS: 6, MCD: 15, DIS: 9, CRM: 10, JNJ: 17 },
          { GOO: 3, MMM: 8, ADBE: 15, EA: 5, BA: 10, KO: 5, XOM: 15, GPS: 13, MCD: 10, DIS: 18, CRM: 5, JNJ: 14 },
          { GOO: 17, MMM: 3, ADBE: 6, EA: 9, BA: 15, KO: 6, XOM: 8, GPS: 1, MCD: 10, DIS: 15, CRM: 18, JNJ: 3 },
          { GOO: 8, MMM: 18, ADBE: 4, EA: 6, BA: 15, KO: 18, XOM: 3, GPS: 12, MCD: 19, DIS: 3, CRM: 7, JNJ: 9 },
          { GOO: 10, MMM: 12, ADBE: 8, EA: 3, BA: 18, KO: 20, XOM: 5, GPS: 11, MCD: 3, DIS: 9, CRM: 8, JNJ: 15 },
          { GOO: 17, MMM: 14, ADBE: 2, EA: 17, BA: 7, KO: 13, XOM: 1, GPS: 15, MCD: 15, DIS: 10, CRM: 9, JNJ: 17 }]

trader_du_lundi(stocks)

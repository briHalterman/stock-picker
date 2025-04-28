# Compare each day's price with every following day's price, and track the pair that gives the highest profit (or smallest loss) based on purchase price subtracted from sell price


def stock_picker(daily_prices)
  # Initialize variables to track best days and profit
  optimal_purchase_day = 0
  optimal_sell_day = 0
  max_profit = 0

  # Loop through each day as a purchase day
  daily_prices.each_with_index do |purchase_price, purchase_day|

    # Loop through subsequent days
    daily_prices.each_with_index do |sell_price, sell_day|
      if sell_day <= purchase_day
        next
      end

      # Calculate profit (sell price - buy price)
      potential_profit = sell_price - purchase_price

      # if profit is is highest so far
      if potential_profit > max_profit
        max_profit = potential_profit

        # Update best pair
        optimal_purchase_day = purchase_day
        optimal_sell_day = sell_day
      end
    end
  end

  # Return best pair
  optimal_days =  [optimal_purchase_day, optimal_sell_day]
  optimal_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10]) == [1, 4]

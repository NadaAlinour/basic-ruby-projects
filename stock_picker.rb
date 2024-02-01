def stock_picker(prices)
  max_profit = -1.0/0.0 # negative infinity
  for i in 0 .. prices.length - 1
    for j in i + 1 .. prices.length - 1
      if prices[i] < prices[j]
        profit = prices[j] - prices[i]
        if profit > max_profit
          days = [i, j]
          max_profit = profit
        end
      end
    end
  end
  days
end


array = [17,3,6,9,15,8,6,1,10]
result = stock_picker(array)
p result # should [1, 4]
puts "Maximum profit is #{array[result[1]] - array[result[0]]}"
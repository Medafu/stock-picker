def stock_picker(arr)
  min = arr.min
  max = arr.max

  if arr.index(min) < arr.index(max)
    return [arr.index(min), arr.index(max)]
  end
  
  arr_cp = arr.map(&:itself)
  profit, start_idx, end_idx = 0
  arr.length - 1.times do
    max = 0
    arr_cp.delete_at(arr_cp.index(min))
    min = arr_cp.min
    for item in arr_cp[arr_cp.index(min)..-1]
      if item > max
        max = item
      end
    end
    temp_profit = max - min
    if temp_profit > profit
      profit = temp_profit
      start_idx = arr.index(min)
      end_idx = arr.index(max)
    end
  end
  return [start_idx, end_idx]
end
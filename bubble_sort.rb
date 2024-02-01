def bubble_sort(arr)
  for i in 0..arr.length - 2
    for j in i + 1 .. arr.length - 1
      if (arr[i] > arr[j])
        # swap
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end
  arr
end


sorted_result = bubble_sort([4,3,78,2,0,2])
p sorted_result
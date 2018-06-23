class Prime
  def take(input)
    raise Errors::InvalidArgument if input < 2

    nums = [nil, nil, *2..input]
    (2..Math.sqrt(input)).each do |value|
      (value**2..input).step(value) { |m| nums[m] = nil } if nums[value]
    end

    nums.compact
  end
end

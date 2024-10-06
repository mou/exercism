class Raindrops
  def self.convert(num)
    res = ""
    res << if num % 3 == 0 then "Pling" else "" end
    res << if num % 5 == 0 then "Plang" else "" end
    res << if num % 7 == 0 then "Plong" else "" end
    if res.empty?
      res = num.to_s
    end
    return res
  end
end


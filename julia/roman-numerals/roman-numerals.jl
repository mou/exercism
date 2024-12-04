function to_roman(number)
    if number < 1 || number > 3999
        throw(ErrorException("Input must be between 1 and 3999, inclusive."))
    end
    # Define Roman numeral mapping
    roman_mapping = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I")
    ]
    
    roman = ""
    for (value, symbol) in roman_mapping
        while number >= value
            roman *= symbol
            number -= value
        end
    end
    
    return roman
end

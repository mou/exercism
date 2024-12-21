type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergies*(score: int): set[Allergen] =
  cast[set[Allergen]](score)

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  allergies(score).contains(allergen)

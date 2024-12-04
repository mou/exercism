defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    mapping = [
      {1000, "M"},
      {900, "CM"},
      {500, "D"},
      {400, "CD"},
      {100, "C"},
      {90, "XC"},
      {50, "L"},
      {40, "XL"},
      {10, "X"},
      {9, "IX"},
      {5, "V"},
      {4, "IV"},
      {1, "I"}
    ]

    do_convert(number, mapping)
  end

  defp do_convert(0, _mapping), do: ""
  
  defp do_convert(number, [{value, roman} | tail]) when number >= value do
    roman <> do_convert(number - value, [{value, roman} | tail])
  end

  defp do_convert(number, [_ | tail]) do
    do_convert(number, tail)
  end
end

module ProteinTranslation
  CODON_TO_PROTEIN = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine",
    "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP"
  }

  def self.proteins(strand : String) : Array(String)
    proteins = [] of String
    strand.chars.each_slice(3) do |codon_chars|
      codon = codon_chars.join
      raise ArgumentError.new("Incomplete sequence") unless codon.size == 3
      protein = CODON_TO_PROTEIN[codon]?
      raise ArgumentError.new("Unknown sequence") unless protein
      break if protein == "STOP"
      proteins << protein if protein
    end
    proteins
  end
end

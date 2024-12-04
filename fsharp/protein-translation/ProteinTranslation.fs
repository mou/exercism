module ProteinTranslation

  let codonToProtein = 
    dict [
      "AUG", "Methionine"
      "UUU", "Phenylalanine"; "UUC", "Phenylalanine"
      "UUA", "Leucine"; "UUG", "Leucine"
      "UCU", "Serine"; "UCC", "Serine"; "UCA", "Serine"; "UCG", "Serine"
      "UAU", "Tyrosine"; "UAC", "Tyrosine"
      "UGU", "Cysteine"; "UGC", "Cysteine"
      "UGG", "Tryptophan"
      "UAA", "STOP"; "UAG", "STOP"; "UGA", "STOP"
    ]


  let proteins rna =
        rna
        |> Seq.chunkBySize 3
        |> Seq.map (fun codon -> 
            let key = System.String codon
            match codonToProtein.TryGetValue(key) with
            | true, value -> Some value
            | false, _ -> None)
        |> Seq.takeWhile (fun protein -> protein <> Some "STOP")
        |> Seq.choose id
        |> Seq.toList

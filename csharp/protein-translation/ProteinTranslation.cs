using System;
using System.Collections.Generic;

public static class ProteinTranslation
{
    public static string[] Proteins(string rna)
    {
        var codonMap = new Dictionary<string, string>
        {
            { "AUG", "Methionine" },
            { "UUU", "Phenylalanine" }, { "UUC", "Phenylalanine" },
            { "UUA", "Leucine" }, { "UUG", "Leucine" },
            { "UCU", "Serine" }, { "UCC", "Serine" }, { "UCA", "Serine" }, { "UCG", "Serine" },
            { "UAU", "Tyrosine" }, { "UAC", "Tyrosine" },
            { "UGU", "Cysteine" }, { "UGC", "Cysteine" },
            { "UGG", "Tryptophan" },
            { "UAA", "STOP" }, { "UAG", "STOP" }, { "UGA", "STOP" }
        };

        var proteins = new List<string>();
        
        // Process RNA sequence in chunks of 3 (codons)
        for (int i = 0; i < rna.Length; i += 3)
        {
            // Ensure there are enough nucleotides left to form a codon
            if (i + 3 > rna.Length) break;

            string codon = rna.Substring(i, 3);

            // If the codon is a STOP codon, terminate translation
            if (codonMap[codon] == "STOP")
                break;

            // If the codon maps to a protein, add it to the list
            if (codonMap.ContainsKey(codon))
                proteins.Add(codonMap[codon]);
        }

        return proteins.ToArray();
    }
}

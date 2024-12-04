Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'as yet unclassified' }
RomanNumerals >> fourthRegister: anInteger [ 
	| rem |
	rem := (anInteger rem: 10000) // 1000.
	^ self singleDigit: rem withLow: 'M'  mid: ''  next: '' 
]

{ #category : #'as yet unclassified' }
RomanNumerals >> leastRegister: anInteger [ 
	| rem |
	rem := anInteger rem: 10.
	^ self singleDigit: rem withLow: 'I' mid: 'V' next: 'X' 	

]

{ #category : #'as yet unclassified' }
RomanNumerals >> romanNumber: anInteger [ 
	^	(self fourthRegister: anInteger),	
		(self thirdRegister: anInteger), 
		(self secondRegister: anInteger),
		(self leastRegister: anInteger)
]

{ #category : #'as yet unclassified' }
RomanNumerals >> secondRegister: anInteger [ 
	| rem |
	rem := (anInteger rem: 100) // 10.
	^ self singleDigit: rem withLow: 'X'  mid: 'L'  next: 'C' 
]

{ #category : #'as yet unclassified' }
RomanNumerals >> singleDigit: digit withLow: low mid: mid next: next [
	(digit between: 1 and: 3) ifTrue: [ ^ low repeat: digit ].
	(digit == 4) ifTrue: [ ^ low, mid ].
	(digit == 5) ifTrue: [ ^ mid ].
	(digit between: 6 and: 8) ifTrue: [ ^ mid, (low repeat: (digit - 5)) ].
	(digit == 9) ifTrue: [ ^ low, next ].
	^ ''

]

{ #category : #'as yet unclassified' }
RomanNumerals >> thirdRegister: anInteger [ 
	| rem |
	rem := (anInteger rem: 1000) // 100.
	^ self singleDigit: rem withLow: 'C'  mid: 'D'  next: 'M' 
]

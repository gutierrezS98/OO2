Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #accessing }
Post >> addVote: aVote [
	votes add: aVote
]

{ #category : #initialize }
Post >> initialize [
votes := OrderedCollection new.
	timestamp := DateAndTime now
]

{ #category : #accessing }
Post >> negativeVotes [
	^ votes reject: [ :vote | vote isLike ]
]

{ #category : #accessing }
Post >> positiveVotes [
	^votes select: [ :vote | vote isLike ].

]

{ #category : #accessing }
Post >> votes [
	^ votes
]

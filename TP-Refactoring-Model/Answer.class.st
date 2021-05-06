Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Answer class >> description: aDescription user: aUser question: aQuestion [
	^ self new
		initializeWithDescription: aDescription
		user: aUser
		question: aQuestion; yourself
]

{ #category : #accessing }
Answer >> initializeWithDescription:aDescription user:aUser question: aQuestion [
description := aDescription .
user:=aUser.
question:=aQuestion 
]

{ #category : #accessing }
Answer >> isTopAnswer [
	.
	^ self positiveVotes >=  ((question sum: [:answer | answer positiveVotes size ]) / question answer size )
]

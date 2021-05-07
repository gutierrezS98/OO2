Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'questions'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #adding }
CuOOra >> addQuestion: aQuestion forUser: aUser [
	aUser addQuestion: aQuestion.
	questions add: aQuestion.
]

{ #category : #adding }
CuOOra >> addUser: aUser [
	users add: aUser 

]

{ #category : #accessing }
CuOOra >> getQuestionsFromToday [
	^ questions select: [ :q | q isToday]
]

{ #category : #accessing }
CuOOra >> getTotalPositiveVotes [
	^ questions sum: [ :q | q getPositiveVotesSize  ]
]

{ #category : #initialize }
CuOOra >> initialize [
	users := OrderedCollection new.
	questions := OrderedCollection new
]

{ #category : #adding }
CuOOra >> questions [
	^ questions
]

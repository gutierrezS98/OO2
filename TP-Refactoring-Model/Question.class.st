Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'answers',
		'topics'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser [
	^ self new
		initializeWithTitle:title description:aDescription user:aUser;
		yourself
]

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser topic: aTopic [
	^ self new
		initializeWithTitle: title description: aDescription user: aUser topic:aTopic;
		yourself
]

{ #category : #accessing }
Question >> getPositiveVotesSize [
	^ self positiveVotes size
]

{ #category : #'initalize-release' }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
	topics := OrderedCollection new
]

{ #category : #intialization }
Question >> initializeWithTitle: aTitle description: aDescription user: aUser [
	title := aTitle.
	description := aDescription.
	user := aUser
]

{ #category : #intialization }
Question >> initializeWithTitle: aTitle description: aDescription user: aUser topic: aTopic [
	self initializeWithTitle:aTitle description:aDescription user: aUser.
	topics add: aTopic.
	aTopic addQuestion: self
]

{ #category : #accessing }
Question >> isToday [
^ timestamp asDate = Date today
]

{ #category : #accessing }
Question >> timestamp [
	^ timestamp
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #accessing }
Question >> user [
	^ user
]

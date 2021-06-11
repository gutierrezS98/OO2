Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'option',
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> createRetrieverWith: cuoora and: type [
	type = #social
		ifTrue: [ ^ SocialRetriever new: cuoora ].
	type = #topics
		ifTrue: [ ^ TopicsRetriever new: cuoora ].
	type = #news
		ifTrue: [ ^ NewsRetriever new: cuoora ].
	type = #popularToday
		ifTrue: [ ^ PopularTodayRetriever new: cuoora ].
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #protected }
QuestionRetriever >> getQuestionsByVoteFrom: aQuestionCollection [
	^ (self orderQuestionsByVote: aQuestionCollection)
		last: (100 min: (self orderQuestionsByVote: aQuestionCollection) size)
]

{ #category : #protected }
QuestionRetriever >> orderQuestionsByVote: aQuestionCollection [
	^ aQuestionCollection
		asSortedCollection: [ :a :b | a getPositiveVotesSize > b getPositiveVotesSize ]
]

{ #category : #protected }
QuestionRetriever >> retrieveQuestions: aUser [
	^ (self retrieveQuestionsBaseOnOption: aUser)
		reject: [ :q | q isUser: aUser]
]

{ #category : #protected }
QuestionRetriever >> retrieveQuestionsBaseOnOption: aUser [
	self subclassResponsibility 
]

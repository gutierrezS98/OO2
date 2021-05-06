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
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora and: aSymbol [
	^ self new
		initializeWithCuoora: cuoora withOption: aSymbol;
		yourself
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #private }
QuestionRetriever >> getAverageFromVotes: aQuestionCollection [
	^ (cuoora questions
		sum: [ :q | q positiveVotes size ]) / aQuestionCollection size
]

{ #category : #private }
QuestionRetriever >> getQuestionsAboveAverage: aQuestionCollection [
	^ (aQuestionCollection
		select:
			[ :q | q positiveVotes size >= (self getAverageFromVotes: aQuestionCollection) ])
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ]
]

{ #category : #private }
QuestionRetriever >> getQuestionsByAverageVoteFrom: aQuestionCollection [
^(self getQuestionsAboveAverage:aQuestionCollection) last: (100 min: (self getQuestionsAboveAverage: aQuestionCollection) size).
]

{ #category : #private }
QuestionRetriever >> getQuestionsByVoteFrom: aQuestionCollection [
	^ (self orderQuestionsByVote: aQuestionCollection)
		last: (100 min: (self orderQuestionsByVote: aQuestionCollection) size)
]

{ #category : #private }
QuestionRetriever >> getQuestionsFromFollowed: aUser [
	^aUser following flatCollect: [ :follow | follow questions ]
]

{ #category : #private }
QuestionRetriever >> getQuestionsFromNews [
	^ cuoora questions
		select: [ :q | q timestamp asDate = Date today ].
]

{ #category : #private }
QuestionRetriever >> getQuestionsFromTopics: aUser [
	^aUser topics flatCollect: [ :topic | topic questions ].
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #initializing }
QuestionRetriever >> initializeWithCuoora: aCuooraInstance withOption: anOption [
	self cuoora: aCuooraInstance.
	option := anOption
]

{ #category : #private }
QuestionRetriever >> orderQuestionsByVote: aQuestionCollection [
	^ aQuestionCollection asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
]

{ #category : #retrieving }
QuestionRetriever >> retrieveNewQuestions [
	^ self getQuestionsByVoteFrom: (self getQuestionsFromNews)
]

{ #category : #retrieving }
QuestionRetriever >> retrievePopularQuestions [
	|popularTCol|
	popularTCol := OrderedCollection new.
			cuoora questions
				do: [ :q | 
					q timestamp asDate = Date today
						ifTrue: [ popularTCol add: q ] ].
			^self getQuestionsByAverageVoteFrom: popularTCol.
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	| qRet|
	qRet := OrderedCollection new.
	option = #social
		ifTrue: [ qRet := self retrieveSocialQuestions: aUser ].
	option = #topics
		ifTrue: [ qRet := self retrieveTopicQuestions: aUser ].
	option = #news
		ifTrue: [ qRet := self retrieveNewQuestions ].
	option = #popularToday
		ifTrue: [ qRet := self retrievePopularQuestions ].
	^ qRet reject: [ :q | q user = aUser ]
]

{ #category : #retrieving }
QuestionRetriever >> retrieveSocialQuestions: aUser [
	^ self getQuestionsByVoteFrom: (self getQuestionsFromFollowed: aUser).
]

{ #category : #retrieving }
QuestionRetriever >> retrieveTopicQuestions: aUser [
	^ self getQuestionsByVoteFrom: (self getQuestionsFromTopics: aUser).
]

Class {
	#name : #PopularTodayRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #private }
PopularTodayRetriever >> getAverageFromVotes: aQuestionCollection [
	^ cuoora getTotalPositiveVotes / aQuestionCollection size
]

{ #category : #private }
PopularTodayRetriever >> getQuestionsAboveAverage: aQuestionCollection [
	^ self
		orderQuestionsByVote: (self getQuestionsWithPositiveAboveAverage: aQuestionCollection)
]

{ #category : #private }
PopularTodayRetriever >> getQuestionsByAverageVoteFrom: aQuestionCollection [
	^ (self getQuestionsAboveAverage: aQuestionCollection)
		last: (100 min: (self getQuestionsAboveAverage: aQuestionCollection) size)
]

{ #category : #private }
PopularTodayRetriever >> getQuestionsWithPositiveAboveAverage: aQuestionCollection [
	^ aQuestionCollection
		select: [ :q | 
			(q getPositiveVotesSize )
				>= (self getAverageFromVotes: aQuestionCollection) ]
]

{ #category : #private }
PopularTodayRetriever >> retrievePopularQuestions [
	^ self getQuestionsByAverageVoteFrom: cuoora getQuestionsFromToday
]

{ #category : #protected }
PopularTodayRetriever >> retrieveQuestionsBaseOnOption: aUser [
	^ self retrievePopularQuestions
]

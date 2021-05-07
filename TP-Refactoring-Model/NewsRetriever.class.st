Class {
	#name : #NewsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #private }
NewsRetriever >> retrieveNewQuestions [
	^ self getQuestionsByVoteFrom: cuoora getQuestionsFromToday
]

{ #category : #protected }
NewsRetriever >> retrieveQuestionsBaseOnOption: aUser [
	^ self retrieveNewQuestions
]

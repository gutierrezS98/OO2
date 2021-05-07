Class {
	#name : #TopicsRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #protected }
TopicsRetriever >> retrieveQuestionsBaseOnOption: aUser [
	^ self retrieveTopicQuestions: aUser
]

{ #category : #private }
TopicsRetriever >> retrieveTopicQuestions: aUser [
	^ self getQuestionsByVoteFrom: aUser getQuestionsFromTopics 
]

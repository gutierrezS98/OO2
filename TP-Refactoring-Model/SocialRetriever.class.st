Class {
	#name : #SocialRetriever,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #protected }
SocialRetriever >> retrieveQuestionsBaseOnOption: aUser [
	^ self retrieveSocialQuestions: aUser
]

{ #category : #private }
SocialRetriever >> retrieveSocialQuestions: aUser [
	^ self getQuestionsByVoteFrom: aUser getQuestionsFromFollowed 
]

Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'isLike',
		'timstamp',
		'publication',
		'user'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Vote class >> user: aUser dislikesPublication: aPublication [
	^ self new initializeWithUser:aUser withPublication:aPublication;
		dislike;
		yourself
]

{ #category : #'instance creation' }
Vote class >> user: aUser likesPublication: aPublication [
	^ self new initializeWithUser:aUser withPublication:aPublication;
		yourself
]

{ #category : #private }
Vote >> dislike [
	isLike := false.
]

{ #category : #initialize }
Vote >> initialize [
	isLike := true.
	timstamp := DateAndTime now.
	
]

{ #category : #initialize }
Vote >> initializeWithUser: aUser withPublication: aPublication [
	user:= aUser.
	publication:= aPublication
]

{ #category : #accessing }
Vote >> isLike [
	^ isLike
]

{ #category : #private }
Vote >> like [
	isLike := true.
]

{ #category : #accessing }
Vote >> user [
	^ user
]

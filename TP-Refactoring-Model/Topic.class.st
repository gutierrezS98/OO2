Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'intance creation' }
Topic class >> name: aName description: aDescription [
	^ self new
		initializeWithName:aName withDescription:aDescription;
		yourself
]

{ #category : #accessing }
Topic >> addQuestion: aQuetion [
	questions add: aQuetion 
]

{ #category : #initialize }
Topic >> initialize [
	questions := OrderedCollection new.
]

{ #category : #accessing }
Topic >> initializeWithName:aName withDescription:aDescription [
name:=aName.
description:=aDescription
]

{ #category : #accessing }
Topic >> questions [
	^ questions
]

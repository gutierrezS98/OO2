Class {
	#name : #Cancion,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'SpOOtify-Model'
}

{ #category : #'instance creation' }
Cancion class >> conNombre:unNombre [
^self new conNombre: unNombre
]

{ #category : #accessing }
Cancion >> conNombre:unNombre [
nombre:=unNombre
]

{ #category : #accessing }
Cancion >> nombre [ 
^nombre
]

Class {
	#name : #Album,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'temas'
	],
	#category : #'SpOOtify-Model'
}

{ #category : #'instance creation' }
Album class >> conNombre:unNombre conCanciones:canciones [ 
^self new conNombre: unNombre conCanciones: canciones.
]

{ #category : #accessing }
Album >> conNombre: unNombre conCanciones: canciones [
	nombre := unNombre.
	temas:=canciones
]

{ #category : #accessing }
Album >> devolverCanciones [
	^ temas
]

{ #category : #accessing }
Album >> devolverCancionesConTitulo: unTitulo [
	^ temas
		select:
			[ :tema | tema nombre includesSubstring: unTitulo caseSensitive: false ]
]

{ #category : #accessing }
Album >> devolverCancionesSiTieneSubstring: aString [
	(nombre includesSubstring: aString caseSensitive: false)
		ifTrue: [ ^ self devolverCanciones ].
		^OrderedCollection new.
]

{ #category : #accessing }
Album >> nombre [
	^ nombre
]

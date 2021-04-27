Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'albumes'
	],
	#category : #'SpOOtify-Model'
}

{ #category : #'instance creation' }
Autor class >> conNombre:unNombre [
^self new conNombre: unNombre 
]

{ #category : #accessing }
Autor >> agregarAlbum:unAlbum [
albumes add:unAlbum
]

{ #category : #accessing }
Autor >> conNombre:unNombre [
nombre :=unNombre
]

{ #category : #accessing }
Autor >> devolverAlbumes [
^albumes
]

{ #category : #accessing }
Autor >> devolverCancionesConTitulo: unTitulo [
	"^ self devolverTodasMisCanciones
		select:
			[ :cancion | cancion nombre includesSubstring: unTitulo caseSensitive: false ]"

	^ self devolverAlbumes
		flatCollect: [ :album | album devolverCancionesConTitulo: unTitulo ]
]

{ #category : #accessing }
Autor >> devolverCancionesDe: unAlbum [
	^ albumes flatCollect: [ :album | album devolverCancionesSiTieneSubstring: unAlbum ]
]

{ #category : #accessing }
Autor >> devolverCancionesSiTieneSubstring: aString [
	(nombre includesSubstring: aString caseSensitive: false)
		ifTrue: [ ^ self devolverTodasMisCanciones ].
		^ OrderedCollection .
]

{ #category : #accessing }
Autor >> devolverTodasMisCanciones [
	^ albumes flatCollect: [ :album | album devolverCanciones ]
]

{ #category : #initialize }
Autor >> initialize [ 
albumes:=OrderedCollection new
]

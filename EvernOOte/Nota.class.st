Class {
	#name : #Nota,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'fechaCreacion',
		'tags',
		'contenido'
	],
	#category : #'EvernOOte-Model'
}

{ #category : #'instance creation' }
Nota class >> conTitulo: unTitulo conTags: unosTags conContenido:unContenido [
^ self new conTitulo: unTitulo conTags:unosTags  conContenido: unContenido 
]

{ #category : #accessing }
Nota >> conTitulo:unTitulo conTags: unosTags conContenido: unContenido [ 
titulo:=unTitulo.
tags:=unosTags.
contenido:=unContenido
]

{ #category : #accessing }
Nota >> devolverContenido [
^contenido
]

{ #category : #accessing }
Nota >> devolverTamanio [
	^ self obtenerContenidoSize + self obtenerTagsSize
		+ self obtenerTituloSize + 10
]

{ #category : #accessing }
Nota >> fechasCoinciden:unaFecha [
^ fechaCreacion equals: unaFecha
]

{ #category : #initialize }
Nota >> initialize [ 
fechaCreacion := Date today
]

{ #category : #private }
Nota >> obtenerContenidoSize [
	^ contenido size
]

{ #category : #private }
Nota >> obtenerTagsSize [
	^ tags sumNumbers: [ :tag | tag size ]
]

{ #category : #private }
Nota >> obtenerTituloSize [
	^ titulo size
]

{ #category : #accessing }
Nota >> titulosCoinciden:unTitulo [
	^ titulo includesSubstring: unTitulo caseSensitive: false
]

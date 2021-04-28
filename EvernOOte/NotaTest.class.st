Class {
	#name : #NotaTest,
	#superclass : #TestCase,
	#instVars : [
		'nota',
		'titulo',
		'fechaCreacion',
		'tags',
		'contenido'
	],
	#category : #'EvernOOte-Tests'
}

{ #category : #running }
NotaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	tags := OrderedCollection new.
	contenido := 'One Two Three Four!'. 
	tags
		add: 'Musica';
		add: 'Guitarra';
		add: 'Practica'.
	nota := Nota
		conTitulo: 'Ensayar con da guitadita da guitadita'
		conTags: tags
		conContenido: contenido
]

{ #category : #tests }
NotaTest >> testDevolverContenido [
	self assert: nota devolverContenido equals: contenido
]

{ #category : #testing }
NotaTest >> testDevolverTamanio [
	self assert: nota devolverTamanio equals: 88
]

{ #category : #testing }
NotaTest >> testObtenerContenidoSize [
	self assert: nota obtenerContenidoSize equals: 19
]

{ #category : #testing }
NotaTest >> testObtenerTagsSize [
	"tags sumNumbers: [ :tag | tag size ]"

	self assert: nota obtenerTagsSize equals: 22
]

{ #category : #testing }
NotaTest >> testObtenerTituloSize [
	self assert: nota obtenerTituloSize equals: 37
]

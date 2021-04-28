Class {
	#name : #NotebookTest,
	#superclass : #TestCase,
	#instVars : [
		'notebook',
		'notebook2',
		'notas',
		'nota1',
		'nota2',
		'tags',
		'contenido',
		'contenido2',
		'tags2'
	],
	#category : #'EvernOOte-Tests'
}

{ #category : #running }
NotebookTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	notas := OrderedCollection new.
	tags := OrderedCollection new.
	tags2 := OrderedCollection new.
	notebook := Notebook conNombre: 'DayxDay'.
	contenido := 'One Two Three Four!'.
	contenido2 := 'Bueno, si se'.
	tags
		add: 'Musica';
		add: 'Guitarra';
		add: 'Practica'.
	tags2 add: 'Ay no C'.
	notas
		add:
			(notebook
				crearNotaConTitulo: 'Practicar con da guitadita da guitadita'
				conTags: tags
				conContenido: contenido).
	notas
		add:
			(notebook
				crearNotaConTitulo: 'Practicar Objetos'
				conTags: tags2
				conContenido: contenido2)
]

{ #category : #testing }
NotebookTest >> testBorrarNota [
| notaAux tagsAux |
	tagsAux := OrderedCollection new.
	tagsAux add: 'Jeje ta bien'.
	notaAux := (notebook
		crearNotaConTitulo: 'Test'
		conTags: tagsAux
		conContenido: 'Que onda').
	self assert: (notebook devolverNotas includes: notaAux) equals: true.
	notebook borrarNota:notaAux.
	self assert:(notebook devolverNotas includes: notaAux) equals:false
]

{ #category : #testing }
NotebookTest >> testCalcularTamanio [
	self assert: notebook calcularTamanio equals: 136
]

{ #category : #testing }
NotebookTest >> testCrearNotaConTituloConTagsConContenido [
	| notaAux tagsAux |
	tagsAux := OrderedCollection new.
	tagsAux add: 'Jeje ta bien'.
	notaAux := notebook
		crearNotaConTitulo: 'Test'
		conTags: tagsAux
		conContenido: 'Que onda'.
	self assert: (notebook devolverNotas includes: notaAux) equals:true
]

{ #category : #tests }
NotebookTest >> testDevolverNotasPorFecha [
	self assertCollection: (notebook devolverNotasPorFecha: Date today)includesAll: notas
]

{ #category : #tests }
NotebookTest >> testDevolverNotasPorTitulo [
	self
		assertCollection: (notebook devolverNotasPorTitulo: 'Practicar')
		includesAll: notas
]

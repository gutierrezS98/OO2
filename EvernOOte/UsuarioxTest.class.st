Class {
	#name : #UsuarioxTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'notebook',
		'notas',
		'tags',
		'tags2',
		'contenido',
		'contenido2'
	],
	#category : #'EvernOOte-Tests'
}

{ #category : #running }
UsuarioxTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	notas := OrderedCollection new.
	tags := OrderedCollection new.
	tags2 := OrderedCollection new.
	usuario := Usuariox conNombre: 'Codubi'.
	notebook := usuario crearNotebookConNombre: 'DayxDay'.
	contenido := 'One Two Three Four!'.
	contenido2 := 'Bueno, si se'.
	tags
		add: 'Musica';
		add: 'Guitarra';
		add: 'Practica'.
	tags2 add: 'Objetos'.
	notas
		add:
			(notebook
				crearNotaConTitulo: 'Practicar con da guitadita da guitadita'
				conTags: tags
				conContenido: contenido).
	notas
		add:
			(notebook
				crearNotaConTitulo: 'Practicar objetos'
				conTags: tags2
				conContenido: contenido2)
]

{ #category : #testing }
UsuarioxTest >> testBorrarNotebook [
	| notebookAux |
	notebookAux := usuario crearNotebookConNombre: 'Jeje ta bien'.
	self
		assert: (usuario devolverNotebooks includes: notebookAux)
		equals: true.
	usuario
		borrarNotebook: notebookAux.
	 self
		assert: (usuario devolverNotebooks includes: notebookAux)
		equals: false
]

{ #category : #testing }
UsuarioxTest >> testCrearNotebookConNombre [
|notebookAux|
notebookAux:=usuario crearNotebookConNombre:'Jeje ta bien'.
self assert: (usuario devolverNotebooks includes:notebookAux) equals:true
]

{ #category : #testing }
UsuarioxTest >> testDevolverNotasPorFecha [
	self
		assertCollection: (usuario devolverNotasPorFecha: Date today)
		includesAll: notas
]

{ #category : #testing }
UsuarioxTest >> testDevolverNotasPorNotebook [
	self
		assertCollection: (usuario devolverNotasPorNotebook: notebook)
		includesAll: notas
]

{ #category : #testing }
UsuarioxTest >> testDevolverNotasPorTitulo [ 
self assertCollection: (usuario devolverNotasPorTitulo: 'Practicar') includesAll: notas
]

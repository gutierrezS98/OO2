Class {
	#name : #EvernOOteTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'notebook',
		'nota',
		'notas',
		'tags'
	],
	#category : #'EvernOOte-Tests'
}

{ #category : #running }
EvernOOteTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	tags := OrderedCollection new.
	notas:=OrderedCollection new.
	tags add: 'Test'.
	usuario := Usuariox conNombre: 'Codubi'.
	notebook := usuario crearNotebookConNombre: 'DayxDay'.
	nota := notebook
		crearNotaConTitulo: 'Ay no c'
		conTags: tags
		conContenido: 'Bueno, si se'.
	notas add: nota
]

{ #category : #testing }
EvernOOteTest >> testBuscarNotasPorFecha [
	self
		assertCollection: (usuario devolverNotasPorFecha: Date today)
		includesAll: notas
]

{ #category : #testing }
EvernOOteTest >> testBuscarNotasPorNotebook [
	self
		assertCollection: (usuario devolverNotasPorNotebook: notebook)
		includesAll: notas
]

{ #category : #testing }
EvernOOteTest >> testBuscarNotasPorTitulo [
	self
		assertCollection: (usuario devolverNotasPorTitulo: 'Ay')
		includesAll: notas
]

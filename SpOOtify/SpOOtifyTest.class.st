Class {
	#name : #SpOOtifyTest,
	#superclass : #TestCase,
	#instVars : [
		'autor',
		'autor2',
		'usuario',
		'album',
		'cancion',
		'cancionSoldOut',
		'cancionSold',
		'canciones',
		'spOOtify'
	],
	#category : #'SpOOtify-Tests'
}

{ #category : #running }
SpOOtifyTest >> setUp [
	"Cargo coleccion de canciones que seran las que se agregaran al album"

	spOOtify := SpOOtify new.
	canciones := OrderedCollection new.
	cancionSoldOut := Cancion conNombre: 'Sold Out'.
	cancionSold := Cancion conNombre: 'Sold'.
	canciones
		add: (Cancion conNombre: 'Toro');
		add: (Cancion conNombre: 'The Weather');
		add: (Cancion conNombre: 'I Can Fool Anybody in This Town');
		add: (Cancion conNombre: 'Nine');
		add: (Cancion conNombre: 'Sepulveda Basin');
		add: cancionSold;
		add: cancionSoldOut.
	album := Album
		conNombre: 'I Can Fool Anybody in This Town'
		conCanciones: canciones.
	autor2 := Autor conNombre: 'Audioslave'.
	autor := Autor conNombre: 'Liily'.
	autor agregarAlbum: album.
	usuario:=UsuariO conNombreUsuario: 'Codubi'.
	spOOtify agregarAutor: autor.
]

{ #category : #testing }
SpOOtifyTest >> testAgregarAutor [
	spOOtify agregarAutor: autor2.
	self assert: (spOOtify devolverAutores includes: autor2) equals: true
]

{ #category : #testing }
SpOOtifyTest >> testAgregarUsuario [
	spOOtify agregarUsuario: usuario.
	self
		assert: (spOOtify devolverUsuarios includes: usuario)
		equals: true
]

{ #category : #testing }
SpOOtifyTest >> testBuscarPorAlbum [
	self
		assertCollection: (spOOtify buscarPorAlbum: 'I Can Fool Anybody in This Town')
		includesAll: canciones
]

{ #category : #testing }
SpOOtifyTest >> testBuscarPorAutor [
	self
		assertCollection: (spOOtify buscarPorAutor: 'Liily')
		includesAll: canciones
]

{ #category : #testing }
SpOOtifyTest >> testBuscarPorTitulo [
	| cancionesABuscar |
	cancionesABuscar := OrderedCollection new.
	cancionesABuscar
		add: cancionSold;
		add: cancionSoldOut.
	self
		assertCollection: (spOOtify buscarPorTitulo: 'Sold')
		includesAll: cancionesABuscar
]

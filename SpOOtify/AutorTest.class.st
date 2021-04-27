Class {
	#name : #AutorTest,
	#superclass : #TestCase,
	#instVars : [
		'autor',
		'albumesABuscar',
		'album',
		'album2',
		'canciones',
		'cancionSoldOut',
		'cancionSold'
	],
	#category : #'SpOOtify-Tests'
}

{ #category : #running }
AutorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	cancionSoldOut := Cancion conNombre: 'Sold Out'.
	cancionSold := Cancion conNombre: 'Sold'.
	albumesABuscar := OrderedCollection new.
	canciones := OrderedCollection new.
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
	autor := Autor conNombre: 'Liily'
]

{ #category : #testing }
AutorTest >> testAgregarAlbum [
autor agregarAlbum: album.
self assert: (autor devolverAlbumes includes:album)equals:true
]

{ #category : #testing }
AutorTest >> testDevolverAlbumes [
	album2 := Album conNombre: 'Wash' conCanciones: 'Wash'.
	autor agregarAlbum: album;agregarAlbum: album2.
	albumesABuscar
		add: album;
		add: album2.
	self
		assertCollection: autor devolverAlbumes
		includesAll: albumesABuscar
]

{ #category : #testing }
AutorTest >> testDevolverCancionesConTitulo [
	| cancionesABuscar |
	cancionesABuscar := OrderedCollection new.
	autor agregarAlbum: album.
	cancionesABuscar
		add: cancionSold;
		add: cancionSoldOut.
	self
		assertCollection: (autor devolverCancionesConTitulo: 'Sold')
		includesAll: cancionesABuscar
]

{ #category : #testing }
AutorTest >> testDevolverCancionesDe [
autor agregarAlbum: album.
self assertCollection: (autor devolverCancionesDe: 'I Can Fool Anybody in This Town') includesAll:canciones 
]

{ #category : #testing }
AutorTest >> testDevolverTodasMisCanciones [
autor agregarAlbum: album.
self assertCollection: (autor devolverTodasMisCanciones) includesAll:canciones 
]

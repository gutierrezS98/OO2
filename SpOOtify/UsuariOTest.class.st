Class {
	#name : #UsuariOTest,
	#superclass : #TestCase,
	#instVars : [
		'cancion',
		'usuario'
	],
	#category : #'SpOOtify-Tests'
}

{ #category : #running }
UsuariOTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	cancion := Cancion conNombre: 'Blue Monday'.
	usuario := UsuariO conNombreUsuario: 'Codubi'
]

{ #category : #testing }
UsuariOTest >> testAgregarCancion [
	usuario agregar: cancion.
	self assert: (usuario devolverCanciones includes: cancion) equals:true
]

{ #category : #testing }
UsuariOTest >> testRemoverCancion [
	usuario agregar: cancion.
	self
		assert: (usuario devolverCanciones includes: cancion)
		equals: true.
	usuario remover: cancion.
	self
		assert: (usuario devolverCanciones includes: cancion)
		equals: false
]

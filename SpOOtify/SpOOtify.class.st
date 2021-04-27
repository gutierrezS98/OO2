Class {
	#name : #SpOOtify,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'autores'
	],
	#category : #'SpOOtify-Model'
}

{ #category : #accessing }
SpOOtify >> agregarAutor:unAutor [
autores add:unAutor
]

{ #category : #accessing }
SpOOtify >> agregarUsuario: unUsuario [
	usuarios add: unUsuario 
]

{ #category : #accessing }
SpOOtify >> buscarPorAlbum:aString [
^autores flatCollect: [ :autor | autor devolverCancionesDe: aString ]
]

{ #category : #accessing }
SpOOtify >> buscarPorAutor: aString [
	^ autores flatCollect: [ :autor | autor devolverCancionesSiTieneSubstring: aString ]
]

{ #category : #accessing }
SpOOtify >> buscarPorTitulo: aString [
	^ autores
		flatCollect: [ :autor | autor devolverCancionesConTitulo: aString ]
]

{ #category : #accessing }
SpOOtify >> devolverAutores [
^autores
]

{ #category : #accessing }
SpOOtify >> devolverUsuarios [
	^ usuarios
]

{ #category : #initialize }
SpOOtify >> initialize [
autores:=OrderedCollection new .
usuarios:=OrderedCollection new.
]

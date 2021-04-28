Class {
	#name : #EvernOOte,
	#superclass : #Object,
	#instVars : [
		'usuarios'
	],
	#category : #'EvernOOte-Model'
}

{ #category : #accessing }
EvernOOte >> buscarNotasPorFecha: unaFecha [
	^usuarios devolverNotasPorFecha: unaFecha
]

{ #category : #accessing }
EvernOOte >> buscarNotasPorNotebook: unaNotebook [
	^ usuarios devolverNotasPorNotebook: unaNotebook 
]

{ #category : #accessing }
EvernOOte >> buscarNotasPorTitulo: unTitulo [
	^usuarios devolverNotasPorTitulo: unTitulo 
]

Class {
	#name : #UsuariO,
	#superclass : #Object,
	#instVars : [
		'nombreUsuario',
		'myMusic'
	],
	#category : #'SpOOtify-Model'
}

{ #category : #'instance creation' }
UsuariO class >> conNombreUsuario: unNombreUsuario [
^ self new conNombreUsuario: unNombreUsuario
]

{ #category : #accessing }
UsuariO >> agregar:aSong [
myMusic add:aSong
]

{ #category : #accessing }
UsuariO >> conNombreUsuario: unNombreUsuario [
	nombreUsuario:= unNombreUsuario
]

{ #category : #accessing }
UsuariO >> devolverCanciones [ 
^myMusic 
]

{ #category : #initialize }
UsuariO >> initialize [ 
myMusic := OrderedCollection new
]

{ #category : #accessing }
UsuariO >> remover:aSong [
myMusic remove:aSong
]

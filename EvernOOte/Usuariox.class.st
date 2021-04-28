Class {
	#name : #Usuariox,
	#superclass : #Object,
	#instVars : [
		'nombreUsuario',
		'notebooks'
	],
	#category : #'EvernOOte-Model'
}

{ #category : #'instance creation' }
Usuariox class >> conNombre: unNombre [ 
^self new conNombre:unNombre
]

{ #category : #accessing }
Usuariox >> borrarNotebook:unaNotebook [
notebooks remove: unaNotebook 
]

{ #category : #accessing }
Usuariox >> conNombre: unNombre [
nombreUsuario :=unNombre 
]

{ #category : #accessing }
Usuariox >> crearNotebookConNombre:unNombre [
|notebookNueva|
notebookNueva := Notebook conNombre: 'Jeje ta bien'.
notebooks add:notebookNueva .
^notebookNueva 

]

{ #category : #accessing }
Usuariox >> devolverNombreUsuario [
^nombreUsuario 
]

{ #category : #accessing }
Usuariox >> devolverNotasPorFecha: unaFecha [
	^ self devolverNotebooks
		flatCollect: [ :notebook | notebook devolverNotasPorFecha: unaFecha ]
]

{ #category : #accessing }
Usuariox >> devolverNotasPorNotebook: unaNotebook [
	self devolverNotebooks 
		detect: [ :notebook | notebook = unaNotebook ]
		ifFound: [ :notebook | ^ notebook devolverNotas ].
	^ OrderedCollection new
]

{ #category : #accessing }
Usuariox >> devolverNotasPorTitulo: unTitulo [
^ self devolverNotebooks flatCollect: [ :notebook | notebook devolverNotasPorTitulo: unTitulo ]
]

{ #category : #accessing }
Usuariox >> devolverNotebooks [
^notebooks 
]

{ #category : #initialize }
Usuariox >> initialize [ 
notebooks :=OrderedCollection new.
]

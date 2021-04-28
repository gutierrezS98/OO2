Class {
	#name : #Notebook,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'notas'
	],
	#category : #'EvernOOte-Model'
}

{ #category : #'instance creation' }
Notebook class >> conNombre:unNombre [
^self new conNombre:unNombre
]

{ #category : #accessing }
Notebook >> borrarNota:unaNota [
	notas remove:unaNota
]

{ #category : #accessing }
Notebook >> calcularTamanio [ 
^ notas sumNumbers: [ :nota | nota devolverTamanio ]
]

{ #category : #accessing }
Notebook >> conNombre:unNombre [
nombre:=unNombre 
]

{ #category : #accessing }
Notebook >> crearNotaConTitulo: unTitulo conTags: unosTags conContenido: unContenido [
	|nuevaNota|
	nuevaNota:=Nota conTitulo: unTitulo conTags: unosTags conContenido: unContenido.
	notas
		add: (nuevaNota).
	^nuevaNota
]

{ #category : #accessing }
Notebook >> devolverNombre [
^nombre
]

{ #category : #accessing }
Notebook >> devolverNotas [
^notas
]

{ #category : #accessing }
Notebook >> devolverNotasPorFecha: unaFecha [
	^ notas select: [ :nota | nota fechasCoinciden: unaFecha ]
]

{ #category : #accessing }
Notebook >> devolverNotasPorTitulo: unTitulo [
	^ notas select: [ :nota | nota titulosCoinciden: unTitulo ]
]

{ #category : #initialize }
Notebook >> initialize [ 
notas:=OrderedCollection new.
]

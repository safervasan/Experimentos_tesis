# Código MATLAB para los Experimentos Numéricos de la Tesis de Maestría "*Un enfoque alternativo para la aproximación de la pseudoinversa tensorial y su aplicación en el procesamiento de imágenes y videos*" 

## Author  
Samuel Valverde-Sánchez - correo electrónico: [samuel.valverde@ucr.ac.cr](mailto:samuel.valverde@ucr.ac.cr) / [savalverde@itcr.ac.cr](mailto:savalverde@itcr.ac.cr)

Samuel Valverde-Sánchez es profesor instructor en el *Instituto Tecnológico de Costa Rica* [Instituto Tecnológico de Costa Rica](https://www.tec.ac.cr/) y estudiante de la maestría en Métodos Matemáticos y Aplicaciones en la *Universidad de Costa Rica* [Universidad de Costa Rica](https://www.ucr.ac.cr/).

## Descripción
Este repositorio contiene el código en MATLAB correspondiente a los experimentos numéricos de la tesis de maestría *"Un enfoque alternativo para la aproximación de la pseudoinversa tensorial y su aplicación en el procesamiento de imágenes y videos"*.

- La tesis propone una alternativa para estimar la pseudoinversa de un tensor bajo el c-producto reducido como operación de multiplicación de tensores. El repositorio está organizado en cuatro carpetas que incluyen los experimentos numéricos de los capítulos 2, 4, 5 y 6.

- La carpeta *Capítulo_2* contiene los archivos del experimento realizado para estimar la pseudoinversa matricial empleando diversos métodos iterativos descritos en la literatura.

- La carpeta *Capítulo_4* incluye dos subcarpetas: *Experimento_1* y *Experimento_2*.  
  - *Experimento_1*: se enfoca en la estimación de la inversa tensorial para distintos valores de convergencia en el método iterativo propuesto.  
  - *Experimento_2*: realiza comparaciones en la estimación de la solución $\boldsymbol{\mathcal{X}}$ del sistema multilineal $\boldsymbol{\mathcal{A}}\ast \boldsymbol{\mathcal{X}} = \boldsymbol{\mathcal{B}}$, considerando tensores $\boldsymbol{\mathcal{A}}$ y $\boldsymbol{\mathcal{B}}$ de dimensiones apropiadas. Se comparan métodos presentes en la literatura con el método propuesto en la tesis.

- La carpeta *Capítulo_5* contiene los archivos asociados a tres experimentos descritos en ese capítulo:  
  1. Estimación de la pseudoinversa tensorial utilizando distintos valores de convergencia en el método iterativo propuesto.  
  2. Comparación entre el método propuesto y varios métodos presentes en la literatura.  
  3. Evaluación del método iterativo propuesto y de otros métodos de la literatura al incrementar el número de caras frontales de un tensor tridimensional.

- La carpeta *Capítulo_6* incluye los archivos de cuatro experimentos:  
  1. Comparación de métodos para reducción de ruido en tres imágenes a color, contrastando el método iterativo propuesto con otros de la literatura.  
  2. Reducción de ruido en un video en escala de grises mediante diversos métodos iterativos de la literatura y el método propuesto.  
  3. Experimento análogo al anterior, pero aplicado a una base de datos de imágenes en escala de grises.  
  4. Reducción de ruido en una imagen a color seleccionada aleatoriamente de una base de datos de imágenes a color.




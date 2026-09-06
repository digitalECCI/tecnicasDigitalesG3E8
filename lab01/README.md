        
# Lab01 - Sumador/Restador de 4 bits

# Integrantes
    * [<!-- juan carlos ramos arias. -->](<!-- juancramosar-droid -->) 
    * [<!-- daniel ducuara. -->](<!-- Remplace aqui link de usario 2 de github -->) 
    * [<!-- Remplace aqui nombre 3. -->](<!-- Remplace aqui link de usario 3 de github -->) 
# Informe

Indice:

1. [Documentación](#documentación-de-los-circuitos-implementados-implementado)
2. [Simulaciones](#simulaciones)
3. [Evidencias de implementación](#evidencias-de-implementación)
4. [Preguntas](#preguntas)
5. [Conclusiones](#conclusiones)
6. [Referencias](#referencias)

1 Documentación del diseño implementado

1.1.0 compuertas logicas
En esta primera parte del laboratorio se implementaron las compuertas
lógicas fundamentales **NOT, AND, OR, XOR y XNOR** mediante lenguaje
Verilog.

El objetivo fue comprobar su funcionamiento y relacionar cada operación
lógica con su correspondiente tabla de verdad.

Las entradas del circuito se definieron como `A` y `B`, mientras que
cada compuerta genera una salida independiente. Para la compuerta
**NOT** únicamente se utiliza la entrada `A`.

- **NOT:** invierte el estado lógico de la entrada.
- **AND:** genera una salida lógica `1` únicamente cuando ambas entradas son `1`.
- **OR:** genera una salida `1` cuando al menos una de las entradas es `1`.
- **XOR:** genera una salida `1` cuando las entradas presentan valores diferentes.
- **XNOR:** genera una salida `1` cuando ambas entradas presentan el mismo valor lógico.

| Compuerta | Expresión |
|---|---|
| NOT | `Y = ~A` |
| AND | `Y = A & B` |
| OR | `Y = A \| B` |
| XOR | `Y = A ^ B` |
| XNOR | `Y = ~(A ^ B)` 

En Verilog estas operaciones pueden implementarse mediante operadores lógicos o mediante primitivas propias del lenguaje. En este laboratorio se utilizaron ambas formas con el propósito de observar que producen el mismo comportamiento lógico.
posteriormente, el diseño fue simulado para verificar que las salidas obtenidas coincidieran con los valores esperados de la tabla de verdad.
        
1.1.1 Descripción
En esta actividad se diseñó un circuito combinacional en Verilog para implementar las compuertas lógicas NOT, AND, OR, XOR y XNOR. El sistema utiliza las señales A y B como entradas y genera una salida independiente para cada operación lógica
la implementación permite observar directamente el comportamiento de cada compuerta ante las diferentes combinaciones de entrada. Posteriormente, el circuito es simulado para comparar las salidas obtenidas con las correspondientes tablas de verdad y comprobar el correcto funcionamiento del diseño
además, se emplean tanto operadores lógicos de Verilog como primitivas del lenguaje, permitiendo comparar dos formas diferentes de describir un mismo circuito digital.


#### 1.2 Diagramas


## Simulaciones 

### 1. Simulación del sumador/restador

#### 1.1 Descripción

#### 1.2 Diagrama


## Evidencias de implementación


## Conclusiones


## Referencias


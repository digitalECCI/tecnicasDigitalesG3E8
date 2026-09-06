        
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

En Verilog estas operaciones pueden implementarse mediante operadores lógicos o mediante primitivas
propias del lenguaje. En este laboratorio se utilizaron ambas formas con el propósito de observar que
producen el mismo comportamiento lógico.
posteriormente, el diseño fue simulado para verificar que las salidas obtenidas coincidieran con los
valores esperados de la tabla de verdad.
        
1.1.1 Descripción

En esta actividad se diseñó un circuito combinacional en **Verilog**
para implementar las compuertas lógicas **NOT, AND, OR, XOR y XNOR**.

El sistema utiliza las señales `A` y `B` como entradas y genera una
salida independiente para cada operación lógica.

La implementación permite observar directamente el comportamiento de
cada compuerta ante las diferentes combinaciones de entrada.

Posteriormente, el circuito fue simulado para comparar las salidas
obtenidas con las tablas de verdad correspondientes y comprobar el

1.1.2 Diagramas
El circuito correspondiente a las compuertas lógicas fue representado en el simulador **Digital**, permitiendo 
visualizar la conexión entre las entradas y las diferentes operaciones lógicas implementadas.
#### Tabla de verdad

La siguiente tabla muestra el estado de las salidas para cada combinación posible de las entradas `A` y `B`.

| A | B | NOT A | AND | OR | XOR | XNOR |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 1 | 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 | 1 | 1 | 0 |
| 1 | 1 | 0 | 1 | 1 | 0 | 1 |

**Tabla 1.** Tabla de verdad correspondiente a las compuertas lógicas implementadas.

1 Simulaciones 

1.1 Descripción

Para verificar el funcionamiento del diseño se utilizó **Icarus Verilog** como herramienta de compilación y simulación del
código HDL, complementado con **GTKWave** para la visualización gráfica de las señales generadas durante la simulación.
Icarus Verilog permite compilar el módulo diseñado y su correspondiente archivo de prueba o *testbench*. A partir de la ejecución 
de la simulación se genera un archivo de formas de onda, el cual posteriormente es abierto en GTKWave.

Mediante GTKWave se observaron las señales de entrada `A` y `B`, junto con las salidas correspondientes a las compuertas 
**NOT, AND, OR, XOR y XNOR**. Se probaron todas las combinaciones posibles de las entradas con el fin de comprobar que las salidas 
obtenidas coincidieran con los valores establecidos en la tabla de verdad.

El flujo utilizado para la simulación fue:

`Código Verilog → Testbench → Icarus Verilog → Archivo de ondas → GTKWave`

A continuación se presentan las formas de onda obtenidas durante la simulación.

1.2 Simulación compuertas logicas

### 2.1 Simulación de compuertas lógicas

La siguiente figura muestra las formas de onda obtenidas mediante **Icarus Verilog** y visualizadas en **GTKWave**. En la simulación
se observan las entradas `A` y `B`, junto con las salidas correspondientes a las compuertas `AND`, `NOT`, `OR`, `XNOR` y `XOR`.

![Simulación de compuertas lógicas en GTKWave](img/simulacion_compuertas_gtkwave_lab1.png)

**Figura 2.** Simulación de las compuertas lógicas mediante Icarus Verilog y GTKWave.

1.2.1 Diagrama
#### 1.1.2 Diagramas

El siguiente diagrama corresponde a la implementación de las compuertas lógicas en el simulador **Digital**, donde se representan las entradas
y las salidas asociadas a cada operación lógica.

![Diagrama de compuertas lógicas en Digital](img/compuertas_digital_lab_1.png)

**Figura 1.** Diagrama de las compuertas lógicas implementadas en el simulador Digital.

1.3 Evidencias de implementación.

Para la implementación física del diseño se utilizó **Quartus Prime** como entorno de desarrollo para compilar y cargar el código **Verilog**
en una tarjeta **FPGA DE10-Lite**.
Inicialmente, se creó un proyecto en Quartus y se agregó el archivo Verilog correspondiente al circuito diseñado. Posteriormente, se definió
el módulo principal como **Top-Level Entity** y se realizó el proceso de **Analysis & Synthesis** para verificar que el código no presentara 
errores de sintaxis ni de descripción lógica.
Una vez validado el diseño, se utilizó la herramienta **Pin Planner** para asignar las entradas y salidas del circuito a los pines físicos de 
la FPGA. Las señales de entrada fueron asociadas a los interruptores de la tarjeta y las señales de salida a los LED disponibles en la DE10-Lite.
Después de realizar la asignación de pines, se ejecutó la compilación completa del proyecto, generando el archivo de programación correspondiente.
Finalmente, mediante la herramienta **Programmer** de Quartus y una conexión USB-Blaster, se cargó el diseño en la FPGA DE10-Lite.
La implementación permitió comprobar físicamente el comportamiento de las compuertas lógicas, verificando que las salidas observadas en los LED 
coincidieran con los resultados obtenidos previamente en la simulación.

#### Código Verilog implementado

El siguiente código corresponde a la implementación de las compuertas lógicas mediante primitivas de Verilog.

```verilog
module ejercicio_1_1(
    input A,
    input B,
    output SAND,
    output SNOT,
    output SOR,
    output SXOR,
    output SXNOR
);

    and  (SAND,  A, B);
    not  (SNOT,  A);
    or   (SOR,   A, B);
    xor  (SXOR,  A, B);
    xnor (SXNOR, A, B);

endmodule
```

#### Testbench

Para verificar el funcionamiento de las compuertas lógicas se desarrolló un **testbench** que genera las cuatro combinaciones posibles de las entradas `A` y `B`. Los resultados de la simulación se almacenan en un archivo `.vcd`, posteriormente visualizado mediante **GTKWave**.

```verilog
// Se incluye el archivo que contiene el módulo principal
`include "laboratorio_1_1.v"

// Se define la escala de tiempo
`timescale 1s/1s

module ejercicio_1_1_TB();

// Entradas del circuito utilizadas durante la simulación
reg A_TB;
reg B_TB;

// Salidas del circuito
wire SAND_TB;
wire SOR_TB;
wire SNOT_TB;
wire SXOR_TB;
wire SXNOR_TB;

// Instancia del módulo que se desea comprobar
ejercicio_1_1 uut (
    .A(A_TB),
    .B(B_TB),
    .SAND(SAND_TB),
    .SOR(SOR_TB),
    .SNOT(SNOT_TB),
    .SXOR(SXOR_TB),
    .SXNOR(SXNOR_TB)
);

initial begin

    // Caso 1: A = 0, B = 0
    A_TB = 1'b0;
    B_TB = 1'b0;

    #5;

    // Caso 2: A = 1, B = 0
    A_TB = 1'b1;
    B_TB = 1'b0;

    #5;

    // Caso 3: A = 0, B = 1
    A_TB = 1'b0;
    B_TB = 1'b1;

    #5;

    // Caso 4: A = 1, B = 1
    A_TB = 1'b1;
    B_TB = 1'b1;

    #5;

end

initial begin : TEST_CASE

    // Archivo utilizado para visualizar las señales en GTKWave
    $dumpfile("simulacion1.1.vcd");

    // Se almacenan las señales de la instancia uut
    $dumpvars(-1, uut);

    #50;
    $finish;

end

endmodule
```


## Conclusiones


## Referencias


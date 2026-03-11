Práctica: Sistema con Contraseña en FPGA DE10-Lite
Objetivo:
Diseñar e implementar en Verilog un sistema de contraseña en la FPGA DE10-Lite utilizando Máquinas de Estados Finitos (FSM). El sistema debe:
✅ Ingresar la contraseña usando 4 switches para introducir un nibble a la vez.
✅ Evaluar una secuencia de 16 switches secuenciados.
✅ Mostrar el valor en los displays si el nibble es correcto.
✅ Mostrar "Good" en los displays si la secuencia es correcta.
✅ Mostrar "Bad" si hay un error en cualquier punto de la secuencia.

Materiales Necesarios:
Tarjeta FPGA DE10-Lite (Intel Cyclone V)
Cable USB Blaster
Software Intel Quartus Prime Lite
Código en Verilog
Descripción del Funcionamiento:
Ingreso de contraseña

Se ingresará un nibble a la vez usando los switches (SW) de la FPGA.
El sistema esperará la activación de un botón para capturar cada entrada.
Validación de la contraseña

Se comparará la secuencia ingresada con una clave predefinida de 16 bits, introducida de manera secuencial mediante cuatro nibbles (4 bits cada uno).
Si el nibble es correcto, se mostrará su valor en los displays de 7 segmentos.
Si la secuencia es correcta, se mostrará "Good" en los displays de 7 segmentos.
Si en cualquier punto hay un error, se mostrará "Bad" en los displays de 7 segmentos.

<img width="1200" height="1600" alt="image" src="https://github.com/user-attachments/assets/a4b213e0-6008-44c1-8424-2fe6e3397c64" />

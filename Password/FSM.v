module FSM(
    input clk,
    input rst,
    input [3:0] fms_in,   // switches
    input KEY,            // boton para confirmar
    output reg fms_out,
    output reg [2:0] state_out,
    output reg [15:0] display_val
);

// Estados
parameter IDLE = 0,
          N1   = 1,
          N2   = 2,
          N3   = 3,
          N4   = 4,
          GOOD = 5,
          BAD  = 6;

reg [2:0] state, next;

// Contraseña (puedes cambiarla)
parameter P1 = 4'hA;
parameter P2 = 4'h5;
parameter P3 = 4'hC;
parameter P4 = 4'h3;


// Registro de estado actual
always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= IDLE;
    else
        state <= next;
end


// Lógica de transición
always @(*)
begin
    case(state)

        IDLE:
            if(KEY)
                if(fms_in == P1)
                    next = N1;
                else
                    next = BAD;
            else
                next = IDLE;

        N1:
            if(KEY)
                if(fms_in == P2)
                    next = N2;
                else
                    next = BAD;
            else
                next = N1;

        N2:
            if(KEY)
                if(fms_in == P3)
                    next = N3;
                else
                    next = BAD;
            else
                next = N2;

        N3:
            if(KEY)
                if(fms_in == P4)
                    next = GOOD;
                else
                    next = BAD;
            else
                next = N3;

        GOOD:
            next = GOOD;

        BAD:
            next = BAD;

        default:
            next = IDLE;

    endcase
end


// Lógica de salida
always @(*)
begin
    state_out = state;
    fms_out = 0;
    display_val = 16'b0;

    case(state)

        IDLE:
            display_val = 16'h0000;

        N1:
            display_val = {12'b0, fms_in};

        N2:
            display_val = {8'b0, fms_in, 4'b0};

        N3:
            display_val = {4'b0, fms_in, 8'b0};

        GOOD:
            display_val = 16'h600D; // "Good"

        BAD:
            display_val = 16'hBAD0; // "Bad"

    endcase
end

endmodule
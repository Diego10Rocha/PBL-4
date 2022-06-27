module modoLavagem (
    button,
    reset,
    currentState
);
    input button,reset;
    output reg [2:0]currentState;

    always @(posedge button or posedge reset) begin
        if(reset == 1'b1) begin
            case(currentState)
                3'b000: currentState = 3'b000;
                3'b001: currentState = 3'b000;
                3'b010: currentState = 3'b000;
                3'b011: currentState = 3'b000;
                3'b100: currentState = 3'b000;
                default: currentState = 3'b000;
            endcase
        end else if(button == 1'b1) begin
            case(currentState)
                3'b000: currentState = 3'b001;
                3'b001: currentState = 3'b010;
                3'b010: currentState = 3'b011;
                3'b011: currentState = 3'b100;
                3'b100: currentState = 3'b001;
                default: currentState = 3'b000;
            endcase
        end
    end 
    
endmodule 
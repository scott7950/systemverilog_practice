class data;
    rand int var1;
    int var2 = -1;

    constraint c {
        (var2 != -1) -> var1 == var2;
    }

    function new();
        if(!$value$plusargs("var2=%d", var2)) begin
            var2 = -1;
        end
    endfunction
endclass

program test;
data u_data;

initial begin
    u_data = new();

    if(!u_data.randomize()) begin
        $display("Randomize error");
    end
    else begin
        $display("%d", u_data.var1);
    end

    $finish();
end
endprogram


class base;
    int var1;

    virtual function void display1();
        $display("var1: %d", var1);
    endfunction

    function void display2();
        $display("var1: %d", var1);
    endfunction
endclass

class base_ext extends base;
    int var2;

    virtual function void display1();
        $display("var1: %d, var2: %d", var1, var2);
    endfunction

    function void display2();
        $display("var1: %d, var2: %d", var1, var2);
    endfunction
endclass

program test;
base b;
base_ext be;

initial begin
    b = new();
    be = new();
    b = be;

    be.var1 = 10;
    be.var2 = 20;
    b.var1 = 30;

    b.display1();
    b.display2();

    be.display1();
    be.display2();

    $finish();
end
endprogram


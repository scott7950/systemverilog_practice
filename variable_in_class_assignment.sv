class abc;
    int x;
endclass

program test;
abc a_0, a_1, a_2;

initial begin
    a_0 = new();
    a_1 = new();
    a_2 = new();

    a_0.x = 0;
    a_1.x = 1;
    a_2.x = 2;

    a_1 = a_2;
    a_0.x = a_1.x;

    a_1.x = 4;
    a_2.x = 5;

    //2 5 5
    $display("a_0.x: %d  a_1.x: %d  a_2.x: %d", a_0.x, a_1.x, a_2.x);

    $finish();
end
endprogram


class abc;
    rand int x;

    constraint c1 {x inside {[10:20]};};

    //conflict
    //# Failed to randomize
    //#           0
    constraint c2 {x inside {[30:40]};};
endclass

program test;

abc a;

initial begin
    a = new();

    if(!a.randomize()) begin
        $display("Failed to randomize");
    end

    $display("%d", a.x);

    $finish();
end
endprogram


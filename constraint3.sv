class abc;
    rand int x;

    constraint c1 {x inside {[10:20]};};
endclass

class def extends abc;
    //if c2 is commented
    //use c1 to override the constraint
    //as constraint is like virtual function
    constraint c1 {x inside {[30:40]};};
endclass

program test;

abc a;
def d;

initial begin
    a = new();

    if(!a.randomize()) begin
        $display("Failed to randomize");
    end

    $display("%d", a.x);

    d = new();

    if(!d.randomize()) begin
        $display("Failed to randomize");
    end

    $display("%d", d.x);

    $finish();
end
endprogram


class abc;
    rand int x;

    constraint c1 {x inside {[10:20]};};
    constraint c2 {x inside {[15:30]};};
endclass

class def extends abc;
    constraint c3 {x inside {[17:30]};};
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


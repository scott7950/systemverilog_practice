int a = 10;

class data;
    int a = 20;

    rand int b;

    function new();
    endfunction

    function void display(int a = 30);
        $display("%d", a);
        $display("%d", this.a);
        $display("%d", $unit::a);

        $display("%d", b);
    endfunction
endclass

program test;
data u_data;
int b = 40;

initial begin
    u_data = new();
    
    if(!u_data.randomize() with {b == b;}) begin
        $display("Randomization failed");
    end
    u_data.display();

    if(!u_data.randomize() with {b == local::b;}) begin
        $display("Randomization failed");
    end
    u_data.display();

    $finish();
end
endprogram


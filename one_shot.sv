class one_shot_before;
    rand logic [31:0] data;
    rand int shift_num;

    constraint c {
        data[0]  + data[1]  + data[2]  + data[3]  + data[4]  + data[5]  + data[6]  + data[7]  +
        data[8]  + data[9]  + data[10] + data[11] + data[12] + data[13] + data[14] + data[15] + 
        data[16] + data[17] + data[18] + data[19] + data[20] + data[21] + data[22] + data[23] +
        data[24] + data[25] + data[26] + data[27] + data[28] + data[29] + data[30] + data[31] == 1;
    };
endclass

class one_shot;
    rand logic [31:0] data;
    rand int shift_num;

    constraint c {
        solve shift_num before data;
        shift_num inside {[0:31]};
        data == 1 << shift_num;
    };
endclass

program test;
one_shot_before u_one_shot_before;
one_shot u_one_shot;

initial begin
    u_one_shot_before = new();

    for(int i=0; i<100; i++) begin
        if(u_one_shot_before.randomize()) begin
            $display("data1: %h", u_one_shot_before.data);
        end
        else begin
            $display("Randomize failed");
        end
    end

    u_one_shot = new();

    for(int i=0; i<100; i++) begin
        if(u_one_shot.randomize()) begin
            $display("data2: %h", u_one_shot.data);
        end
        else begin
            $display("Randomize failed");
        end
    end

    $finish();
end

endprogram


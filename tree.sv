class treeNode;
    int data;
    treeNode next[$];

    function int addNode(int nodeData, int data);
        treeNode q[$];
        treeNode newNode;
        treeNode node;

        q.push_back(this);

        while(q.size() != 0) begin
            treeNode node = q.pop_front();

            if(node.data == nodeData) begin
                newNode = new();
                newNode.data = data;
                node.next.push_back(newNode);
                return 1;
            end

            foreach(node.next[i]) begin
                q.push_back(node.next[i]);
            end
        end

        return 0;
    endfunction

    function treeNode search(int data);
        treeNode q[$];
        treeNode node;

        q.push_back(this);

        while(q.size() != 0) begin
            node = q.pop_front();

            if(node.data == data) begin
                return node;
            end

            foreach(node.next[i]) begin
                q.push_back(node.next[i]);
            end

        end

        return null;
    endfunction
endclass

program test;
treeNode root = new();

initial begin
    root.data = 0;

    void'(root.addNode(0, 1));
    void'(root.addNode(0, 2));

    void'(root.addNode(1, 3));
    void'(root.addNode(1, 4));
    void'(root.addNode(1, 5));
    void'(root.addNode(1, 6));

    void'(root.addNode(2, 7));
    void'(root.addNode(2, 8));

    void'(root.addNode(3, 9));
    void'(root.addNode(3, 10));

    void'(root.addNode(4, 11));
    void'(root.addNode(4, 12));

    void'(root.addNode(5, 13));
    void'(root.addNode(5, 14));

    void'(root.addNode(6, 15));
    void'(root.addNode(6, 16));

    void'(root.addNode(7, 17));
    void'(root.addNode(7, 18));

    void'(root.addNode(8, 19));
    void'(root.addNode(8, 20));

    for(int i=0; i<30; i++) begin
        if(root.search(i) != null) begin
            $display("find %d", i);
        end
        else begin
            $display("Cannot find %d", i);
        end
    end

    $finish();
end

endprogram


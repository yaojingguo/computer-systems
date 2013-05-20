big = LOAD 'big_data' AS (b1,b2,b3);
tiny = LOAD 'tiny_data' AS (t1,t2,t3);
C = JOIN big BY b1, tiny BY t1 USING 'replicated';

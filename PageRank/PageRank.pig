# One iteration for PageRank
table = load 'input2/table' using PigStorage(' ') as (vertex:chararray, p:float);
graph = load 'input2/graph' using PigStorage(' ') as (vertex:chararray, dests:{out:(vertex:chararray)});

join_data = join table by vertex, graph by vertex;
projection_data = foreach join_data generate table::vertex as vertex, 
                                             graph::dests as dests,
                                             table::p as p;
pair = foreach projection_data generate flatten(dests) as vertex, p/SIZE(dests) as p_in;
group_data = group pair by vertex;
final_data = foreach group_data generate group as vertex, SUM(pair.p_in);

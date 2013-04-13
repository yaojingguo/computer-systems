results = LOAD 'results' USING PigStorage(',') AS (queryString, url, position);
revenue = LOAD 'revenue' USING PigStorage(',') AS (queryString, adSlot, amount);
grouped_data = COGROUP results BY queryString, revenue BY queryString;
join_the_other_way = FOREACH grouped_data GENERATE
                             flatten(results), flatten(revenue);

joined_data = JOIN results by queryString, revenue by queryString;

#######################
A = LOAD 'file1' USING PigStorage(' ') AS (x:int,y:int,z:int);
B = LOAD 'file2' USING PigStorage(' ') AS (t:int,u:int,v:int);
C = FILTER A by y > 0;
D = JOIN C by x, B by u;
E = group D by z;
F = FOREACH E GENERATE
    group, COUNT(D);
STORE F INTO 'output'; 

a = load 'complex' as (a0:{t:(m:map[int],d:double)});

# lecture
m = load 'movie.txt' using PigStorage(' ') as 
    (title:chararray, director:chararray, actors:{t:(name:chararray)});

/*m = load 'movie.txt' using PigStorage(' ') as */
/*    (title:chararray, director:chararray, actors {name});*/

m4 = foreach m generate title, director, FLATTEN(actors);
m6 = group m4 BY actors::name;

r = load 'ratings.txt' using PigStorage(' ') as (movie:chararray, rating:int);

more = cogroup r by movie, m by title;

way = join r by movie, m by title;
#file:///home/jing/dev/apache/pig-0.11.0/docs/perf.html#Replicated-Joins
#file:///home/jing/dev/apache/pig-0.11.0/docs/perf.html#replicated-joins

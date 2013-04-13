revenue = load 'revenue' using PigStorage(',') as (queryString:chararray, adSlot:chararray, amount:float);
grouped_revenue = GROUP revenue BY queryString;
query_revenues = FOREACH grouped_revenue {
                    top_slot = FILTER revenue BY adSlot == 'top';
                    GENERATE group as queryString,
                             SUM(top_slot.amount),
                             SUM(revenue.amount);
};

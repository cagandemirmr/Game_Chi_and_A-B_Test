
--First i check my variant and control groups in terms of complettion of Onboarding

select a.variant,
count(case when b.user_id is not null  then  a.user_id end) as completed,
count(case when b.user_id is null then a.user_id end) as not_completed
from exp_assignment a
left join game_actions b on a.user_id = b.user_id  and b.action ='onboarding complete'
where a.exp_name='Onboarding'
Group BY 1


--Cohort analysis of Onboarding status

select a.variant,
count(a.user_id) as total_cohorted,
count(b.user_id) as completed,
round(count(b.user_id) * 1.0/count(a.user_id),3)  as pct_completed
from exp_assignment a
left join game_actions b on a.user_id = b.user_id  and b.action ='onboarding complete'
where a.exp_name='Onboarding'
Group BY 1


-- Calculating mean and standart deviation 

select variant,
count(user_id) as total_cohorted,
round(avg(amount),3) as mean_amount,
round(stddev(amount),3) as stdev_amount
from
(select a.variant,
a.user_id,
sum(coalesce(b.amount,0)) as amount
from exp_assignment a
left join game_purchases b on a.user_id = b.user_id  
where a.exp_name='Onboarding'
Group BY 1,2)
Group by 1

--Calculating in general

select variant,
count(user_id) as total_cohorted,
round(avg(amount),3) as mean_amount,
round(stddev(amount),3) as stdev_amount
from
(select a.variant,
a.user_id,
sum(coalesce(b.amount,0)) as amount
from exp_assignment a
left join game_purchases b on a.user_id = b.user_id 
join game_actions c on a.user_id=c.user_id and c.action = 'onboarding complete'
where a.exp_name='Onboarding'
Group BY 1,2)
Group by 1

-- Challenges in Experimental Analysis

-- Outliers

select a.variant,count(distinct a.user_id) as total_cohorted,
count(distinct b.user_id) as purchaser,
round(count(distinct b.user_id) * 1.0 / count(distinct a.user_id),2) as pct_purchased
from exp_assignment a
left join game_purchases b on a.user_id = b.user_id 
join game_actions c on a.user_id=c.user_id and c.action = 'onboarding complete'
where a.exp_name='Onboarding'
Group by 1


-- Time Boxing

SELECT variant
,count(user_id) as total_cohorted
,round(avg(amount),2) as mean_amount
,round(stddev(amount),2) as stddev_amount
FROM
(
SELECT a.variant
,a.user_id
,sum(coalesce(b.amount,0)) as amount
FROM exp_assignment a
LEFT JOIN game_purchases b on a.user_id = b.user_id
and b.purch_date <= a.exp_date + interval '7 days'
WHERE a.exp_name = 'Onboarding'
GROUP BY 1,2
) a
GROUP By 1;

-- Pre and Post Analysis

SELECT
case when a.created between '2020-01-13' and '2020-01-26' then 'pre'
when a.created between '2020-01-27' and '2020-02-09' then 'post'
end as variant
,count(distinct a.user_id) as cohorted
,count(distinct b.user_id) as opted_in
,round(count(distinct b.user_id) * 1.0 / count(distinct a.user_id),2) as pct_optin
,count(distinct a.created) as days
FROM game_users a
LEFT JOIN game_actions b on a.user_id = b.user_id
and b.action = 'email_optin'
WHERE a.created between '2020-01-13' and '2020-02-09'
GROUP BY 1
;


-- By natural Lines

SELECT a.country
,count(distinct a.user_id) as total_cohorted
,count(distinct b.user_id) as purchasers
,round(count(distinct b.user_id) * 1.0 / count(distinct a.user_id),2)
as pct_purchased
FROM game_users a
LEFT JOIN game_purchases b on a.user_id = b.user_id
WHERE a.country in ('United States','Canada')
GROUP BY 1
;




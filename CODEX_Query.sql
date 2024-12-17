/*1a.Who prefers energy drink more? (male/female/non-binary?)*/
select gender ,count(Respondent_ID) as no_of_ppl_consuming 
from repondent
group by gender
order by 2 desc ;
select count(*)
from repondent;

/*1b.Which age group prefers energy drinks more?*/
select age , count(Respondent_ID) as total_no_of_ppl
from repondents2
group by 1
order by 2 desc ;

/*1c.Which type of marketing reaches the most Youth (15-30)*/
select  sr.marketing_channels , count(r.respondent_id) as total_no_of_ppl
from repondent as r  join  survey_responses as sr using(respondent_ID)
where 1st_age >= 15 and 2nd_age <= 30
group by sr.marketing_channels 
order by 2 desc;

/*2a.What are the preferred ingredients of energy drinks among respondents?*/
select ingredients_expected , count(respondent_id) as cnt_of_ppl_prefering_ingridents
from  survey_responses
group by ingredients_expected
order by 2 desc;

/*2b. What packaging preferences do respondents have for energy drinks?*/
select packaging_preference , count(respondent_id) as cnt_of_ppl_prefering_packages
from survey_responses
group by packaging_preference
order by  count(respondent_id) desc ;

/*3a.Who are the current market leaders?*/
select current_brands,count(Respondent_ID) as total_consumers
from repondent as r join survey_responses as sr using(respondent_id)
group by sr.current_brands
order by 2 desc ;

/*3b. What are the primary reasons consumers prefer those brands over ours?*/
select  Reasons_for_choosing_brands , count(respondent_id)
from survey_responses
where current_brands not in ('codex') 
group by   Reasons_for_choosing_brands
order by count(respondent_id) desc ;

/*4a.Which marketing channel can be used to reach more customers?*/
select marketing_channels , count(respondent_id) as cnt
from survey_responses
group by  marketing_channels
order by 2 desc;

/*4b. How effective are different marketing strategies and channels in reaching our customers?*/
select marketing_channels , count(respondent_id) as cnt
from survey_responses
where Current_brands = 'codex'
group by  marketing_channels
order by 2 desc;


/*5.a. What do people think about our brand? (overall rating)*/
select current_brands,avg(taste_experience)
from survey_responses
where Current_brands = 'codex';

select Brand_perception,count(Brand_perception),
count(Brand_perception)*100/sum(count(Brand_perception)) over () as percentage
from survey_responses
where Current_brands = 'codex'
group by Brand_perception
order by count(Brand_perception) desc;

/*5b.-- Which cities do we need to focus more on?*/
select city , count(respondent_id)
from cities as c  join repondent as r using(city_id) join survey_responses using(respondent_id)
where Current_brands = 'codex'
group by city
order by count(respondent_id) ;

/*6a. Where do respondents prefer to purchase energy drinks?*/
select Purchase_location , count(Respondent_ID)
from survey_responses
group by Purchase_location
order by count(Respondent_ID) desc ;

/*6b.What are the typical consumption situations for energy drinks among
respondents?*/
select distinct Typical_consumption_situations, count( Respondent_ID)
from survey_responses
group by 1
order by 2 desc;

/*6c.--What factors influence respondents' purchase decisions, such as price range andlimited edition packaging?*/
select Price_range , count(Respondent_ID)
from survey_responses
group by 1;

/*7.--Which area of business should we focus more on our product development?*/
select  Reasons_for_choosing_brands,count(Respondent_ID)
from survey_responses
group by 1
order by 2 asc;

/*8.Timely analysis */
select Consume_time , count(Respondent_ID)
from survey_responses
group by 1
order by 2 desc;

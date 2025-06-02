use blinkit_data;

select * from Blinkit_analysis;

select count (*) from Blinkit_analysis;

update Blinkit_analysis
set Item_Fat_Content = 
case 
when Item_Fat_Content in ('lf','low fat') then 'low fat'
when Item_Fat_Content = 'reg' then 'regular'
else Item_Fat_Content
end

select distinct (item_fat_content) from Blinkit_analysis;




select cast(sum(total_sales)/1000000 as decimal(10,2)) as total_sales_millions
from Blinkit_analysis
where Outlet_Establishment_Year = 2022

select cast(avg(total_sales) as decimal(10,2)) as avg_sales from Blinkit_analysis
where Outlet_Establishment_Year = 2022

select count (*) as no_of_items from Blinkit_analysis
where Outlet_Establishment_Year = 2022

select cast (avg(rating) as decimal (10,2)) as avg_rating from Blinkit_analysis

select item_fat_content ,
            cast ( sum (total_sales) /1000 as decimal(10,2)) as total_sales_thousands,
            cast( avg (total_sales) as decimal(10,1)) as avg_sales , 
            count(*) as no_of_items,
            cast (avg (rating) as decimal (10,2)) as avg_rating
from Blinkit_analysis
group by Item_Fat_Content
order by total_sales_thousands desc

select top 5 item_type ,
            cast ( sum (total_sales) as decimal(10,2)) as total_sales,
            cast( avg (total_sales) as decimal(10,1)) as avg_sales , 
            count(*) as no_of_items,
            cast (avg (rating) as decimal (10,2)) as avg_rating
from Blinkit_analysis
group by Item_type
order by total_sales asc


select outlet_location_type,item_fat_content ,
            cast ( sum (total_sales) as decimal(10,2)) as total_sales
            
from Blinkit_analysis
group by outlet_location_type,item_fat_content
order by total_sales asc;



 SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type , Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_analysis
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content in ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


select Outlet_Establishment_Year ,
            cast ( sum (total_sales) as decimal(10,2)) as total_sales,
            cast( avg (total_sales) as decimal(10,1)) as avg_sales , 
            count(*) as no_of_items,
            cast (avg (rating) as decimal (10,2)) as avg_rating
from Blinkit_analysis
group by Outlet_Establishment_Year
order by total_sales desc


select
    outlet_size,
    cast(sum(Total_Sales) as decimal (10,2)) as total_sales,
    cast((sum(Total_sales) * 100.0 / sum(sum(Total_Sales)) over()) as decimal (10,2)) as sales_percentage
from blinkit_analysis
group by outlet_size
order by total_sales desc ;


select Outlet_Location_Type ,
            cast ( sum (total_sales) as decimal(10,2)) as total_sales,
            cast( avg (total_sales) as decimal(10,1)) as avg_sales , 
            count(*) as no_of_items,
            cast (avg (rating) as decimal (10,2)) as avg_rating
from Blinkit_analysis
where Outlet_Establishment_Year = 2020
group by Outlet_Location_Type
order by total_sales desc






select Outlet_Type ,
            cast ( sum (total_sales) as decimal(10,2)) as total_sales,
            cast((sum(Total_sales) * 100.0 / sum(sum(Total_Sales)) over()) as decimal (10,2)) as sales_percentage,
            cast( avg (total_sales) as decimal(10,1)) as avg_sales , 
            count(*) as no_of_items,
            cast (avg (rating) as decimal (10,2)) as avg_rating
from Blinkit_analysis
group by Outlet_type
order by total_sales desc


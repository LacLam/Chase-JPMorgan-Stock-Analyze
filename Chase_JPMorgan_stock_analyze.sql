select *
from [project1-3].dbo.[JPMorgan Chase]

--Convert number to decimal by 2 (Chase and Goldman Sachs)
update [project1-3].dbo.[The Goldman Sachs]
set [Open] = CONVERT(decimal(10,2), [Open]),
	[High] = CONVERT(decimal(10,2), [High]),
	[Low] = CONVERT(decimal(10,2), [Low]),
	[Close] = CONVERT(decimal(10,2), [Close]),
	[Adj_Close] = CONVERT(decimal(10,2), [Adj_Close])

--Finding highest close in each years
SELECT YEAR([Date]) [years], MAX([Close]) as [highest_Close]
from [project1-3].dbo.[JPMorgan Chase]
group by YEAR([Date]);

--Finding avg volatility of the stock, lower the better
SELECT YEAR([Date]) [years], ROUND(avg(high-low),2) as avg_volatility
from [project1-3].dbo.[JPMorgan Chase]
group by YEAR([Date])
order by YEAR([Date])

--what date is the highest high of the stock?
select [Date],[Open],[High],[Low],[Close],[Adj_Close],[Volume]
from [project1-3].dbo.[JPMorgan Chase]
where [High] = (select MAX(High) from [project1-3].dbo.[JPMorgan Chase])



select [Date],[Open],[High],[Low],[Close],[Adj_Close],[Volume]
from [project1-3].dbo.[JPMorgan Chase]
where [Volume] >= '20000000'

select *
from [project1-3].dbo.[JPMorgan Chase] Chase
Inner Join [project1-3].dbo.[The Goldman Sachs] Sach
on chase.Date = Sach.Date

SELECT YEAR([Date]) [years], ROUND(avg(high-low),2) as Sach_avg_volatility
from [project1-3].dbo.[The Goldman Sachs]
group by YEAR([Date])
order by YEAR([Date])
-- Lista antalet produkter per kategori
select category.name, count(belongsTo.categoryId) as numberOfProducts from category
left join belongsTo on categoryId = category.id
group by category.name;

-- Lista kunderna som har köpt svarta Ecco-sandaler i storlek 38
select customer.name from customer
inner join orders on orders.customerId = customer.id
inner join orderDetails on orderDetails.orderId = orders.id
inner join shoe on shoe.id = orderDetails.shoeId
where orderDetails.shoeId = 4 and shoe.color = 'Black' and shoe.size = 38;

-- Skapa en kundlista med den totala summan pengar som varje kund har handlat för
select customer.name, sum(quantity * priceEach) as total from orderDetails
inner join orders on orderDetails.orderId = orders.id
inner join customer on orders.customerId = customer.id
group by customer.name
order by total desc;

-- lista de top 5 mest köpta skor
select shoe.id, sum(quantity) as top5 from orderDetails
inner join shoe on orderDetails.shoeId = shoe.id 
group by shoe.id
order by top5 desc
limit 5;

-- Lista det totala beställningsvärdet per ort där beställningsvärdet är större än 1000kr, 
-- ortnamn och värde ska visas
select customer.city, sum(quantity * priceEach) as total from orderDetails
inner join orders on orderDetails.orderId = orders.id
inner join customer on orders.customerId = customer.id
group by customer.city
having total > 1000
order by total;


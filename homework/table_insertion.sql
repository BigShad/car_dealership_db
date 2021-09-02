INSERT INTO "customer" (
  "customer_id",
  "first_name",
  "last_name",
  "adsress",
  "billing_info"
)VALUES(
	1,
	'Benjamin',
	'Kadiayi',
	'2321 San Gabriel Dr',
	'4343-3434-5654-7887 678 98/56'
);

INSERT INTO "salesperson" (
  "salesperson_id",
  "first_name" ,
  "last_name" 
)VALUES(
	1,
	'Marcel',
	'Wilson'
);

INSERT INTO "car" (
  "car_id" ,
  "make" ,
  "model",
  "type",
  "year"
)VALUES(
	1,
	'Toyota',
	'Camry',
	'New',
	'2020'
);

INSERT INTO "invoice" (
  "invoice_id" ,
  "invoice_num" ,
  "salesperson_id" ,
  "customer_id",
  "car_id" 
) VALUES(
	1,
	20,
	1,
	1,
	1
);

INSERT INTO "service_records" (
  "service_id" ,
  "service_name" ,
  "customer_id" ,
  "car_id" 
)VALUES(
	1,
	'oil change',
	1,
	1
);

INSERT INTO "mechanic" (
  "mechanic_id" ,
  "first_name" ,
  "last_name" ,
  "service_id" 
)VALUES(
	1,
	'Luis',
	'Tim',
	1
);

INSERT INTO "inventory" (
  "inventory_id" ,
  "upc" ,
  "product_amount" 
)VALUES(
	1,
	123445784937,
	13
);

INSERT INTO "parts" (
  "parts_id" ,
  "part_name" ,
  "inventory_id" ,
  "mechanic_id"
	
)VALUES(
	1,
	'oil',
	1,
	1
);
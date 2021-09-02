CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "adsress" VARCHAR(100),
  "billing_info" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  PRIMARY KEY ("salesperson_id")
);


CREATE TABLE "car" (
  "car_id" SERIAL,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "type" VARCHAR(100),
  "year" NUMERIC(4),
  PRIMARY KEY ("car_id")
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "invoice_num" NUMERIC,
  "salesperson_id" INTEGER,
  "customer_id" INTEGER,
  "car_id" INTEGER,
  PRIMARY KEY ("invoice_id"),
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE "service_records" (
  "service_id" SERIAL,
  "service_date" DATE DEFAULT CURRENT_DATE,
  "service_name" VARCHAR(100),
  "customer_id" INTEGER,
  "car_id" INTEGER,
  PRIMARY KEY ("service_id"),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(car_id) REFERENCES car(car_id)
);


CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100),
  "service_id" INTEGER,
  PRIMARY KEY ("mechanic_id"),
  FOREIGN KEY(service_id) REFERENCES service_records(service_id)
);


CREATE TABLE "inventory" (
  "inventory_id" SERIAL,
  "upc" NUMERIC(12),
  "product_amount" INTEGER,
  PRIMARY KEY ("inventory_id")
);

CREATE TABLE "parts" (
  "parts_id" SERIAL,
  "part_name" VARCHAR(100),
  "inventory_id" INTEGER,
  "mechanic_id" INTEGER,
  PRIMARY KEY ("parts_id"),
  FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id),
  FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
	
);




CREATE TABLE IF NOT EXISTS "products" (
	"id" int8 PRIMARY KEY NOT NULL,
	"product_name" text NOT NULL,
	"product_desc" text NOT NULL,
	"img_url" text NOT NULL,
    "price" int8 NOT NULL
);
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yKKczj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS "CardHolder" CASCADE;
DROP TABLE IF EXISTS "CreditCard" CASCADE;
DROP TABLE IF EXISTS "Merchant" CASCADE;
DROP TABLE IF EXISTS "MerchantCategory" CASCADE;
DROP TABLE IF EXISTS "Transaction" CASCADE;

CREATE TABLE "CardHolder" (
    "id_card_holder" INT   NOT NULL,
    "Name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_CardHolder" PRIMARY KEY (
        "id_card_holder"
     )
);

CREATE TABLE "CreditCard" (
    
    "Card" VARCHAR(255)   NOT NULL,
	"id_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_CreditCard" PRIMARY KEY (
        "Card"
     )
);

CREATE TABLE "Merchant" (
    "id_merchant" INT   NOT NULL,
    "Merchant_name" VARCHAR(255)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "id_merchant"
     )
);

CREATE TABLE "MerchantCategory" (
    "id_merchant_category" INT   NOT NULL,
    "merchant_category" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_MerchantCategory" PRIMARY KEY (
        "id_merchant_category"
     )
);

CREATE TABLE "Transaction" (
    "transaction_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(255)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "CreditCard" ADD CONSTRAINT "fk_CreditCard_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "CardHolder" ("id_card_holder");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "MerchantCategory" ("id_merchant_category");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_card" FOREIGN KEY("card")
REFERENCES "CreditCard" ("Card");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "Merchant" ("id_merchant");

SELECT * FROM "CreditCard";
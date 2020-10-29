-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yKKczj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "CardHolder" (
    "id_card_holder" INT   NOT NULL,
    "Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_CardHolder" PRIMARY KEY (
        "id_card_holder"
     )
);

CREATE TABLE "CreditCard" (
    "id_card_holder" INT   NOT NULL,
    "Card" INT   NOT NULL,
    CONSTRAINT "pk_CreditCard" PRIMARY KEY (
        "Card"
     )
);

CREATE TABLE "Merchant" (
    "id_merchant" INT   NOT NULL,
    "Merchant_name" VARCHAR   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "id_merchant"
     )
);

CREATE TABLE "MerchantCategory" (
    "id_merchant_category" INT   NOT NULL,
    "merchant_category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_MerchantCategory" PRIMARY KEY (
        "id_merchant_category"
     )
);

CREATE TABLE "Transaction" (
    "transaction_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" INT   NOT NULL,
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

SELECT * FROM "CreditCard" LIMIT 20 ; 


SELECT 
	aa.id_card_holder,
	aa.name,
	bb.card,
	cc.amount,
	cc.id_merchant	
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card;


SELECT *
FROM "card_holder" aa
JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card;

SELECT *
FROM "transaction" ;

-- Select various columns to associate transactions with card holder
SELECT 
	aa.id_card_holder,
	aa.name,
	bb.card,
	cc.amount,
	cc.id_merchant,
	cc.date
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card;

--Extract data with transactions that are less than 2$
SELECT 
	bb.id_card_holder,
	bb.card,
	cc.amount,
	cc.id_merchant,
	cc.date
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card
WHERE cc.amount<=2;

-- Extract data and sort descending order by amount
SELECT 
	bb.id_card_holder,
	bb.card,
	cc.amount,
	cc.id_merchant,
	cc.date
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card
ORDER BY cc.amount DESC;

-- Count transactions <2.00 per cardholder
SELECT COUNT (bb.id_card_holder),
	aa.id_card_holder
	
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card
WHERE cc.amount<=2
GROUP BY aa.id_card_holder 
ORDER BY COUNT (bb.id_card_holder) DESC ;

-- Count transactions <2.00 per id_merchant
SELECT COUNT (cc.id_merchant),
	
	dd.id_merchant
FROM "card_holder" aa
LEFT JOIN "credit_card" bb ON aa.id_card_holder=bb.id_card_holder
JOIN "transaction" cc ON bb.card=cc.card
JOIN "merchant" dd ON cc.id_merchant=dd.id_merchant
WHERE cc.amount<=2
GROUP BY dd.id_merchant
ORDER BY COUNT (cc.id_merchant) DESC ;






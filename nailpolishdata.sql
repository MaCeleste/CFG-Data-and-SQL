---------------------------------------------------------------------------------------
-- Sample data
---------------------------------------------------------------------------------------
INSERT INTO brands
(bname, country)
VALUES
('A England', 'UK'),
('Barry M',	'UK'),
('Cadillacquer', 'Switzerland'),
('China Glaze',	'USA'),
('Colour Alike', 'Poland'),
('Essie', 'USA'),
('FUN Lacquer',	'Singapore'),
('Kinetics', 'Lithuania'),
('Masura', 'Russia'),
('OPI',	'USA'),
('Orly', 'USA'),
('Picture Polish', 'Australia'),
('Sally Hansen', 'USA'),
('Zoya', 'USA');

INSERT INTO collections
(cname, brand_id, year_released, season, line)
VALUES
('Tudoresque',1,2017,NULL,'Core'),
('Under the sea',2,2018,NULL,'Core'),
('Green origin',2,2019,NULL,'Core'),
('Summer Flowers',3,2021,'Summer','Core'),
('OMG Flashback',4,2018,NULL,'Core'),
('Fashion Fairy',4,2005,NULL,'Core'),
('Havanna Nights',4,2021,'Summer','Core'),
('La Collection de France',10,2008,'Autumn','Core'),
('Gwen Stefani',10,2014,'Holidays','Core'),
('South America',10,2002,'Spring','Core'),
('Iceland',10,2017,'Autumn','Core'),
('Complete Salon Manicure',13,NULL,NULL,'Complete Salon Manicure'),
('HD Hi-Definition',13,NULL,NULL,'HD Hi-Definition'),
('Xtreme Wear',13,NULL,NULL,'Xtreme Wear'),
('Hypnotic Trio',14,2022,'Holidays','Core'),
('Bridal x Reem Acra',6,2018,NULL,'Gel Couture'),
('Seaglass Shimmers',6,2018,'Summer','Core'),
('Bon boy-age',6,2018,'Spring','Core'),
('Ignite',14,2014,'Autumn','Core');

INSERT INTO nail_polish
(npname, brand_id, collection_id, main_colour, secondary_colour, topper, finish)
VALUES
('Anne Boleyn',1,1,'Red',NULL,FALSE,'Holographic'),
('Anne of Cleves',1,1,'Pink',NULL,FALSE,'Holographic'),
('Coral reef',2,2,'Pink',NULL,FALSE,'Shimmer'),
('Dragonfish',2,2,'Purple',NULL,FALSE,'Shimmer'),
('Evergreen',2,3,'Green',NULL,FALSE,'Cream'),
('Lilac orchid',2,3,'Lilac',NULL,FALSE,'Cream'),
('Pacific flame',2,2,'Red',NULL,FALSE,'Shimmer'),
('Seahorse',2,2,'Purple','Grey',FALSE,'Shimmer'),
('Gerbera Daisy',3,4,'Green','Red',FALSE,'Crelly'),
('2NITE',4,5,'Blue',NULL,FALSE,'Holographic'),
('BFF',4,5,'Pink',NULL,FALSE,'Holographic'),
('DV8',4,5,'Teal',NULL,FALSE,'Holographic'),
('IDK',4,5,'Purple',NULL,FALSE,'Holographic'),
('OMG',4,5,'Silver',NULL,FALSE,'Holographic'),
('TTYL',4,5,'Orange',NULL,FALSE,'Holographic'),
('Golden enchantment',4,6,'Gold',NULL,TRUE,'Holographic'),
('Cuba Diving',4,7,'Blue',NULL,FALSE,'Neon'),
('Guava mama',4,7,'Pink',NULL,FALSE,'Neon'),
('Tropic like it is hot',4,7,'Green',NULL,FALSE,'Neon'),
('Parlez-vous OPI?',10,8,'Lilac',NULL,FALSE,'Cream'),
('Comet In The Sky',10,9,'Black',NULL,TRUE,'Glitter'),
('Dulce De Leche',10,10,'Beige',NULL,FALSE,'Cream'),
('Aurora Berry-alis',10,11,'Pink',NULL,FALSE,'Cream'),
('Check Out The Old Geysirs',10,11,'Blue',NULL,FALSE,'Cream'),
('I will Have A Gin & Tectonic',10,11,'Beige',NULL,FALSE,'Cream'),
('Icelanded A Bottle Of Opi',10,11,'Green',NULL,FALSE,'Cream'),
('Copper Penny',13,12,'Bronze',NULL,TRUE,'Glitter'),
('DVD',13,13,'Blue','Purple',FALSE,'Shimmer'),
('Pacific Blue Original',13,14,'Blue',NULL,FALSE,'Cream'),
('Clarice',14,15,'Green',NULL,FALSE,'Metallic'),
('Metora',14,15,'Red','Burgundy',FALSE,'Metallic'),
('Rosalind',14,15,'Blue',NULL,FALSE,'Metallic'),
('Getting intricate',6,16,'Blue',NULL,FALSE,'Cream'),
('Coral coast',6,17,'Orange','Peach',FALSE,'Shimmer'),
('Dont be salty',6,17,'Pink',NULL,FALSE,'Shimmer'),
('Krona-logical order',10,11,'Brown',NULL,FALSE,'Cream'),
('Less is norse',10,11,'Purple',NULL,FALSE,'Cream'),
('One heckla of a color',10,11,'Pink',NULL,FALSE,'Cream'),
('Reykjavik has all the hot spots',10,11,'Pink',NULL,FALSE,'Shimmer'),
('Suzi and the arctic fox',10,11,'Blue',NULL,FALSE,'Cream'),
('That is what friends are for',10,11,'Brown',NULL,FALSE,'Cream'),
('This is not Greenland',10,11,'Green',NULL,FALSE,'Cream'),
('Turn on the northern lights',10,11,'Purple',NULL,FALSE,'Shimmer'),
('Anchor down',6,18,'Blue',NULL,FALSE,'Shimmer'),
('Bon boy-age',6,18,'Green',NULL,FALSE,'Shimmer'),
('Autumn',14,19,'Brown','Bronze',FALSE,'Shimmer'),
('India',14,19,'Red','Burgundy',FALSE,'Shimmer'),
('Remy',14,19,'Blue','Teal',FALSE,'Shimmer'),
('Sansa',14,19,'Purple',NULL,FALSE,'Shimmer'),
('Teigen',14,19,'Red','Cranberry',FALSE,'Shimmer'),
('Yuna',14,19,'Green','Olive',FALSE,'Shimmer');


INSERT INTO np_owned
(np_id, quantity_owned, date_of_purchase, worn, cost)
VALUES
(1,1,'2022-02-10',FALSE,7),
(3,1,'2022-02-10',FALSE,7),
(4,1,'2022-02-10',FALSE,6.5),
(5,1,'2022-06-16',FALSE,6.5),
(6,1,'2022-09-15',FALSE,3.99),
(7,1,'2022-09-15',FALSE,3.99),
(8,1,'2022-06-16',TRUE,3.99),
(9,1,'2022-06-16',FALSE,1),
(10,1,'2022-09-15',FALSE,1),
(11,1,'2022-09-15',FALSE,8.99),
(16,2,'2022-09-15',FALSE,12),
(17,1,'2022-10-02',FALSE,7),
(18,1,'2022-06-08',FALSE,7),
(19,1,'2022-06-08',FALSE,6),
(21,1,'2022-07-01',FALSE,5.5),
(22,2,'2022-10-11',FALSE,5.5),
(23,1,'2022-10-11',FALSE,5.5),
(24,1,'2022-12-30',TRUE,4.99),
(26,1,'2022-08-19',FALSE,4.99),
(27,1,'2022-08-19',FALSE,4.99),
(29,3,'2022-10-02',FALSE,3.59),
(30,1,'2022-12-30',TRUE,3.59),
(31,1,'2022-12-30',FALSE,7),
(32,1,'2022-12-30',FALSE,7),
(33,1,'2022-12-30',FALSE,7),
(35,1,'2022-12-30',FALSE,4.99),
(37,1,'2022-11-30',FALSE,4.99),
(38,1,'2022-11-30',FALSE,4.99),
(39,1,'2022-11-30',FALSE,4.99),
(40,1,'2022-08-12',FALSE,6.99),
(41,1,'2022-08-30',FALSE,5.99),
(42,1,'2022-07-30',FALSE,4.99),
(43,1,'2022-07-30',FALSE,4.99),
(44,1,'2022-04-12',FALSE,7),
(45,1,'2022-05-30',FALSE,9),
(47,1,'2022-03-30',FALSE,8.99),
(48,1,'2022-05-30',FALSE,9),
(50,1,'2022-02-19',FALSE,9);



INSERT INTO wishlist
(np_id, date_added)
VALUES
(20,'2022-12-30'),
(28,'2022-10-05'),
(2,'2022-05-15'),
(36,'2022-05-15'),
(46,'2022-11-15'),
(51,'2022-11-15');
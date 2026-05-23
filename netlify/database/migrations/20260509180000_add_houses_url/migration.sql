-- Add url column to houses
ALTER TABLE houses ADD COLUMN url text;

-- Clear existing guest and house data
DELETE FROM guests;
DELETE FROM houses;

-- Insert updated houses
INSERT INTO houses (id, name, emoji, address, capacity, note, url, color, sort_order) VALUES
(1, 'Black House', '🖤', '2104 NW Everett St, Portland, OR 97210', '8 Bedrooms · Sleeps 14', '7 queen beds · 3 baths · 2,802 sqft · Smart lock entry', 'https://www.stayportland.com/properties/massive-7br-nob-hill-nw-23rd-sleeps-14-67db17e0689acc00224aa6b8', '#333333', 1),
(2, 'White House', '🤍', '18 NW 22nd Pl, Portland, OR 97210', '7 Bedrooms · Sleeps 14', '7 queen beds · 3 baths · 2,802 sqft · Smart lock entry', 'https://www.stayportland.com/properties/massive-7br-nob-hill-nw-23rd-sleeps-14-67db17e0689acc00224aa6b8', '#9B8E7E', 2),
(3, 'Blue House', '💙', '529 NW 21st Ave, Portland, OR 97210', '3 Bedrooms · Sleeps 8', '4 beds · 2 baths · 1,600 sqft · Smart lock entry · 99 WalkScore', 'https://www.stayportland.com/properties/3br-sleeps-8-prime-nw-location-99-walkscore-67dad3ab945aed00112bb5aa', '#3B6FA0', 3);

SELECT setval('houses_id_seq', 3);

-- Insert guests
INSERT INTO guests (house_id, family_group, name) VALUES
-- Black House — Downstairs Suite
(1, 'Downstairs Suite (2 Bed)', 'Matt & Veronica'),
-- Black House — Upstairs
(1, 'Upstairs (6 Bed)', 'Kirstin & Cris'),
(1, 'Upstairs (6 Bed)', 'Carol'),
(1, 'Upstairs (6 Bed)', 'John'),
(1, 'Upstairs (6 Bed)', 'Diana & Louis'),
(1, 'Upstairs (6 Bed)', 'Isabel'),
-- White House — Downstairs Suite
(2, 'Downstairs Suite (3 Bed)', 'Malin & Mitch'),
(2, 'Downstairs Suite (3 Bed)', 'Ana & Avery'),
-- White House — Upstairs
(2, 'Upstairs (4 Bed)', 'Kendra & Max'),
(2, 'Upstairs (4 Bed)', 'Mimsey'),
(2, 'Upstairs (4 Bed)', 'Liske & Tim'),
(2, 'Upstairs (4 Bed)', 'Molly & Saran'),
-- Blue House
(3, 'Blue House', 'Clarks'),
(3, 'Blue House', 'Cath & Alice');

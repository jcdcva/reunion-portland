-- Update existing restaurants with cuisine tags and distances from Black House (2104 NW Everett St)
UPDATE places SET cuisine = 'Thai', distance = '4.5 mi from Black House' WHERE name = 'Pok Pok' AND category = 'restaurants';
UPDATE places SET cuisine = 'Wine Bar', distance = '2.0 mi from Black House' WHERE name = 'Canard' AND category = 'restaurants';
UPDATE places SET cuisine = 'Brunch', distance = '2.5 mi from Black House' WHERE name = 'Tasty n Daughters' AND category = 'restaurants';
UPDATE places SET cuisine = 'Italian', distance = '1.5 mi from Black House' WHERE name = 'Luce' AND category = 'restaurants';
UPDATE places SET cuisine = 'Korean', distance = '2.0 mi from Black House' WHERE name = 'Han Oak' AND category = 'restaurants';
UPDATE places SET cuisine = 'Southern', distance = '1.5 mi from Black House' WHERE name = 'Screen Door' AND category = 'restaurants';

-- Add restaurants within 1 mile of Black House (2104 NW Everett St, Portland, OR 97210)
INSERT INTO places (name, category, cuisine, address, note, guide_note, distance, url, sort_order) VALUES
('RingSide Steakhouse', 'restaurants', 'Steakhouse', '2165 W Burnside St', 'Portland''s legendary steakhouse since 1944 — famous for their onion rings and prime cuts', 'Reservations recommended for dinner', '0.1 mi from Black House', 'https://www.ringsidesteakhouse.com', 10),
('Grassa', 'restaurants', 'Italian', '1375 NW 22nd Ave', 'Handmade pasta at the counter — fast, fresh, and delicious. One of Portland''s best casual Italian spots', 'Counter service, no reservations needed', '0.3 mi from Black House', 'https://www.grassapdx.com', 11),
('Besaw''s', 'restaurants', 'American', '1545 NW 21st Ave', 'Portland institution since 1903 — excellent brunch, craft cocktails, and seasonal dinner menu', 'Great for groups — reservations for dinner', '0.4 mi from Black House', 'https://www.besaws.com', 12),
('Bamboo Sushi', 'restaurants', 'Japanese', '836 NW 23rd Ave', 'World''s first certified sustainable sushi restaurant — creative rolls and fresh nigiri', 'Reservations recommended on weekends', '0.4 mi from Black House', 'https://www.bamboosushi.com', 13),
('Escape From New York Pizza', 'restaurants', 'Pizza', '622 NW 23rd Ave', 'Portland''s beloved slice shop since 1986 — big, foldable New York–style slices', 'Cash and card accepted, grab-and-go', '0.3 mi from Black House', 'https://www.efnypizza.net', 14),
('Cha Cha Cha Taqueria', 'restaurants', 'Mexican', '505 NW 23rd Ave', 'Vibrant taqueria with great burritos, tacos, and margaritas — fun and colorful vibe', 'Quick, affordable, outdoor seating available', '0.3 mi from Black House', NULL, 15),
('Andina', 'restaurants', 'Peruvian', '1314 NW Glisan St', 'Upscale Peruvian cuisine — ceviches, tapas, and pisco sours in a beautiful Pearl District space', 'Reservations strongly recommended', '0.6 mi from Black House', 'https://www.andinarestaurant.com', 16),
('St. Honoré Boulangerie', 'restaurants', 'French', '2335 NW Thurman St', 'Authentic French bakery and café — croissants, croque monsieurs, and French onion soup', 'Open early for coffee and pastries', '0.6 mi from Black House', 'https://www.sainthonorepdx.com', 17);

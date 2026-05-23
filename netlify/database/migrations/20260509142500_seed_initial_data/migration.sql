-- Seed data from hardcoded HTML

-- Houses
INSERT INTO houses (id, name, emoji, address, capacity, note, wifi, door_code, color, sort_order) VALUES
(1, 'The Fernwood House', '🌲', '2847 NE Fernwood Ave, Portland, OR 97212', 'Sleeps 10', 'Main gathering house — big back porch, gas grill', 'FernwoodGuest', '4521', '#2D4A3E', 1),
(2, 'The Sellwood Cottage', '🏡', '1204 SE Tacoma St, Portland, OR 97202', 'Sleeps 6', 'Quiet neighborhood near the river — easy parking', 'SellwoodGuest', '7834', '#6B4A2A', 2),
(3, 'The Alberta House', '🌿', '3518 NE Alberta St, Portland, OR 97211', 'Sleeps 8', 'Walking distance to Alberta Arts District restaurants', 'AlbertaGuest', '2967', '#4A7C59', 3);

SELECT setval('houses_id_seq', 3);

-- Guests
INSERT INTO guests (house_id, family_group, name, role, arrival, departure) VALUES
-- Fernwood House
(1, 'Craig Family', 'Margaret & Tom Craig', 'Host Family', 'Here', 'Jul 20'),
(1, 'Craig Family', 'Sophie Craig', NULL, 'Jul 11', 'Jul 20'),
(1, 'Craig Family', 'Owen Craig', NULL, 'Jul 12', 'Jul 19'),
(1, 'Webb Family', 'Marcus & Joy Webb', 'Family Friends', 'Jul 13', 'Jul 18'),
-- Sellwood Cottage
(2, 'Hendricks Family', 'Ruth & James Hendricks', NULL, 'Jul 10', 'Jul 19'),
(2, 'Hendricks Family', 'Mia Hendricks', NULL, 'Jul 11', 'Jul 19'),
(2, 'Hendricks Family', 'Paul Hendricks', NULL, 'Jul 13', 'Jul 17'),
-- Alberta House
(3, 'Craig — Seattle Branch', 'David & Linda Craig', NULL, 'Jul 11', 'Jul 18'),
(3, 'Craig — Seattle Branch', 'Nora Craig', NULL, 'Jul 12', 'Jul 18'),
(3, 'Craig — Seattle Branch', 'Cal Craig', NULL, 'Jul 11', 'Jul 17'),
(3, 'Elena Vasquez', 'Elena Vasquez', 'Family Friend', 'Jul 12', 'Jul 16');

-- Schedule Events
INSERT INTO events (title, day, time, location, note) VALUES
('Arrivals & Settling In', 'Friday, July 11', '5:00 PM', 'All Houses', 'Grab groceries on the way — see store list'),
('First Night Dinner', 'Friday, July 11', '7:00 PM', 'Fernwood House', 'Casual — pizza and salads. No pressure.'),
('Morning Coffee Walk', 'Saturday, July 12', '9:00 AM', 'Alberta Arts District', 'Meet at the Alberta House porch'),
('Powell''s Books Outing', 'Saturday, July 12', '12:00 PM', 'Powell''s City of Books', 'Everyone finds their own section — meet at the Orange Room at 2pm'),
('Big Family Dinner', 'Saturday, July 12', '6:00 PM', 'Fernwood House', 'Potluck — bring a dish from your city'),
('Forest Park Hike (optional)', 'Sunday, July 13', '8:00 AM', 'Wildwood Trail', 'Easy 4-mile loop — all paces welcome'),
('Waterfront Afternoon', 'Sunday, July 13', '2:00 PM', 'Tom McCall Waterfront Park', 'Bring blankets and lawn games'),
('Farewell Gathering', 'Sunday, July 13', '7:00 PM', 'Fernwood House', 'Light food, stories, and a toast'),
('Departures', 'Monday, July 14', 'All Day', NULL, 'Safe travels, everyone. See you next year.');

-- Places: Restaurants
INSERT INTO places (name, category, address, note, guide_note, url, sort_order) VALUES
('Pok Pok', 'restaurants', '3226 SE Division St', 'Famous Thai street food — the fish sauce wings are legendary', 'Cash-friendly, expect a wait on weekends', 'https://pokpokpdx.com', 1),
('Canard', 'restaurants', '734 E Burnside St', 'Natural wine bar with inventive small plates — fun and lively', 'Walk-ins welcome, seats fill fast', 'https://canardpdx.com', 2),
('Tasty n Daughters', 'restaurants', '3535 NE 15th Ave', 'One of Portland''s best brunch spots — creative, hearty dishes', 'Arrive early — lines start before opening', 'https://tastyndaughters.com', 3),
('Luce', 'restaurants', '2140 E Burnside St', 'Warm Italian trattoria — handmade pasta, great wine list', NULL, 'https://lucepdx.com', 4),
('Han Oak', 'restaurants', '511 NE 24th Ave', 'Korean home cooking — exceptional dumplings and cold noodles', NULL, 'https://hanoakpdx.com', 5),
('Screen Door', 'restaurants', '2337 E Burnside St', 'Southern comfort food — chicken and waffles worth every calorie', 'Great for big groups — call ahead', 'https://screendoorrestaurant.com', 6);

-- Places: Hiking
INSERT INTO places (name, category, note, difficulty, length, url, sort_order) VALUES
('Wildwood Trail', 'hiking', 'Portland''s crown jewel — 30 miles of forested trail, multiple entry points', 'Easy', '4–8 mi (your choice)', 'https://www.portland.gov/parks/forest-park', 1),
('Pittock Mansion Loop', 'hiking', 'Hike up through Forest Park to a historic mansion with city and Mt. Hood views', 'Moderate', '3.8 mi', 'https://pittockmansion.org', 2),
('Powell Butte Nature Park', 'hiking', 'Open meadows, 360° views — great for kids and all paces', 'Easy', '3 mi loop', 'https://www.portland.gov/parks/powell-butte-nature-park', 3),
('Multnomah Falls Trail', 'hiking', 'Oregon''s most iconic waterfall — steep but short, stunning payoff', 'Hard', '2.4 mi · 30 min drive', 'https://www.fs.usda.gov/recarea/crgnsa/recarea/?recid=30026', 4),
('Tryon Creek State Park', 'hiking', 'Lush canyon forest in the middle of the city — peaceful and less crowded', 'Moderate', '3–6 mi of trails', 'https://stateparks.oregon.gov/index.cfm?do=park.profile&parkId=103', 5),
('Columbia Slough Trail', 'hiking', 'Flat riverside trail great for birding — calm and uncrowded', 'Easy', 'Flat, varies', 'https://www.portland.gov/parks/columbia-slough-trail', 6);

-- Places: Activities
INSERT INTO places (name, category, address, note, guide_note, url, sort_order) VALUES
('Powell''s City of Books', 'activities', '1005 W Burnside St, Pearl District', 'The world''s largest independent bookstore — entire city blocks of books', 'Budget 2+ hours. It''s genuinely enormous.', 'https://www.powells.com', 1),
('Portland Japanese Garden', 'activities', '611 SW Kingston Ave, Washington Park', 'Called one of the most authentic Japanese gardens outside Japan — breathtaking', 'Buy tickets online to skip the line', 'https://japanesegarden.org', 2),
('OMSI — Oregon Museum of Science', 'activities', '1945 SE Water Ave, East Side', 'Hands-on science museum with submarine tours — great for all ages', NULL, 'https://omsi.edu', 3),
('Portland Saturday Market', 'activities', '2 SW Naito Pkwy, Old Town', 'Largest continuously operating outdoor arts market in the US — runs Sat & Sun', NULL, 'https://www.portlandsaturdaymarket.com', 4),
('Lan Su Chinese Garden', 'activities', '239 NW Everett St, Old Town', 'Stunning Ming Dynasty–style garden with a teahouse in the middle of the city', NULL, 'https://lansugarden.org', 5),
('International Rose Test Garden', 'activities', '400 SW Kingston Ave, Washington Park', 'Free admission — 10,000 rose plants and views of Mt. Hood on clear days', NULL, 'https://www.portland.gov/parks/international-rose-test-garden', 6);

-- Places: Groceries
INSERT INTO places (name, category, address, note, guide_note, url, sort_order) VALUES
('New Seasons Market', 'groceries', 'Multiple Portland locations', 'Portland''s beloved local grocer — excellent deli, prepared foods, and local produce', 'Best all-around choice', 'https://www.newseasonsmarket.com', 1),
('Fred Meyer (Hawthorne)', 'groceries', 'SE Hawthorne Blvd, Near Sellwood', 'Large full-service store — groceries, pharmacy, household goods, all in one', NULL, 'https://www.fredmeyer.com', 2),
('Trader Joe''s (NE Broadway)', 'groceries', '2122 NE Broadway, Near Fernwood', 'Closest store to Fernwood House — great for snacks, wine, and quick meals', NULL, 'https://www.traderjoes.com', 3),
('Whole Foods (Lloyd District)', 'groceries', '1210 NE Weidler St, Near Alberta House', 'Closest to Alberta House — good hot bar and prepared foods for easy nights', NULL, 'https://www.wholefoodsmarket.com', 4),
('Zupan''s Markets', 'groceries', 'Multiple locations', 'Upscale neighborhood market — outstanding deli, cheese counter, and wine selection', NULL, 'https://www.zupans.com', 5),
('Portland Farmers Market', 'groceries', 'Portland State University, Saturdays', 'Oregon''s premier farmers market — fresh produce, baked goods, and flowers', 'Saturdays 8:30am–2pm through October', 'https://www.portlandfarmersmarket.org', 6);

-- Tips Categories
INSERT INTO tips_categories (id, name, sort_order) VALUES
(1, 'Getting from PDX Airport', 1),
(2, 'Good to Know', 2);

SELECT setval('tips_categories_id_seq', 2);

-- Tips Items
INSERT INTO tips_items (category_id, text, sort_order) VALUES
(1, 'MAX Red Line — cheapest option, ~$2.50, drops you at city center in 40 min', 1),
(1, 'Uber/Lyft — typically $35–55 to most houses depending on traffic', 2),
(1, 'TriMet Bus — multiple routes, very affordable, takes longer', 3),
(1, 'PDX Taxi — available curbside, metered, usually $45–65', 4),
(2, 'July weather is reliably sunny — highs in the low 80s, cool evenings', 1),
(2, 'Tap water is excellent — Portland''s water comes from Mt. Hood', 2),
(2, 'Very dog-friendly city — most parks and many patios welcome dogs', 3);

-- Fix day-of-week labels to match actual July 2026 calendar
UPDATE events SET day = 'Saturday, July 11' WHERE day = 'Friday, July 11';
UPDATE events SET day = 'Sunday, July 12' WHERE day = 'Saturday, July 12';
UPDATE events SET day = 'Monday, July 13' WHERE day = 'Sunday, July 13';
UPDATE events SET day = 'Tuesday, July 14' WHERE day = 'Monday, July 14';
UPDATE events SET day = 'Wednesday, July 15' WHERE day = 'Tuesday, July 15';
UPDATE events SET day = 'Thursday, July 16' WHERE day = 'Wednesday, July 16';
UPDATE events SET day = 'Friday, July 17' WHERE day = 'Thursday, July 17';
UPDATE events SET day = 'Saturday, July 18' WHERE day = 'Friday, July 18';

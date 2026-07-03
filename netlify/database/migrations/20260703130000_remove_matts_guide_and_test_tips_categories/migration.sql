-- Remove the "Matt's Portland Guide" tips category (seeded by
-- 20260703120000_add_matts_portland_guide_tips) together with the three
-- throwaway test categories that were created through the UI. The associated
-- tips_items rows are deleted automatically via the ON DELETE CASCADE foreign
-- key on tips_items.category_id.
--
-- Roll-forward only — the earlier migration is left untouched. Matching by name
-- (rather than id) keeps this safe across environments where the serial ids differ.
DELETE FROM tips_categories
WHERE name IN ('Matt''s Portland Guide', 'Test Category', 'TestCat', 'test-category');

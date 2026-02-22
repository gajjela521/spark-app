INSERT INTO questions (type, category, body, is_approved, usage_count)
SELECT 
    CASE WHEN i % 2 = 0 THEN 'truth' ELSE 'dare' END as type,
    CASE WHEN i % 4 = 0 THEN 'lite' WHEN i % 4 = 1 THEN 'medium' WHEN i % 4 = 2 THEN 'spicy' ELSE 'creative' END as category,
    'Question number ' || i || ' for Truth or Dare' as body,
    true,
    0
FROM generate_series(1, 200) as i;

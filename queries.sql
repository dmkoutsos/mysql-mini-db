-- Sample data
INSERT INTO users (email, name) VALUES
('alice@example.com','Alice'),
('bob@example.com','Bob');

INSERT INTO tickets (user_id, subject, status)
VALUES (1,'Password reset','open'), (2,'Payment verification','pending');

-- Examples
SELECT t.id, u.email, t.subject, t.status
FROM tickets t
JOIN users u ON u.id = t.user_id
WHERE t.status <> 'closed'
ORDER BY t.created_at DESC;

UPDATE tickets SET status='closed', updated_at=NOW() WHERE id=1;

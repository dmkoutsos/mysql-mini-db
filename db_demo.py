# Basic Python MySQL demo (read-only)
# pip install mysql-connector-python
import mysql.connector as mysql

conn = mysql.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="minihelpdesk"
)
cur = conn.cursor()
cur.execute("""
SELECT t.id, u.email, t.subject, t.status
FROM tickets t
JOIN users u ON u.id = t.user_id
ORDER BY t.created_at DESC
LIMIT 5
""")
for row in cur.fetchall():
    print(row)
cur.close()
conn.close()

SELECT 
    CONCAT('ALTER TABLE ',
            TABLE_SCHEMA,
            '.',
            TABLE_NAME,
            ' DROP FOREIGN KEY ',
            CONSTRAINT_NAME,
            ';')
FROM
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE
    CONSTRAINT_TYPE = 'FOREIGN KEY'
        AND TABLE_SCHEMA = 'live_events'
UNION SELECT 
    CONCAT('TRUNCATE TABLE ',
            TABLE_SCHEMA,
            '.',
            TABLE_NAME,
            ';')
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'live_events'
        AND TABLE_TYPE = 'BASE TABLE' 
UNION SELECT 
    CONCAT('OPTIMIZE TABLE ',
            TABLE_SCHEMA,
            '.',
            TABLE_NAME,
            ';')
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'live_events'
        AND TABLE_TYPE = 'BASE TABLE' 
UNION SELECT 
    CONCAT('ALTER TABLE ',
            TABLE_SCHEMA,
            '.',
            TABLE_NAME,
            ' ADD CONSTRAINT ',
            CONSTRAINT_NAME,
            ' FOREIGN KEY(',
            COLUMN_NAME,
            ')',
            ' REFERENCES ',
            REFERENCED_TABLE_NAME,
            '(',
            REFERENCED_COLUMN_NAME,
            ');')
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    CONSTRAINT_NAME LIKE 'FK%'
        AND TABLE_SCHEMA = 'live_events';
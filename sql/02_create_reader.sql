-- Run once as root. The pipeline gets read-only access to the OLTP schema:
-- a bug or a typo in the extract script can then never change your source data.
CREATE USER 'dwh_reader'@'localhost' IDENTIFIED BY 'choose-a-password';
GRANT SELECT ON drogeriemarkt.* TO 'dwh_reader'@'localhost';

-- Check:
SHOW GRANTS FOR 'dwh_reader'@'localhost';
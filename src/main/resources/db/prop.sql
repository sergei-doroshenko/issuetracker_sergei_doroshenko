SELECT PRIORITIES.ID AS id,
PRIORITIES.PR_NAME AS name
FROM PRIORITIES;

SELECT STATUSES.ID AS status_id,
STATUSES.ST_NAME AS status_name
FROM STATUSES;

SELECT TYPES.ID AS id,
TYPES.TP_NAME AS name
FROM TYPES
WHERE TYPES.ID =1;

SELECT RESOLUTIONS.ID AS id,
RESOLUTIONS.RES_NAME AS name
FROM RESOLUTIONS;

SELECT ROLES.ID AS id,
ROLES.RL_NAME AS name
FROM ROLES;
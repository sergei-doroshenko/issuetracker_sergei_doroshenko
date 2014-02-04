/*********************** SELECTS ISSUES LIST *************************************/
SELECT ISSUES.ID AS issue_id, ISSUES.CREATE_DATE AS create_date, 
ISSUES.CREATE_BY AS create_by_id, 
(SELECT USERS.FIRST_NAME FROM USERS where USERS.ID = ISSUES.CREATE_BY) AS create_by_first_name,
(SELECT USERS.LAST_NAME FROM USERS where USERS.ID = ISSUES.CREATE_BY) AS create_by_last_name,
ISSUES.MODIFY_DATE AS modity_date, 
ISSUES.MODIFIED_BY AS modify_by,
(SELECT USERS.FIRST_NAME FROM USERS where USERS.ID = ISSUES.MODIFIED_BY) AS modify_by_first_name,
(SELECT USERS.LAST_NAME FROM USERS where USERS.ID = ISSUES.MODIFIED_BY) AS modify_by_last_name,
ISSUES.TYPE_ID AS type_id, TYPES.TP_NAME AS type_name,
ISSUES.PRIORITY_ID AS priority_id, PRIORITIES.PR_NAME AS priority_name,
ISSUES.STATUS_ID AS status_id, STATUSES.ST_NAME AS status_name,
ISSUES.RESOLUTION_ID AS resolution_id, RESOLUTIONS.RES_NAME AS resolution_name,
ISSUES.BUILD_ID AS build_id, BUILDS.BL_NAME AS build_name, 
BUILDS.PROJECT_ID AS project_id, PROJECTS.PROJECT_NAME AS project_name,
ISSUES.ASSIGNEE_ID AS assignee_id, USERS.FIRST_NAME AS assignee_first_name,
USERS.LAST_NAME AS assignee_last_name,
ISSUES.SUMMARY AS summary, ISSUES.DESCRIPTION AS description
FROM ISSUES
LEFT JOIN TYPES ON ISSUES.TYPE_ID = TYPES.ID 
LEFT JOIN PRIORITIES ON ISSUES.PRIORITY_ID = PRIORITIES.ID
LEFT JOIN STATUSES ON STATUSES.ID = ISSUES.STATUS_ID
LEFT JOIN RESOLUTIONS ON ISSUES.RESOLUTION_ID = RESOLUTIONS.ID
LEFT JOIN BUILDS ON ISSUES.BUILD_ID = BUILDS.ID
LEFT JOIN PROJECTS ON BUILDS.PROJECT_ID = PROJECTS.ID
LEFT JOIN USERS ON ISSUES.ASSIGNEE_ID = USERS.ID
WHERE ISSUES.ASSIGNEE_ID = 4;

/*********************** SELECT SINGLE ISSUE **************************************/
SELECT ISSUES.ID AS issue_id, ISSUES.CREATE_DATE AS create_date, 
ISSUES.CREATE_BY AS create_by_id, 
(SELECT USERS.FIRST_NAME FROM USERS where USERS.ID = ISSUES.CREATE_BY) AS create_by_first_name,
(SELECT USERS.LAST_NAME FROM USERS where USERS.ID = ISSUES.CREATE_BY) AS create_by_last_name,
ISSUES.MODIFY_DATE AS modity_date, 
ISSUES.MODIFIED_BY AS modify_by,
(SELECT USERS.FIRST_NAME FROM USERS where USERS.ID = ISSUES.MODIFIED_BY) AS modify_by_first_name,
(SELECT USERS.LAST_NAME FROM USERS where USERS.ID = ISSUES.MODIFIED_BY) AS modify_by_last_name,
ISSUES.TYPE_ID AS type_id, TYPES.TP_NAME AS type_name,
ISSUES.PRIORITY_ID AS priority_id, PRIORITIES.PR_NAME AS priority_name,
ISSUES.STATUS_ID AS status_id, STATUSES.ST_NAME AS status_name,
ISSUES.RESOLUTION_ID AS resolution_id, RESOLUTIONS.RES_NAME AS resolution_name,
ISSUES.BUILD_ID AS build_id, BUILDS.BL_NAME AS build_name, 
BUILDS.PROJECT_ID AS project_id, PROJECTS.PROJECT_NAME AS project_name,
ISSUES.ASSIGNEE_ID AS assignee_id, USERS.FIRST_NAME AS assignee_first_name,
USERS.LAST_NAME AS assignee_last_name,
ISSUES.SUMMARY AS summary, ISSUES.DESCRIPTION AS description
FROM ISSUES
LEFT JOIN TYPES ON ISSUES.TYPE_ID = TYPES.ID 
LEFT JOIN PRIORITIES ON ISSUES.PRIORITY_ID = PRIORITIES.ID
LEFT JOIN STATUSES ON STATUSES.ID = ISSUES.STATUS_ID
LEFT JOIN RESOLUTIONS ON ISSUES.RESOLUTION_ID = RESOLUTIONS.ID
LEFT JOIN BUILDS ON ISSUES.BUILD_ID = BUILDS.ID
LEFT JOIN PROJECTS ON BUILDS.PROJECT_ID = PROJECTS.ID
LEFT JOIN USERS ON ISSUES.ASSIGNEE_ID = USERS.ID
WHERE ISSUES.ID = 3;
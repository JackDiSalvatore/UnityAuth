TRUNCATE TABLE user;
TRUNCATE TABLE tenant;
TRUNCATE TABLE service;
TRUNCATE TABLE tenant_service;
TRUNCATE TABLE permission;
TRUNCATE TABLE role;
TRUNCATE TABLE role_permission;
TRUNCATE TABLE user_role;
INSERT INTO user (id, email, password, status) VALUES(1, 'wilsonj@unityfoundation.io', '1234', 'ENABLED');
INSERT INTO user (id, email, password, status) VALUES(2, 'test@unityfoundation.io', '1234', 'ENABLED');
INSERT INTO tenant (id, name, status) VALUES(1, 'SYSTEM', 'ACTIVE');
INSERT INTO tenant (id, name, status) VALUES(2, 'Acme Corporation', 'ACTIVE');
INSERT INTO service (id, name, description, status) VALUES(1, 'Libre311', 'Libre311', 'ENABLED');
INSERT INTO service (id, name, description, status) VALUES(2, 'Application2', 'Application2', 'ENABLED');
INSERT INTO tenant_service (tenant_id, service_id, status) VALUES(2, 1, 'ENABLED');
INSERT INTO permission (id, name, description, scope) VALUES(1, 'AUTH_SERVICE_EDIT-SYSTEM', 'Description', 'SYSTEM');
INSERT INTO permission (id, name, description, scope) VALUES(2, 'LIBRE311_REQUEST_EDIT-TENANT', 'Description', 'TENANT');
INSERT INTO permission (id, name, description, scope) VALUES(3, 'LIBRE311_REQUEST_EDIT-SUBTENANT', 'Description', 'SUBTENANT');
INSERT INTO role (id, name, description) VALUES(1, 'System role', 'System role');
INSERT INTO role (id, name, description) VALUES(2, 'Tenant role', 'Tenant role');
INSERT INTO role (id, name, description) VALUES(3, 'Subtenant role', 'Subtenant role');
INSERT INTO role_permission (role_id, permission_id) VALUES(1, 1);
INSERT INTO role_permission (role_id, permission_id) VALUES(2, 2);
INSERT INTO role_permission (role_id, permission_id) VALUES(3, 3);
INSERT INTO user_role (tenant_id, user_id, role_id) VALUES(1, 1, 1);
INSERT INTO user_role (tenant_id, user_id, role_id) VALUES(2, 1, 2);
INSERT INTO user_role (tenant_id, user_id, role_id) VALUES(2, 1, 3);

-- ================================================
-- SEED DATA (3x)
-- ================================================

-- 1. CLINICS
INSERT INTO clinics (id, name, code, timezone) VALUES
('C-001', 'Sunrise Medical Clinic',       'SUNRISE',    'America/New_York'),
('C-002', 'Westside Family Health',       'WESTSIDE',   'America/Los_Angeles'),
('C-003', 'Downtown Wellness Center',     'DOWNTOWN',   'America/Chicago'),
('C-004', 'Northgate Health Hub',         'NORTHGATE',  'America/Denver'),
('C-005', 'Riverside Urgent Care',        'RIVERSIDE',  'America/Phoenix'),
('C-006', 'Lakeside Pediatric Clinic',    'LAKESIDE',   'America/Detroit'),
('C-007', 'Greenfield Family Practice',   'GREENFIELD', 'America/New_York'),
('C-008', 'Harbor View Medical Center',   'HARBOR',     'America/Los_Angeles'),
('C-009', 'Pinecrest Wellness Clinic',    'PINECREST',  'America/Chicago');

-- 2. CLINIC_CONFIG
INSERT INTO clinic_config (id, clinic_id, opening_hours, slot_duration_minutes, allow_overbooking, appointment_rules) VALUES
('CC-001', 'C-001',
 '{"monday":{"open":"08:00","close":"18:00"},"tuesday":{"open":"08:00","close":"18:00"},"wednesday":{"open":"08:00","close":"18:00"},"thursday":{"open":"08:00","close":"18:00"},"friday":{"open":"08:00","close":"16:00"},"saturday":{"open":"09:00","close":"13:00"},"sunday":null}',
 30, false, '{"max_advance_days":60,"min_notice_hours":2,"cancellation_policy_hours":24}'),

('CC-002', 'C-002',
 '{"monday":{"open":"09:00","close":"17:00"},"tuesday":{"open":"09:00","close":"17:00"},"wednesday":{"open":"09:00","close":"17:00"},"thursday":{"open":"09:00","close":"17:00"},"friday":{"open":"09:00","close":"15:00"},"saturday":null,"sunday":null}',
 20, true, '{"max_advance_days":30,"min_notice_hours":1,"cancellation_policy_hours":12}'),

('CC-003', 'C-003',
 '{"monday":{"open":"07:00","close":"20:00"},"tuesday":{"open":"07:00","close":"20:00"},"wednesday":{"open":"07:00","close":"20:00"},"thursday":{"open":"07:00","close":"20:00"},"friday":{"open":"07:00","close":"20:00"},"saturday":{"open":"08:00","close":"16:00"},"sunday":{"open":"10:00","close":"14:00"}}',
 15, false, '{"max_advance_days":90,"min_notice_hours":4,"cancellation_policy_hours":48}'),

('CC-004', 'C-004',
 '{"monday":{"open":"08:00","close":"17:00"},"tuesday":{"open":"08:00","close":"17:00"},"wednesday":{"open":"08:00","close":"17:00"},"thursday":{"open":"08:00","close":"17:00"},"friday":{"open":"08:00","close":"16:00"},"saturday":{"open":"09:00","close":"12:00"},"sunday":null}',
 30, false, '{"max_advance_days":45,"min_notice_hours":3,"cancellation_policy_hours":24}'),

('CC-005', 'C-005',
 '{"monday":{"open":"07:00","close":"22:00"},"tuesday":{"open":"07:00","close":"22:00"},"wednesday":{"open":"07:00","close":"22:00"},"thursday":{"open":"07:00","close":"22:00"},"friday":{"open":"07:00","close":"22:00"},"saturday":{"open":"08:00","close":"20:00"},"sunday":{"open":"09:00","close":"18:00"}}',
 20, true, '{"max_advance_days":14,"min_notice_hours":1,"cancellation_policy_hours":6}'),

('CC-006', 'C-006',
 '{"monday":{"open":"08:00","close":"17:00"},"tuesday":{"open":"08:00","close":"17:00"},"wednesday":{"open":"08:00","close":"17:00"},"thursday":{"open":"08:00","close":"17:00"},"friday":{"open":"08:00","close":"16:00"},"saturday":{"open":"09:00","close":"13:00"},"sunday":null}',
 30, false, '{"max_advance_days":60,"min_notice_hours":2,"cancellation_policy_hours":24}'),

('CC-007', 'C-007',
 '{"monday":{"open":"09:00","close":"18:00"},"tuesday":{"open":"09:00","close":"18:00"},"wednesday":{"open":"09:00","close":"18:00"},"thursday":{"open":"09:00","close":"18:00"},"friday":{"open":"09:00","close":"17:00"},"saturday":null,"sunday":null}',
 30, false, '{"max_advance_days":60,"min_notice_hours":2,"cancellation_policy_hours":24}'),

('CC-008', 'C-008',
 '{"monday":{"open":"08:00","close":"19:00"},"tuesday":{"open":"08:00","close":"19:00"},"wednesday":{"open":"08:00","close":"19:00"},"thursday":{"open":"08:00","close":"19:00"},"friday":{"open":"08:00","close":"17:00"},"saturday":{"open":"09:00","close":"14:00"},"sunday":null}',
 25, true, '{"max_advance_days":30,"min_notice_hours":2,"cancellation_policy_hours":12}'),

('CC-009', 'C-009',
 '{"monday":{"open":"07:00","close":"19:00"},"tuesday":{"open":"07:00","close":"19:00"},"wednesday":{"open":"07:00","close":"19:00"},"thursday":{"open":"07:00","close":"19:00"},"friday":{"open":"07:00","close":"17:00"},"saturday":{"open":"08:00","close":"14:00"},"sunday":null}',
 20, false, '{"max_advance_days":75,"min_notice_hours":3,"cancellation_policy_hours":36}');

-- 3. DOCTORS
INSERT INTO doctors (id, clinic_id, email, first_name, last_name, phone, status) VALUES
-- C-001
('D-001', 'C-001', 'james.hartwell@sunrise.com',      'James',    'Hartwell',   '+12125550101', 'active'),
('D-002', 'C-001', 'linda.morgan@sunrise.com',        'Linda',    'Morgan',     '+12125550102', 'active'),
('D-003', 'C-001', 'robert.chen@sunrise.com',         'Robert',   'Chen',       '+12125550103', 'inactive'),
-- C-002
('D-004', 'C-002', 'sarah.patel@westside.com',        'Sarah',    'Patel',      '+13105550201', 'active'),
('D-005', 'C-002', 'michael.nguyen@westside.com',     'Michael',  'Nguyen',     '+13105550202', 'active'),
-- C-003
('D-006', 'C-003', 'emily.brooks@downtown.com',       'Emily',    'Brooks',     '+13125550301', 'active'),
('D-007', 'C-003', 'carlos.rivera@downtown.com',      'Carlos',   'Rivera',     '+13125550302', 'active'),
-- C-004
('D-008', 'C-004', 'anna.walsh@northgate.com',        'Anna',     'Walsh',      '+17205550401', 'active'),
('D-009', 'C-004', 'peter.kim@northgate.com',         'Peter',    'Kim',        '+17205550402', 'active'),
('D-010', 'C-004', 'diane.foster@northgate.com',      'Diane',    'Foster',     '+17205550403', 'inactive'),
-- C-005
('D-011', 'C-005', 'marcus.bell@riverside.com',       'Marcus',   'Bell',       '+16025550501', 'active'),
('D-012', 'C-005', 'yuki.tanaka@riverside.com',       'Yuki',     'Tanaka',     '+16025550502', 'active'),
-- C-006
('D-013', 'C-006', 'priya.sharma@lakeside.com',       'Priya',    'Sharma',     '+13135550601', 'active'),
('D-014', 'C-006', 'tom.anderson@lakeside.com',       'Tom',      'Anderson',   '+13135550602', 'active'),
('D-015', 'C-006', 'nadia.kozlov@lakeside.com',       'Nadia',    'Kozlov',     '+13135550603', 'active'),
-- C-007
('D-016', 'C-007', 'ben.osei@greenfield.com',         'Ben',      'Osei',       '+12015550701', 'active'),
('D-017', 'C-007', 'claire.martin@greenfield.com',    'Claire',   'Martin',     '+12015550702', 'active'),
-- C-008
('D-018', 'C-008', 'david.lee@harbor.com',            'David',    'Lee',        '+13105550801', 'active'),
('D-019', 'C-008', 'fatima.hassan@harbor.com',        'Fatima',   'Hassan',     '+13105550802', 'active'),
('D-020', 'C-008', 'george.bell@harbor.com',          'George',   'Bell',       '+13105550803', 'inactive'),
-- C-009
('D-021', 'C-009', 'hana.white@pinecrest.com',        'Hana',     'White',      '+13125550901', 'active'),
('D-022', 'C-009', 'ivan.petrov@pinecrest.com',       'Ivan',     'Petrov',     '+13125550902', 'active');

-- 4. DOCTOR_CONFIG
INSERT INTO doctor_config (id, clinic_id, doctor_id, working_hours, default_timezone, slot_duration_minutes, allowed_appointment_types, notification_preferences) VALUES
('DC-001', 'C-001', 'D-001',
 '{"monday":{"start":"08:00","end":"17:00"},"tuesday":{"start":"08:00","end":"17:00"},"wednesday":{"start":"08:00","end":"17:00"},"thursday":{"start":"08:00","end":"17:00"},"friday":{"start":"08:00","end":"14:00"}}',
 'America/New_York', 30, ARRAY['general_checkup','follow_up','consultation'],
 '{"email":true,"sms":false,"push":true}'),

('DC-002', 'C-001', 'D-002',
 '{"monday":{"start":"10:00","end":"18:00"},"tuesday":{"start":"10:00","end":"18:00"},"wednesday":{"start":"10:00","end":"18:00"},"thursday":{"start":"10:00","end":"18:00"},"saturday":{"start":"09:00","end":"13:00"}}',
 'America/New_York', 30, ARRAY['general_checkup','pediatrics','vaccination'],
 '{"email":true,"sms":true,"push":false}'),

('DC-003', 'C-001', 'D-003',
 '{"monday":{"start":"09:00","end":"17:00"},"wednesday":{"start":"09:00","end":"17:00"},"friday":{"start":"09:00","end":"17:00"}}',
 'America/New_York', 30, ARRAY['consultation','follow_up'],
 '{"email":true,"sms":false,"push":false}'),

('DC-004', 'C-002', 'D-004',
 '{"monday":{"start":"09:00","end":"17:00"},"tuesday":{"start":"09:00","end":"17:00"},"wednesday":{"start":"09:00","end":"17:00"},"thursday":{"start":"09:00","end":"17:00"},"friday":{"start":"09:00","end":"15:00"}}',
 'America/Los_Angeles', 20, ARRAY['general_checkup','consultation','urgent_care'],
 '{"email":true,"sms":true,"push":true}'),

('DC-005', 'C-002', 'D-005',
 '{"tuesday":{"start":"09:00","end":"17:00"},"wednesday":{"start":"09:00","end":"17:00"},"thursday":{"start":"09:00","end":"17:00"},"friday":{"start":"09:00","end":"15:00"}}',
 'America/Los_Angeles', 20, ARRAY['dermatology','follow_up','consultation'],
 '{"email":false,"sms":true,"push":true}'),

('DC-006', 'C-003', 'D-006',
 '{"monday":{"start":"07:00","end":"15:00"},"tuesday":{"start":"07:00","end":"15:00"},"wednesday":{"start":"07:00","end":"15:00"},"thursday":{"start":"07:00","end":"15:00"},"friday":{"start":"07:00","end":"15:00"}}',
 'America/Chicago', 15, ARRAY['general_checkup','vaccination','follow_up','urgent_care'],
 '{"email":true,"sms":true,"push":false}'),

('DC-007', 'C-003', 'D-007',
 '{"monday":{"start":"12:00","end":"20:00"},"tuesday":{"start":"12:00","end":"20:00"},"wednesday":{"start":"12:00","end":"20:00"},"thursday":{"start":"12:00","end":"20:00"},"saturday":{"start":"08:00","end":"16:00"},"sunday":{"start":"10:00","end":"14:00"}}',
 'America/Chicago', 15, ARRAY['consultation','follow_up','mental_health'],
 '{"email":true,"sms":false,"push":true}'),

('DC-008', 'C-004', 'D-008',
 '{"monday":{"start":"08:00","end":"17:00"},"tuesday":{"start":"08:00","end":"17:00"},"wednesday":{"start":"08:00","end":"17:00"},"thursday":{"start":"08:00","end":"17:00"},"friday":{"start":"08:00","end":"16:00"}}',
 'America/Denver', 30, ARRAY['general_checkup','consultation','follow_up'],
 '{"email":true,"sms":true,"push":false}'),

('DC-009', 'C-004', 'D-009',
 '{"monday":{"start":"09:00","end":"17:00"},"wednesday":{"start":"09:00","end":"17:00"},"thursday":{"start":"09:00","end":"17:00"},"friday":{"start":"09:00","end":"16:00"},"saturday":{"start":"09:00","end":"12:00"}}',
 'America/Denver', 30, ARRAY['orthopedics','follow_up','consultation'],
 '{"email":false,"sms":true,"push":true}'),

('DC-010', 'C-004', 'D-010',
 '{"tuesday":{"start":"08:00","end":"16:00"},"thursday":{"start":"08:00","end":"16:00"}}',
 'America/Denver', 30, ARRAY['general_checkup','vaccination'],
 '{"email":true,"sms":false,"push":false}'),

('DC-011', 'C-005', 'D-011',
 '{"monday":{"start":"07:00","end":"15:00"},"tuesday":{"start":"07:00","end":"15:00"},"wednesday":{"start":"07:00","end":"15:00"},"thursday":{"start":"07:00","end":"15:00"},"friday":{"start":"07:00","end":"15:00"},"saturday":{"start":"08:00","end":"14:00"}}',
 'America/Phoenix', 20, ARRAY['urgent_care','general_checkup','consultation'],
 '{"email":true,"sms":true,"push":true}'),

('DC-012', 'C-005', 'D-012',
 '{"monday":{"start":"14:00","end":"22:00"},"tuesday":{"start":"14:00","end":"22:00"},"wednesday":{"start":"14:00","end":"22:00"},"thursday":{"start":"14:00","end":"22:00"},"sunday":{"start":"09:00","end":"18:00"}}',
 'America/Phoenix', 20, ARRAY['urgent_care','follow_up','mental_health'],
 '{"email":true,"sms":false,"push":true}'),

('DC-013', 'C-006', 'D-013',
 '{"monday":{"start":"08:00","end":"17:00"},"tuesday":{"start":"08:00","end":"17:00"},"wednesday":{"start":"08:00","end":"17:00"},"thursday":{"start":"08:00","end":"17:00"},"friday":{"start":"08:00","end":"16:00"}}',
 'America/Detroit', 30, ARRAY['pediatrics','vaccination','general_checkup'],
 '{"email":true,"sms":true,"push":false}'),

('DC-014', 'C-006', 'D-014',
 '{"monday":{"start":"09:00","end":"17:00"},"tuesday":{"start":"09:00","end":"17:00"},"thursday":{"start":"09:00","end":"17:00"},"friday":{"start":"09:00","end":"16:00"},"saturday":{"start":"09:00","end":"13:00"}}',
 'America/Detroit', 30, ARRAY['pediatrics','follow_up','consultation'],
 '{"email":false,"sms":true,"push":true}'),

('DC-015', 'C-006', 'D-015',
 '{"monday":{"start":"08:00","end":"16:00"},"wednesday":{"start":"08:00","end":"16:00"},"thursday":{"start":"08:00","end":"16:00"},"friday":{"start":"08:00","end":"16:00"}}',
 'America/Detroit', 30, ARRAY['general_checkup','vaccination','follow_up'],
 '{"email":true,"sms":true,"push":true}'),

('DC-016', 'C-007', 'D-016',
 '{"monday":{"start":"09:00","end":"18:00"},"tuesday":{"start":"09:00","end":"18:00"},"wednesday":{"start":"09:00","end":"18:00"},"thursday":{"start":"09:00","end":"18:00"},"friday":{"start":"09:00","end":"17:00"}}',
 'America/New_York', 30, ARRAY['general_checkup','consultation','follow_up'],
 '{"email":true,"sms":false,"push":true}'),

('DC-017', 'C-007', 'D-017',
 '{"monday":{"start":"10:00","end":"18:00"},"tuesday":{"start":"10:00","end":"18:00"},"thursday":{"start":"10:00","end":"18:00"},"friday":{"start":"10:00","end":"17:00"}}',
 'America/New_York', 30, ARRAY['mental_health','follow_up','consultation'],
 '{"email":true,"sms":true,"push":false}'),

('DC-018', 'C-008', 'D-018',
 '{"monday":{"start":"08:00","end":"16:00"},"tuesday":{"start":"08:00","end":"16:00"},"wednesday":{"start":"08:00","end":"16:00"},"thursday":{"start":"08:00","end":"16:00"},"friday":{"start":"08:00","end":"15:00"}}',
 'America/Los_Angeles', 25, ARRAY['general_checkup','cardiology','follow_up'],
 '{"email":true,"sms":true,"push":true}'),

('DC-019', 'C-008', 'D-019',
 '{"tuesday":{"start":"09:00","end":"19:00"},"wednesday":{"start":"09:00","end":"19:00"},"thursday":{"start":"09:00","end":"19:00"},"friday":{"start":"09:00","end":"17:00"},"saturday":{"start":"09:00","end":"14:00"}}',
 'America/Los_Angeles', 25, ARRAY['dermatology','consultation','follow_up'],
 '{"email":false,"sms":true,"push":true}'),

('DC-020', 'C-008', 'D-020',
 '{"monday":{"start":"08:00","end":"16:00"},"wednesday":{"start":"08:00","end":"16:00"}}',
 'America/Los_Angeles', 25, ARRAY['general_checkup','vaccination'],
 '{"email":true,"sms":false,"push":false}'),

('DC-021', 'C-009', 'D-021',
 '{"monday":{"start":"07:00","end":"15:00"},"tuesday":{"start":"07:00","end":"15:00"},"wednesday":{"start":"07:00","end":"15:00"},"thursday":{"start":"07:00","end":"15:00"},"friday":{"start":"07:00","end":"15:00"}}',
 'America/Chicago', 20, ARRAY['general_checkup','vaccination','follow_up'],
 '{"email":true,"sms":true,"push":false}'),

('DC-022', 'C-009', 'D-022',
 '{"monday":{"start":"11:00","end":"19:00"},"tuesday":{"start":"11:00","end":"19:00"},"thursday":{"start":"11:00","end":"19:00"},"friday":{"start":"11:00","end":"17:00"},"saturday":{"start":"08:00","end":"14:00"}}',
 'America/Chicago', 20, ARRAY['mental_health','consultation','follow_up'],
 '{"email":true,"sms":false,"push":true}');

-- 5. PATIENTS
INSERT INTO patients (id, clinic_id, first_name, last_name, dob, phone, email) VALUES
-- C-001
('P-001', 'C-001', 'Alice',    'Thompson',   '1985-03-12', '+12125550401', 'alice.thompson@email.com'),
('P-002', 'C-001', 'Brian',    'Kowalski',   '1972-07-25', '+12125550402', 'brian.kowalski@email.com'),
('P-003', 'C-001', 'Carmen',   'Diaz',       '1990-11-03', '+12125550403', 'carmen.diaz@email.com'),
('P-010', 'C-001', 'Jason',    'Whitfield',  '1988-02-17', '+12125550410', 'jason.whitfield@email.com'),
-- C-002
('P-004', 'C-002', 'David',    'Park',       '1965-01-18', '+13105550404', 'david.park@email.com'),
('P-005', 'C-002', 'Elena',    'Russo',      '1998-06-30', '+13105550405', 'elena.russo@email.com'),
('P-006', 'C-002', 'Frank',    'Okafor',     '2001-09-14', '+13105550406', 'frank.okafor@email.com'),
-- C-003
('P-007', 'C-003', 'Grace',    'Yamamoto',   '1978-04-22', '+13125550407', 'grace.yamamoto@email.com'),
('P-008', 'C-003', 'Henry',    'Sinclair',   '1955-12-01', '+13125550408', 'henry.sinclair@email.com'),
('P-009', 'C-003', 'Iris',     'Mbeki',      '1993-08-09', '+13125550409', 'iris.mbeki@email.com'),
-- C-004
('P-011', 'C-004', 'Kevin',    'Marshall',   '1980-05-14', '+17205550411', 'kevin.marshall@email.com'),
('P-012', 'C-004', 'Laura',    'Stevenson',  '1975-09-21', '+17205550412', 'laura.stevenson@email.com'),
('P-013', 'C-004', 'Mario',    'Esposito',   '1992-12-08', '+17205550413', 'mario.esposito@email.com'),
('P-014', 'C-004', 'Nina',     'Johansson',  '2003-03-27', '+17205550414', 'nina.johansson@email.com'),
-- C-005
('P-015', 'C-005', 'Oscar',    'Brennan',    '1967-07-04', '+16025550415', 'oscar.brennan@email.com'),
('P-016', 'C-005', 'Paula',    'Fernandez',  '1995-01-31', '+16025550416', 'paula.fernandez@email.com'),
('P-017', 'C-005', 'Quinn',    'Douglas',    '1988-10-19', '+16025550417', 'quinn.douglas@email.com'),
-- C-006
('P-018', 'C-006', 'Rachel',   'Brien',   '2015-06-12', '+13135550418', 'rachel.obrien@email.com'),
('P-019', 'C-006', 'Samuel',   'Adeyemi',    '2010-04-03', '+13135550419', 'samuel.adeyemi@email.com'),
('P-020', 'C-006', 'Tina',     'Chowdhury',  '2018-11-25', '+13135550420', 'tina.chowdhury@email.com'),
('P-021', 'C-006', 'Uma',      'Fischer',    '2008-08-17', '+13135550421', 'uma.fischer@email.com'),
-- C-007
('P-022', 'C-007', 'Victor',   'Huang',      '1971-02-28', '+12015550422', 'victor.huang@email.com'),
('P-023', 'C-007', 'Wendy',    'Larson',     '1984-07-11', '+12015550423', 'wendy.larson@email.com'),
('P-024', 'C-007', 'Xavier',   'Nwosu',      '1999-05-06', '+12015550424', 'xavier.nwosu@email.com'),
-- C-008
('P-025', 'C-008', 'Yasmin',   'Goldberg',   '1963-09-30', '+13105550425', 'yasmin.goldberg@email.com'),
('P-026', 'C-008', 'Zach',     'Reeves',     '1991-12-14', '+13105550426', 'zach.reeves@email.com'),
('P-027', 'C-008', 'Amara',    'Delacroix',  '1977-03-05', '+13105550427', 'amara.delacroix@email.com'),
('P-028', 'C-008', 'Bruno',    'Santos',     '2000-07-22', '+13105550428', 'bruno.santos@email.com'),
-- C-009
('P-029', 'C-009', 'Chloe',    'Mackenzie',  '1986-01-09', '+13125550429', 'chloe.mackenzie@email.com'),
('P-030', 'C-009', 'Derek',    'Owusu',      '1958-10-23', '+13125550430', 'derek.owusu@email.com');

-- 6. APPOINTMENTS
INSERT INTO appointments (id, clinic_id, doctor_id, patient_id, appointment_type, status, reason, notes, start_time, end_time, timezone) VALUES
-- C-001 appointments
('A-001', 'C-001', 'D-001', 'P-001', 'general_checkup', 'completed',  'Annual physical exam',              'BP normal, bloodwork ordered',                   '2026-01-15 09:00:00+00', '2026-01-15 09:30:00+00', 'America/New_York'),
('A-002', 'C-001', 'D-001', 'P-002', 'follow_up',       'completed',  'Follow up on bloodwork',            'Results reviewed, medication adjusted',           '2026-01-15 10:00:00+00', '2026-01-15 10:30:00+00', 'America/New_York'),
('A-003', 'C-001', 'D-002', 'P-003', 'vaccination',     'completed',  'Flu shot',                          'No adverse reaction observed',                   '2026-01-20 11:00:00+00', '2026-01-20 11:30:00+00', 'America/New_York'),
('A-004', 'C-001', 'D-001', 'P-010', 'consultation',    'no_show',    'Knee pain evaluation',              NULL,                                              '2026-01-22 14:00:00+00', '2026-01-22 14:30:00+00', 'America/New_York'),
('A-005', 'C-001', 'D-002', 'P-001', 'follow_up',       'scheduled',  'Post-checkup follow-up',            NULL,                                              '2026-03-10 09:00:00+00', '2026-03-10 09:30:00+00', 'America/New_York'),
('A-016', 'C-001', 'D-001', 'P-002', 'consultation',    'completed',  'Hypertension review',               'Medication dosage increased',                    '2026-01-28 09:00:00+00', '2026-01-28 09:30:00+00', 'America/New_York'),
('A-017', 'C-001', 'D-002', 'P-010', 'general_checkup', 'completed',  'Annual wellness exam',              'All vitals normal, vitamin D deficiency noted',  '2026-02-03 10:00:00+00', '2026-02-03 10:30:00+00', 'America/New_York'),
('A-018', 'C-001', 'D-001', 'P-003', 'follow_up',       'cancelled',  'Diabetes management check-in',      'Patient cancelled due to work conflict',          '2026-02-10 11:00:00+00', '2026-02-10 11:30:00+00', 'America/New_York'),
('A-019', 'C-001', 'D-002', 'P-002', 'vaccination',     'scheduled',  'COVID booster appointment',         NULL,                                              '2026-03-18 09:00:00+00', '2026-03-18 09:30:00+00', 'America/New_York'),
('A-020', 'C-001', 'D-001', 'P-001', 'consultation',    'scheduled',  'Sleep disorder consultation',       NULL,                                              '2026-03-25 10:00:00+00', '2026-03-25 10:30:00+00', 'America/New_York'),
-- C-002 appointments
('A-006', 'C-002', 'D-004', 'P-004', 'urgent_care',     'completed',  'Chest pain',                        'ECG normal, referred to cardiologist',            '2026-01-18 16:00:00+00', '2026-01-18 16:20:00+00', 'America/Los_Angeles'),
('A-007', 'C-002', 'D-004', 'P-005', 'general_checkup', 'completed',  'Routine checkup',                   'All vitals within normal range',                 '2026-01-25 10:00:00+00', '2026-01-25 10:20:00+00', 'America/Los_Angeles'),
('A-008', 'C-002', 'D-005', 'P-006', 'dermatology',     'cancelled',  'Skin rash evaluation',              'Patient cancelled day before',                   '2026-02-01 11:00:00+00', '2026-02-01 11:20:00+00', 'America/Los_Angeles'),
('A-009', 'C-002', 'D-004', 'P-004', 'consultation',    'scheduled',  'Cardiology follow-up',              NULL,                                              '2026-03-05 09:00:00+00', '2026-03-05 09:20:00+00', 'America/Los_Angeles'),
('A-021', 'C-002', 'D-005', 'P-005', 'dermatology',     'completed',  'Eczema management',                 'Prescribed topical steroid cream',               '2026-01-30 13:00:00+00', '2026-01-30 13:20:00+00', 'America/Los_Angeles'),
('A-022', 'C-002', 'D-004', 'P-006', 'urgent_care',     'completed',  'Severe headache',                   'CT scan ordered, likely tension headache',        '2026-02-06 15:00:00+00', '2026-02-06 15:20:00+00', 'America/Los_Angeles'),
('A-023', 'C-002', 'D-005', 'P-004', 'follow_up',       'no_show',    'Post-rash follow-up',               NULL,                                              '2026-02-14 10:00:00+00', '2026-02-14 10:20:00+00', 'America/Los_Angeles'),
('A-024', 'C-002', 'D-004', 'P-005', 'consultation',    'scheduled',  'Digestive issues consultation',     NULL,                                              '2026-03-22 09:00:00+00', '2026-03-22 09:20:00+00', 'America/Los_Angeles'),
('A-025', 'C-002', 'D-005', 'P-006', 'dermatology',     'scheduled',  'Acne treatment follow-up',          NULL,                                              '2026-03-28 11:00:00+00', '2026-03-28 11:20:00+00', 'America/Los_Angeles'),
-- C-003 appointments
('A-010', 'C-003', 'D-006', 'P-007', 'vaccination',     'completed',  'COVID booster',                     'No side effects reported',                       '2026-01-12 08:00:00+00', '2026-01-12 08:15:00+00', 'America/Chicago'),
('A-011', 'C-003', 'D-007', 'P-008', 'mental_health',   'completed',  'Anxiety management session',        'CBT techniques discussed',                       '2026-01-19 13:00:00+00', '2026-01-19 13:15:00+00', 'America/Chicago'),
('A-012', 'C-003', 'D-006', 'P-009', 'urgent_care',     'completed',  'High fever',                        'Prescribed antibiotics, follow up in 5 days',    '2026-02-03 07:30:00+00', '2026-02-03 07:45:00+00', 'America/Chicago'),
('A-013', 'C-003', 'D-007', 'P-007', 'follow_up',       'scheduled',  'Therapy session 2',                 NULL,                                              '2026-03-12 13:00:00+00', '2026-03-12 13:15:00+00', 'America/Chicago'),
('A-014', 'C-003', 'D-006', 'P-008', 'general_checkup', 'scheduled',  'Annual physical',                   NULL,                                              '2026-03-15 08:00:00+00', '2026-03-15 08:15:00+00', 'America/Chicago'),
('A-015', 'C-003', 'D-007', 'P-009', 'mental_health',   'completed',  'Depression screening',              'Referred for further psychiatric evaluation',     '2026-01-26 12:00:00+00', '2026-01-26 12:15:00+00', 'America/Chicago'),
('A-026', 'C-003', 'D-006', 'P-007', 'follow_up',       'completed',  'Post-vaccination check',            'No adverse effects confirmed',                   '2026-01-19 08:00:00+00', '2026-01-19 08:15:00+00', 'America/Chicago'),
('A-027', 'C-003', 'D-007', 'P-008', 'mental_health',   'no_show',    'CBT session 2',                     NULL,                                              '2026-02-09 13:00:00+00', '2026-02-09 13:15:00+00', 'America/Chicago'),
('A-028', 'C-003', 'D-006', 'P-009', 'vaccination',     'scheduled',  'HPV vaccine second dose',           NULL,                                              '2026-03-20 07:30:00+00', '2026-03-20 07:45:00+00', 'America/Chicago'),
-- C-004 appointments
('A-029', 'C-004', 'D-008', 'P-011', 'general_checkup', 'completed',  'Annual physical exam',              'Cholesterol slightly elevated, diet advised',     '2026-01-14 09:00:00+00', '2026-01-14 09:30:00+00', 'America/Denver'),
('A-030', 'C-004', 'D-009', 'P-012', 'orthopedics',     'completed',  'Lower back pain',                   'Physiotherapy sessions recommended',              '2026-01-21 10:00:00+00', '2026-01-21 10:30:00+00', 'America/Denver'),
('A-031', 'C-004', 'D-008', 'P-013', 'consultation',    'completed',  'Fatigue and dizziness evaluation',  'Thyroid panel ordered',                          '2026-01-28 11:00:00+00', '2026-01-28 11:30:00+00', 'America/Denver'),
('A-032', 'C-004', 'D-009', 'P-014', 'follow_up',       'no_show',    'Sports injury follow-up',           NULL,                                              '2026-02-04 09:00:00+00', '2026-02-04 09:30:00+00', 'America/Denver'),
('A-033', 'C-004', 'D-008', 'P-011', 'follow_up',       'scheduled',  'Cholesterol recheck',               NULL,                                              '2026-03-14 09:00:00+00', '2026-03-14 09:30:00+00', 'America/Denver'),
('A-034', 'C-004', 'D-009', 'P-012', 'orthopedics',     'scheduled',  'Physiotherapy progress review',     NULL,                                              '2026-03-21 10:00:00+00', '2026-03-21 10:30:00+00', 'America/Denver'),
('A-035', 'C-004', 'D-008', 'P-014', 'general_checkup', 'cancelled',  'Teen wellness check',               'Rescheduled by parent',                          '2026-02-11 11:00:00+00', '2026-02-11 11:30:00+00', 'America/Denver'),
-- C-005 appointments
('A-036', 'C-005', 'D-011', 'P-015', 'urgent_care',     'completed',  'Severe abdominal pain',             'Appendix ruled out, gastritis diagnosed',         '2026-01-16 08:00:00+00', '2026-01-16 08:20:00+00', 'America/Phoenix'),
('A-037', 'C-005', 'D-012', 'P-016', 'mental_health',   'completed',  'Panic attack follow-up',            'Anxiety management plan updated',                '2026-01-23 14:00:00+00', '2026-01-23 14:20:00+00', 'America/Phoenix'),
('A-038', 'C-005', 'D-011', 'P-017', 'general_checkup', 'completed',  'Pre-employment physical',           'All tests passed, cleared for work',             '2026-01-30 09:00:00+00', '2026-01-30 09:20:00+00', 'America/Phoenix'),
('A-039', 'C-005', 'D-012', 'P-015', 'follow_up',       'cancelled',  'Gastritis follow-up',               'Patient cancelled',                              '2026-02-07 14:00:00+00', '2026-02-07 14:20:00+00', 'America/Phoenix'),
('A-040', 'C-005', 'D-011', 'P-016', 'urgent_care',     'no_show',    'High fever and chills',             NULL,                                              '2026-02-14 08:00:00+00', '2026-02-14 08:20:00+00', 'America/Phoenix'),
('A-041', 'C-005', 'D-012', 'P-017', 'mental_health',   'scheduled',  'Stress management session',         NULL,                                              '2026-03-07 14:00:00+00', '2026-03-07 14:20:00+00', 'America/Phoenix'),
('A-042', 'C-005', 'D-011', 'P-015', 'follow_up',       'scheduled',  'Gastritis recheck',                 NULL,                                              '2026-03-28 09:00:00+00', '2026-03-28 09:20:00+00', 'America/Phoenix'),
-- C-006 appointments
('A-043', 'C-006', 'D-013', 'P-018', 'pediatrics',      'completed',  '12-month wellness visit',           'Growth on track, vaccines administered',          '2026-01-13 09:00:00+00', '2026-01-13 09:30:00+00', 'America/Detroit'),
('A-044', 'C-006', 'D-014', 'P-019', 'pediatrics',      'completed',  'Ear infection',                     'Antibiotics prescribed for 7 days',               '2026-01-20 10:00:00+00', '2026-01-20 10:30:00+00', 'America/Detroit'),
('A-045', 'C-006', 'D-013', 'P-020', 'vaccination',     'completed',  'MMR vaccine',                       'No reaction, next dose scheduled',               '2026-01-27 11:00:00+00', '2026-01-27 11:30:00+00', 'America/Detroit'),
('A-046', 'C-006', 'D-015', 'P-021', 'general_checkup', 'completed',  'Annual sports physical',            'Fit for sports participation',                   '2026-02-03 09:00:00+00', '2026-02-03 09:30:00+00', 'America/Detroit'),
('A-047', 'C-006', 'D-014', 'P-018', 'follow_up',       'no_show',    'Post-vaccine wellness check',       NULL,                                              '2026-02-10 10:00:00+00', '2026-02-10 10:30:00+00', 'America/Detroit'),
('A-048', 'C-006', 'D-013', 'P-019', 'pediatrics',      'scheduled',  '15-month wellness visit',           NULL,                                              '2026-03-10 09:00:00+00', '2026-03-10 09:30:00+00', 'America/Detroit'),
('A-049', 'C-006', 'D-015', 'P-020', 'vaccination',     'scheduled',  'Second MMR dose',                   NULL,                                              '2026-03-24 11:00:00+00', '2026-03-24 11:30:00+00', 'America/Detroit'),
-- C-007 appointments
('A-050', 'C-007', 'D-016', 'P-022', 'general_checkup', 'completed',  'Annual physical',                   'Pre-diabetic markers detected, diet counseled',  '2026-01-15 10:00:00+00', '2026-01-15 10:30:00+00', 'America/New_York'),
('A-051', 'C-007', 'D-017', 'P-023', 'mental_health',   'completed',  'Depression follow-up',              'Medication adjusted, mood improving',             '2026-01-22 11:00:00+00', '2026-01-22 11:30:00+00', 'America/New_York'),
('A-052', 'C-007', 'D-016', 'P-024', 'consultation',    'completed',  'Recurring migraines',               'MRI ordered to rule out structural causes',       '2026-01-29 09:00:00+00', '2026-01-29 09:30:00+00', 'America/New_York'),
('A-053', 'C-007', 'D-017', 'P-022', 'follow_up',       'cancelled',  'Diabetes risk follow-up',           'Patient cancelled last minute',                  '2026-02-05 10:00:00+00', '2026-02-05 10:30:00+00', 'America/New_York'),
('A-054', 'C-007', 'D-016', 'P-023', 'general_checkup', 'scheduled',  'Routine annual exam',               NULL,                                              '2026-03-11 10:00:00+00', '2026-03-11 10:30:00+00', 'America/New_York'),
('A-055', 'C-007', 'D-017', 'P-024', 'mental_health',   'scheduled',  'Anxiety therapy session',           NULL,                                              '2026-03-19 11:00:00+00', '2026-03-19 11:30:00+00', 'America/New_York'),
('A-056', 'C-007', 'D-016', 'P-022', 'follow_up',       'scheduled',  'Pre-diabetes re-evaluation',        NULL,                                              '2026-03-26 09:00:00+00', '2026-03-26 09:30:00+00', 'America/New_York'),
-- C-008 appointments
('A-057', 'C-008', 'D-018', 'P-025', 'cardiology',      'completed',  'Heart palpitations evaluation',     'Holter monitor prescribed for 48 hours',          '2026-01-16 09:00:00+00', '2026-01-16 09:25:00+00', 'America/Los_Angeles'),
('A-058', 'C-008', 'D-019', 'P-026', 'dermatology',     'completed',  'Psoriasis flare-up',                'Biologic therapy discussed as next step',         '2026-01-23 10:00:00+00', '2026-01-23 10:25:00+00', 'America/Los_Angeles'),
('A-059', 'C-008', 'D-018', 'P-027', 'general_checkup', 'completed',  'Post-surgery annual exam',          'Recovery complete, no complications',             '2026-01-30 11:00:00+00', '2026-01-30 11:25:00+00', 'America/Los_Angeles'),
('A-060', 'C-008', 'D-019', 'P-028', 'dermatology',     'no_show',    'Mole evaluation',                   NULL,                                              '2026-02-06 13:00:00+00', '2026-02-06 13:25:00+00', 'America/Los_Angeles'),
('A-061', 'C-008', 'D-018', 'P-025', 'cardiology',      'scheduled',  'Holter monitor result review',      NULL,                                              '2026-03-06 09:00:00+00', '2026-03-06 09:25:00+00', 'America/Los_Angeles'),
('A-062', 'C-008', 'D-019', 'P-026', 'follow_up',       'scheduled',  'Psoriasis treatment follow-up',     NULL,                                              '2026-03-13 10:00:00+00', '2026-03-13 10:25:00+00', 'America/Los_Angeles'),
('A-063', 'C-008', 'D-018', 'P-028', 'general_checkup', 'scheduled',  'Annual wellness check',             NULL,                                              '2026-03-27 11:00:00+00', '2026-03-27 11:25:00+00', 'America/Los_Angeles'),
-- C-009 appointments
('A-064', 'C-009', 'D-021', 'P-029', 'general_checkup', 'completed',  'Routine physical exam',             'Iron deficiency anemia found, supplements given', '2026-01-13 08:00:00+00', '2026-01-13 08:20:00+00', 'America/Chicago'),
('A-065', 'C-009', 'D-022', 'P-030', 'mental_health',   'completed',  'Grief counseling session',          'Working through bereavement, stable mood',        '2026-01-20 12:00:00+00', '2026-01-20 12:20:00+00', 'America/Chicago'),
('A-066', 'C-009', 'D-021', 'P-030', 'vaccination',     'completed',  'Shingles vaccine',                  'First dose administered, no reaction',            '2026-01-27 09:00:00+00', '2026-01-27 09:20:00+00', 'America/Chicago'),
('A-067', 'C-009', 'D-022', 'P-029', 'consultation',    'cancelled',  'Work-life balance counseling',      'Cancelled by patient',                           '2026-02-03 12:00:00+00', '2026-02-03 12:20:00+00', 'America/Chicago'),
('A-068', 'C-009', 'D-021', 'P-029', 'follow_up',       'scheduled',  'Anemia progress check',             NULL,                                              '2026-03-10 08:00:00+00', '2026-03-10 08:20:00+00', 'America/Chicago'),
('A-069', 'C-009', 'D-022', 'P-030', 'mental_health',   'scheduled',  'Grief counseling session 3',        NULL,                                              '2026-03-17 12:00:00+00', '2026-03-17 12:20:00+00', 'America/Chicago'),
('A-070', 'C-009', 'D-021', 'P-030', 'vaccination',     'scheduled',  'Shingles vaccine second dose',      NULL,                                              '2026-03-24 09:00:00+00', '2026-03-24 09:20:00+00', 'America/Chicago');

-- 7. TASKS
INSERT INTO tasks (id, clinic_id, doctor_id, title, description, status, due_date) VALUES
-- C-001
('T-001', 'C-001', 'D-001', 'Review bloodwork results',           'Review and interpret lab results for patient P-001',                 'completed', '2026-01-20 17:00:00+00'),
('T-002', 'C-001', 'D-001', 'Call patient re: medication',        'Follow up call with P-002 regarding adjusted dosage side effects',   'completed', '2026-01-22 12:00:00+00'),
('T-003', 'C-001', 'D-002', 'Update vaccination records',         'Log flu shot records for January patients into the system',         'completed', '2026-01-25 17:00:00+00'),
('T-004', 'C-001', 'D-001', 'Referral letter for P-010',          'Write referral letter to orthopedic specialist for knee pain',      'pending',   '2026-03-01 17:00:00+00'),
('T-005', 'C-001', 'D-002', 'Prepare follow-up notes',            'Prepare session notes before P-001 follow-up appointment',         'pending',   '2026-03-09 17:00:00+00'),
('T-006', 'C-001', 'D-001', 'Complete hypertension report P-002', 'Document P-002 updated hypertension management plan',              'completed', '2026-02-01 17:00:00+00'),
('T-007', 'C-001', 'D-002', 'Reschedule P-003 appointment',       'Contact P-003 to reschedule cancelled diabetes check-in',          'pending',   '2026-02-15 17:00:00+00'),
('T-008', 'C-001', 'D-001', 'Prep notes for sleep consultation',  'Review P-001 sleep history before March consultation',             'pending',   '2026-03-24 17:00:00+00'),
-- C-002
('T-009', 'C-002', 'D-004', 'Send cardiology referral',           'Send referral documents to cardiologist for P-004',                'completed', '2026-01-20 17:00:00+00'),
('T-010', 'C-002', 'D-004', 'Pre-appointment prep P-004',         'Review P-004 history before March consultation',                   'pending',   '2026-03-04 17:00:00+00'),
('T-011', 'C-002', 'D-005', 'Reschedule P-006 appointment',       'Contact P-006 to reschedule cancelled dermatology appointment',    'pending',   '2026-02-10 17:00:00+00'),
('T-012', 'C-002', 'D-004', 'CT scan follow-up for P-006',        'Review CT scan results for P-006 headache case',                  'completed', '2026-02-14 17:00:00+00'),
('T-013', 'C-002', 'D-005', 'Eczema care plan update P-005',      'Update P-005 treatment plan for eczema management',               'completed', '2026-02-03 17:00:00+00'),
('T-014', 'C-002', 'D-004', 'Prep P-005 consultation notes',      'Review digestive history ahead of March appointment',             'pending',   '2026-03-21 17:00:00+00'),
-- C-003
('T-015', 'C-003', 'D-006', 'Document antibiotic prescription',   'Log P-009 antibiotic treatment details and schedule follow-up',   'completed', '2026-02-03 17:00:00+00'),
('T-016', 'C-003', 'D-007', 'Prepare CBT materials',              'Gather CBT worksheets and materials for P-008 next session',      'pending',   '2026-03-11 17:00:00+00'),
('T-017', 'C-003', 'D-006', 'Annual checkup prep P-008',          'Pull prior records and labs before P-008 annual checkup',         'pending',   '2026-03-14 17:00:00+00'),
('T-018', 'C-003', 'D-007', 'Session notes P-007',                'Complete session notes from P-007 therapy intake',                'completed', '2026-01-21 17:00:00+00'),
('T-019', 'C-003', 'D-007', 'Psychiatric referral for P-009',     'Draft referral letter to psychiatrist for P-009 depression eval', 'completed', '2026-01-30 17:00:00+00'),
('T-020', 'C-003', 'D-006', 'Schedule HPV follow-up P-009',       'Book second HPV dose for P-009 and send reminder',               'pending',   '2026-03-10 17:00:00+00'),
-- C-004
('T-021', 'C-004', 'D-008', 'Review thyroid panel P-013',         'Interpret thyroid results and advise P-013 on next steps',        'completed', '2026-02-04 17:00:00+00'),
('T-022', 'C-004', 'D-009', 'Physio referral P-012',              'Coordinate physiotherapy referral for P-012 back pain',          'completed', '2026-01-25 17:00:00+00'),
('T-023', 'C-004', 'D-008', 'Cholesterol diet plan P-011',        'Create dietary recommendations for P-011 elevated cholesterol',   'completed', '2026-01-20 17:00:00+00'),
('T-024', 'C-004', 'D-009', 'Reschedule P-014 sports follow-up',  'Contact P-014 guardian to reschedule no-show appointment',       'pending',   '2026-02-10 17:00:00+00'),
('T-025', 'C-004', 'D-008', 'Pre-exam notes P-011',               'Review P-011 labs and prior visits before cholesterol recheck',  'pending',   '2026-03-13 17:00:00+00'),
('T-026', 'C-004', 'D-009', 'Physio progress review P-012',       'Review physiotherapy progress notes before March visit',         'pending',   '2026-03-20 17:00:00+00'),
-- C-005
('T-027', 'C-005', 'D-011', 'Gastritis treatment plan P-015',     'Develop and log treatment plan for P-015 gastritis',             'completed', '2026-01-18 17:00:00+00'),
('T-028', 'C-005', 'D-012', 'Update anxiety plan P-016',          'Revise anxiety management plan following latest session',        'completed', '2026-01-26 17:00:00+00'),
('T-029', 'C-005', 'D-011', 'Reschedule P-015 gastritis f/u',     'Contact P-015 to reschedule cancelled follow-up',               'completed', '2026-02-10 17:00:00+00'),
('T-030', 'C-005', 'D-012', 'Contact P-016 re no-show',           'Reach out to P-016 about missed urgent care visit',             'pending',   '2026-02-16 17:00:00+00'),
('T-031', 'C-005', 'D-011', 'Prepare recheck notes P-015',        'Review P-015 gastritis history before March recheck',           'pending',   '2026-03-27 17:00:00+00'),
('T-032', 'C-005', 'D-012', 'Session prep P-017',                 'Review P-017 stress triggers before stress management session',  'pending',   '2026-03-06 17:00:00+00'),
-- C-006
('T-033', 'C-006', 'D-013', 'Log vaccine admin P-020',            'Record MMR vaccine details for P-020 in patient records',        'completed', '2026-01-28 17:00:00+00'),
('T-034', 'C-006', 'D-014', 'Antibiotic follow-up P-019',         'Check in on P-019 ear infection treatment after 3 days',        'completed', '2026-01-24 17:00:00+00'),
('T-035', 'C-006', 'D-015', 'Sports clearance letter P-021',      'Issue sports participation clearance letter for P-021',          'completed', '2026-02-05 17:00:00+00'),
('T-036', 'C-006', 'D-014', 'Reschedule P-018 wellness check',    'Contact P-018 guardian to rebook missed post-vaccine check',    'pending',   '2026-02-13 17:00:00+00'),
('T-037', 'C-006', 'D-013', 'Prep P-019 15-month visit notes',    'Pull growth charts and vaccine history for upcoming visit',     'pending',   '2026-03-09 17:00:00+00'),
('T-038', 'C-006', 'D-015', 'Book second MMR P-020',              'Schedule and confirm second MMR dose for P-020',                'pending',   '2026-03-17 17:00:00+00'),
-- C-007
('T-039', 'C-007', 'D-016', 'Diabetes risk plan P-022',           'Draft pre-diabetes prevention plan for P-022',                  'completed', '2026-01-18 17:00:00+00'),
('T-040', 'C-007', 'D-017', 'Update medication P-023',            'Review and adjust P-023 antidepressant prescription',          'completed', '2026-01-25 17:00:00+00'),
('T-041', 'C-007', 'D-016', 'MRI referral P-024',                 'Submit MRI referral request for P-024 migraine workup',        'completed', '2026-02-01 17:00:00+00'),
('T-042', 'C-007', 'D-017', 'Reschedule P-022 diabetes f/u',      'Contact P-022 to rebook cancelled diabetes risk follow-up',    'pending',   '2026-02-08 17:00:00+00'),
('T-043', 'C-007', 'D-016', 'Pre-exam prep P-023',                'Pull prior annual exam notes before March visit',              'pending',   '2026-03-10 17:00:00+00'),
('T-044', 'C-007', 'D-017', 'Session prep P-024',                 'Review anxiety triggers and therapy history for P-024',        'pending',   '2026-03-18 17:00:00+00'),
-- C-008
('T-045', 'C-008', 'D-018', 'Holter monitor review P-025',        'Analyze Holter monitor results for P-025 palpitations',        'pending',   '2026-03-05 17:00:00+00'),
('T-046', 'C-008', 'D-019', 'Biologic therapy plan P-026',        'Research and prepare biologic therapy options for P-026',      'completed', '2026-01-28 17:00:00+00'),
('T-047', 'C-008', 'D-018', 'Surgical follow-up notes P-027',     'Document post-surgery annual exam findings for P-027',         'completed', '2026-02-01 17:00:00+00'),
('T-048', 'C-008', 'D-019', 'Reschedule mole eval P-028',         'Contact P-028 to reschedule missed dermatology appointment',   'pending',   '2026-02-10 17:00:00+00'),
('T-049', 'C-008', 'D-018', 'Prep cardiology notes P-025',        'Review Holter data before March cardiology review',            'pending',   '2026-03-05 17:00:00+00'),
('T-050', 'C-008', 'D-019', 'Psoriasis follow-up prep P-026',     'Review treatment response notes ahead of March visit',        'pending',   '2026-03-12 17:00:00+00'),
-- C-009
('T-051', 'C-009', 'D-021', 'Iron supplement plan P-029',         'Document iron supplement protocol and dietary advice for P-029','completed', '2026-01-15 17:00:00+00'),
('T-052', 'C-009', 'D-022', 'Grief counseling notes P-030',       'Write session notes after first grief counseling session',     'completed', '2026-01-22 17:00:00+00'),
('T-053', 'C-009', 'D-021', 'Shingles dose 2 reminder P-030',     'Send appointment reminder for P-030 second shingles dose',     'pending',   '2026-03-17 17:00:00+00'),
('T-054', 'C-009', 'D-022', 'Reschedule counseling P-029',        'Contact P-029 to reschedule cancelled counseling session',     'completed', '2026-02-05 17:00:00+00'),
('T-055', 'C-009', 'D-021', 'Anemia follow-up prep P-029',        'Review iron levels and supplement compliance before March visit','pending',  '2026-03-09 17:00:00+00'),
('T-056', 'C-009', 'D-022', 'Session 3 prep P-030',               'Review prior grief counseling notes before session 3',        'pending',   '2026-03-16 17:00:00+00');
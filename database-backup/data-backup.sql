-- ============================================================================
-- V3L EnergyControl - Supabase data backup (instellingen- en logtabellen)
--
-- Gegenereerd: 2026-10-27, rechtstreeks uit de live database 'V3L HomeWizard'.
-- Vereist eerst schema.sql (structuur + RLS + policies).
--
-- BEWUST NIET MEEGENOMEN: minute_log (43.669+ rijen, per-minuut vermogenslog -
-- te groot en niet nodig om terug te vallen op, bouwt na een restore vanzelf
-- weer op) en fault_log (had op het moment van backuppen 0 rijen).
--
-- LET OP: email_settings bevat de EmailJS-configuratie (service/template-ID's
-- en een public key van EmailJS - bedoeld om client-side gebruikt te worden,
-- dus geen geheime server-key, maar behandel dit bestand toch niet als
-- volledig publiek materiaal).
-- ============================================================================

-- app_settings
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_aircon_mode', 'off');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_aircon_setpoint', 'None');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_aircon_toggle', 'on');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_current_temp', '18.2');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_elec_price', '0.28359');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_gas_price', '1.24218');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_interval', '1');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_ip', '192.168.178.161');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_overload_w', '5500');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_price_elec', '0.023');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_price_gas', '0.05');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_supabase_low_interval_sec', '5');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_supabase_threshold_w', '2000');
INSERT INTO public.app_settings (field_id, value) VALUES ('p1_target_temp', '20.0');

-- email_settings
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_email_enabled', '1');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_email_to', 'arjan@familievandriel.nl');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_email_verified', '1');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_enabled', '1');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_key', '8_slk5XFTTh9Vuo5E');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_service', 'service_e3rut0u');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_template', 'template_pqe1tjd');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_to', 'arjan@familievandriel.nl');
INSERT INTO public.email_settings (field_id, value) VALUES ('p1_storage_email_verified', '1');

-- field_locks
INSERT INTO public.field_locks (field_id, locked) VALUES ('elecPriceInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('emailjsQuotaInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('emailPublicKey', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('emailService', false);
INSERT INTO public.field_locks (field_id, locked) VALUES ('emailTemplate', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('emailTo', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('faultApiKeyInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('faultApiUrlInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('gasPriceInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('intervalInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('ipInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('logApiKeyInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('logApiUrlInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('storageEmailPublicKey', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('storageEmailService', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('storageEmailTemplate', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('storageEmailTo', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('supabaseLowIntervalInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('supabaseThresholdInput', true);
INSERT INTO public.field_locks (field_id, locked) VALUES ('thresholdInput', true);

-- photo_meta
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1790961000504_e1qlw5_A._1e_groepenkast.jpeg', 0, NULL, NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697195826_3ntw3i_1000019565.jpg', 1, 'Dit was de vorige groepenkast die we hebben vervangen.', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697485347_58m7hm_1000024013.jpg', 2, 'Lokale vereffening voor doucheruimte', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697484138_2jzecc_1000024011.jpg', 3, 'Dit zijn de groepen voor de vaatwasser, oven. Koffiezetapparaat en airfryer, airco, vaatwasser, magnetron', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697483108_nrw1tq_1000024012.jpg', 4, 'Op afstand nog de groep voor de sunshower ', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697481835_ujisnw_1000024014.jpg', 5, 'Aftakking voor de lokale vereffening voor de douche.', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785697197033_xdplir_ebda5584-4e8d-4456-8658-aa7394002bbc-1_all_12618.jpg', 6, '1e oplevering', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785696983638_twh510_ebda5584-4e8d-4456-8658-aa7394002bbc-1_all_12745.jpg', 7, '2e opleveringen', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785696982159_cll94b_1000021356.jpg', 8, 'Hier is gekozen voor het gebruik van rijgklemmen om een goede verdeling te kunnen maken.', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785696980484_ewxjvl_1000023044.jpg', 9, 'Dit is de vaste aansluiting voor de inductie kookplaat. In plaats van een perilex stekker', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1785696979535_ydsn76_1000023414.jpg', 10, NULL, NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1787694047120_1iuobt_1000025514.jpg', 11, 'Krachtgroep verplaatst, C16 automaat geplaatst voor airco. SPD geplaatst', NULL);
INSERT INTO public.photo_meta (name, sort_order, caption, taken_at) VALUES ('1788905454829_ambdbb_M._3e_groepenkast_gereed.jpg', 12, 'laatste configuratie', '2026-08-22 07:34:27+00');

-- daily_cost
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-10', 643.785, 0, 5674.289, 647.987, 0, 5674.289, 1.19164518, 0, 1.19164518);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-11', 647.988, 0, 5674.289, 661.256, 0, 5674.37, 3.76267211999998, 0.100616580000163, 3.86328870000014);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-12', 661.256, 0, 5674.37, 671.17, 0, 5674.561, 2.81151126, 0.237256379999756, 3.04876763999975);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-13', 671.171, 0, 5674.561, 685.494, 0, 5674.664, 4.06185956999999, 0.127944540000081, 4.18980411000008);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-14', 685.494, 0, 5674.664, 696.293, 0, 5674.941, 3.06248840999999, 0.344083860000054, 3.40657227000005);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-15', 696.293, 0, 5674.941, 708.755, 0, 5675.044, 3.53409858, 0.127944540000081, 3.66204312000008);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-16', 708.756, 0, 5675.044, 720.795, 0, 5675.157, 3.41414001, 0.140366340000353, 3.55450635000035);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-17', 720.795, 0, 5675.157, 735.036, 0, 5675.295, 4.03860519, 0.171420839999901, 4.2100260299999);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-18', 735.037, 0, 5675.295, 742.228, 0, 5675.38, 2.03929568999998, 0.105585300000045, 2.14488099000002);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-19', 745.139, 0, 5675.499, 760.133, 0, 5675.644, 4.25214846000001, 0.180116100000542, 4.43226456000055);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-20', 760.135, 0, 5675.644, 774.929, 0, 5675.795, 4.19543046, 0.187569179999801, 4.3829996399998);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-21', 774.931, 0, 5675.795, 784.861, 0, 5676.01, 2.81604869999999, 0.267068700000181, 3.08311740000017);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-22', 784.864, 0, 5676.01, 796.091, 0, 5676.01, 3.18386492999999, 0, 3.18386492999999);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-23', 796.092, 0, 5676.01, 807.144, 0, 5676.195, 3.13423668000001, 0.229803299999367, 3.36403997999937);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-24', 807.144, 0, 5676.195, 823.561, 0, 5676.387, 4.65569703000001, 0.238498560000009, 4.89419559000002);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-25', 823.567, 0, 5676.387, 834.031, 0, 5676.387, 2.96748575999998, 0, 2.96748575999998);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-26', 834.035, 0, 5676.387, 844.245, 0, 5676.581, 2.89545390000001, 0.240982920000515, 3.13643682000053);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-27', 844.256, 0, 5676.581, 860.721, 0, 5676.694, 4.66930935000001, 0.140366340000353, 4.80967569000036);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-28', 860.722, 0, 5676.694, 869.101, 0, 5676.84, 2.37620061000001, 0.181358279999666, 2.55755888999967);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-29', 869.103, 0, 5676.84, 885.153, 0, 5677.005, 4.55161950000002, 0.204959699999955, 4.75657919999997);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-09-30', 885.154, 0, 5677.005, 896.317, 0, 5677.073, 3.16571517, 0.0844682400002621, 3.25018341000027);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-01', 896.321, 0, 5677.073, 908.586, 0, 5677.247, 3.47823135, 0.216139319999973, 3.69437066999997);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-02', 908.588, 0, 5677.247, 921.654, 0, 5677.292, 3.70538694000001, 0.0558981000000904, 3.7612850400001);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-03', 921.658, 0, 5677.292, 933.538, 0, 5677.568, 3.3690492, 0.342841679999801, 3.7118908799998);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-04', 933.543, 0, 5677.568, 952.076, 0, 5677.568, 5.25577347, 0, 5.25577347);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-05', 952.078, 0, 5677.568, 962.269, 0, 5677.821, 2.89006569000001, 0.314271539999629, 3.20433722999964);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-06', 962.272, 0, 5677.821, 977.795, 0, 5677.821, 4.40216756999997, 0, 4.40216756999997);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-07', 977.796, 0, 5677.821, 986.447, 0, 5678.086, 2.45333708999999, 0.329177700000407, 2.78251479000039);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-08', 986.45, 0, 5678.086, 996.271, 0, 5678.086, 2.78513738999998, 0, 2.78513738999998);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-09', 996.272, 0, 5678.086, 1007.242, 0, 5678.248, 3.11098229999998, 0.201233159999196, 3.31221545999917);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-10', 1007.246, 0, 5678.248, 1021.388, 0, 5678.45, 4.01052978000001, 0.25092036000028, 4.26145014000029);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-11', 1021.391, 0, 5678.45, 1047.753, 0, 5678.566, 7.47599957999999, 0.144092879999982, 7.62009245999997);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-12', 1047.754, 0, 5678.566, 1056.899, 0, 5679.408, 2.59343055, 1.04591556000069, 3.63934611000068);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-13', 1056.901, 0, 5679.408, 1072.473, 0, 5679.55, 4.41606347999997, 0.176389559999783, 4.59245303999975);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-14', 1072.475, 0, 5679.55, 1081.189, 0, 5679.688, 2.47120326000005, 0.171420839999901, 2.64262409999995);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-15', 1081.19, 0, 5679.688, 1091.879, 0, 5679.87, 3.03129350999996, 0.226076759999738, 3.2573702699997);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-16', 1091.882, 0, 5679.87, 1099.966, 0, 5679.96, 2.29254155999995, 0.111796200000181, 2.40433776000013);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-17', 1099.968, 0, 5679.96, 1108.124, 0, 5680.047, 2.31296003999999, 0.108069659999422, 2.42102969999941);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-18', 1108.126, 0, 5680.047, 1126.299, 0, 5680.047, 5.15368107, 0, 5.15368107);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-19', 1126.304, 0, 5680.047, 1145.13, 0, 5680.365, 5.33886534000001, 0.395013240000262, 5.73387858000027);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-20', 1145.133, 0, 5680.365, 1164.901, 0, 5680.465, 5.60600712000001, 0.124218000000452, 5.73022512000046);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-21', 1164.903, 0, 5680.465, 1176.829, 0, 5680.575, 3.38209433999998, 0.136639799999593, 3.51873413999957);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-22', 1176.847, 0, 5680.575, 1191.232, 0, 5680.618, 4.07944215, 0.053413740000714, 4.13285589000071);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-23', 1191.237, 0, 5680.618, 1206.503, 0, 5680.951, 4.32928493999996, 0.413645939999539, 4.7429308799995);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-24', 1206.505, 0, 5680.951, 1221.163, 0, 5682.632, 4.15686221999997, 2.08810457999948, 6.24496679999946);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-25', 1221.175, 0, 5682.632, 1244.365, 0, 5683.357, 6.57645210000002, 0.900580500000452, 7.47703260000047);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-26', 1244.369, 0, 5683.357, 1257.836, 0, 5683.847, 3.81910653000003, 0.608668199999729, 4.42777472999976);
INSERT INTO public.daily_cost (log_date, import_kwh_start, export_kwh_start, gas_m3_start, import_kwh_now, export_kwh_now, gas_m3_now, elec_cost, gas_cost, total_cost) VALUES ('2026-10-27', 1257.837, 0, 5683.847, 1263.4, 0, 5684.097, 1.57761117000003, 0.310545, 1.88815617000003);

-- overload_event_log
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (1, '2026-10-13 16:35:41.713726+00', 'L3', 5051.0, 5000.0, 'droger', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (2, '2026-10-13 16:35:42.174786+00', 'L3', 5051.0, 5000.0, 'airco_christian', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (3, '2026-10-13 16:35:42.391881+00', 'L3', 5051.0, 5000.0, 'airco_woonkamer', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (4, '2026-10-13 16:35:42.452257+00', 'L3', 5051.0, 5000.0, 'airco_jason', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (5, '2026-10-13 16:35:44.240397+00', 'L3', 5031.0, 5000.0, 'mail', 'mail_verstuurd');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (6, '2026-10-13 16:35:51.625278+00', 'L3', 5050.0, 5000.0, 'airco_jason', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (7, '2026-10-13 16:35:51.656096+00', 'L3', 5050.0, 5000.0, 'airco_christian', 'uitgeschakeld');
INSERT INTO public.overload_event_log (id, event_time, phase, watt, threshold, source, action) VALUES (8, '2026-10-13 16:35:51.819916+00', 'L3', 5050.0, 5000.0, 'airco_woonkamer', 'uitgeschakeld');
SELECT setval(pg_get_serial_sequence('public.overload_event_log','id'), (SELECT MAX(id) FROM public.overload_event_log));

-- email_send_log
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (1, 'overload', '2026-07-22 18:55:18.491224+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (2, 'overload', '2026-07-22 18:56:29.012852+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (3, 'overload', '2026-07-23 10:41:22.687238+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (4, 'storage', '2026-07-23 10:41:23.490487+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (5, 'overload', '2026-07-23 11:29:15.022668+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (6, 'storage', '2026-07-23 11:29:21.103811+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (7, 'overload', '2026-07-30 17:52:54.085572+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (8, 'storage', '2026-07-30 17:53:02.906293+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (9, 'overload', '2026-07-30 21:48:53.449347+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (10, 'overload', '2026-07-30 22:04:07.780042+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (11, 'overload', '2026-07-30 22:04:50.36331+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (13, 'overload', '2026-07-30 22:19:12.29471+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (14, 'overload', '2026-08-28 17:13:49.425604+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (15, 'overload', '2026-08-28 17:14:11.287812+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (16, 'overload', '2026-09-05 10:12:46.716559+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (17, 'overload', '2026-09-05 10:12:48.767563+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (18, 'overload', '2026-09-05 10:12:50.179159+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (19, 'storage', '2026-09-05 10:13:17.360362+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (20, 'overload', '2026-09-20 10:52:24.506552+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (21, 'overload', '2026-10-01 16:02:21.647574+00');
INSERT INTO public.email_send_log (id, kind, sent_at) VALUES (22, 'overload', '2026-10-13 16:35:44.177682+00');
SELECT setval(pg_get_serial_sequence('public.email_send_log','id'), (SELECT MAX(id) FROM public.email_send_log));

-- latest_status (laatste bekende meterstand op moment van backup)
INSERT INTO public.latest_status (id, active_power_w, active_power_l1_w, active_power_l2_w, active_power_l3_w, active_voltage_l1_v, active_voltage_l2_v, active_voltage_l3_v, active_voltage_v, active_current_l1_a, active_current_l2_a, active_current_l3_a, active_current_a, total_power_import_kwh, total_power_export_kwh, total_gas_m3, gas_timestamp, water_m3, meter_model, smr_version, unique_id, unique_id_gas, any_power_fail_count, long_power_fail_count, voltage_sag_l1_count, voltage_sag_l2_count, voltage_sag_l3_count, voltage_swell_l1_count, voltage_swell_l2_count, voltage_swell_l3_count, updated_at) VALUES (true, 133, 39, 28, 65, 239.5, 230.6, 236.9, NULL, 0.163, 0.121, 0.274, NULL, 1263.401, NULL, 5684.097, '261027115001', NULL, 'Kaifa AIFA-METER', 50, 'E0079000044774825', NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2026-10-27 12:27:48.720979+00');

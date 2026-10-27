-- ============================================================================
-- V3L EnergyControl - Supabase schema backup
--
-- Project: "V3L HomeWizard" (Supabase project id: sdkzzjrtmtzfvjrgpqbm)
-- Gegenereerd: 2026-10-27, rechtstreeks uitgelezen uit de live database.
--
-- Dit bestand bevat de structuur (tabellen, indexen, Row Level Security en
-- policies) van alle tabellen in het public-schema die de V3L EnergyControl
-- app en de Home Assistant-automatiseringen gebruiken. Zie data-backup.sql
-- voor een backup van de kleine instellingen-/logtabellen.
--
-- Bedoeld als fallback: als de Supabase-database ooit stuk/leeg is, kun je
-- met dit bestand (en data-backup.sql) de structuur + instellingen
-- terugzetten in een nieuw of leeg Supabase-project.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Tabel: app_settings
-- Instellingen die de app zelf beheert (prijzen, interval, IP, drempels, ...)
-- ----------------------------------------------------------------------------
CREATE TABLE public.app_settings (
    field_id text PRIMARY KEY,
    value text,
    updated_at timestamptz DEFAULT now()
);
ALTER TABLE public.app_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select app_settings" ON public.app_settings FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert app_settings" ON public.app_settings FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update app_settings" ON public.app_settings FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: email_settings
-- EmailJS-configuratie (overload-mail en opslag-mail)
-- ----------------------------------------------------------------------------
CREATE TABLE public.email_settings (
    field_id text PRIMARY KEY,
    value text,
    updated_at timestamptz DEFAULT now()
);
ALTER TABLE public.email_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select email_settings" ON public.email_settings FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert email_settings" ON public.email_settings FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update email_settings" ON public.email_settings FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: field_locks
-- Welke instellingenvelden in de app vergrendeld zijn (alleen via HA aan te passen)
-- ----------------------------------------------------------------------------
CREATE TABLE public.field_locks (
    field_id text PRIMARY KEY,
    locked boolean DEFAULT false,
    updated_at timestamptz DEFAULT now()
);
ALTER TABLE public.field_locks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select field_locks" ON public.field_locks FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert field_locks" ON public.field_locks FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update field_locks" ON public.field_locks FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: latest_status
-- Meest recente P1-meterstand (enkele rij, id is altijd true)
-- ----------------------------------------------------------------------------
CREATE TABLE public.latest_status (
    id boolean PRIMARY KEY DEFAULT true CHECK (id = true),
    active_power_w double precision,
    active_power_l1_w double precision,
    active_power_l2_w double precision,
    active_power_l3_w double precision,
    active_voltage_l1_v double precision,
    active_voltage_l2_v double precision,
    active_voltage_l3_v double precision,
    active_voltage_v double precision,
    active_current_l1_a double precision,
    active_current_l2_a double precision,
    active_current_l3_a double precision,
    active_current_a double precision,
    total_power_import_kwh double precision,
    total_power_export_kwh double precision,
    total_gas_m3 double precision,
    gas_timestamp text,
    water_m3 double precision,
    meter_model text,
    smr_version integer,
    unique_id text,
    unique_id_gas text,
    any_power_fail_count integer,
    long_power_fail_count integer,
    voltage_sag_l1_count integer,
    voltage_sag_l2_count integer,
    voltage_sag_l3_count integer,
    voltage_swell_l1_count integer,
    voltage_swell_l2_count integer,
    voltage_swell_l3_count integer,
    updated_at timestamptz DEFAULT now()
);
ALTER TABLE public.latest_status ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select latest_status" ON public.latest_status FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert latest_status" ON public.latest_status FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update latest_status" ON public.latest_status FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: minute_log
-- Per-minuut vermogenslog (totaal + L1/L2/L3), groeit continu
-- ----------------------------------------------------------------------------
CREATE TABLE public.minute_log (
    id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    log_time timestamptz,
    total double precision,
    l1 double precision,
    l2 double precision,
    l3 double precision,
    created_at timestamptz DEFAULT now()
);
CREATE INDEX idx_minute_log_log_time ON public.minute_log USING btree (log_time);
ALTER TABLE public.minute_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select minute_log" ON public.minute_log FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert minute_log" ON public.minute_log FOR INSERT TO authenticated WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: daily_cost
-- Dagelijkse kosten elektra/gas (1 rij per dag)
-- ----------------------------------------------------------------------------
CREATE TABLE public.daily_cost (
    log_date date PRIMARY KEY,
    import_kwh_start double precision,
    export_kwh_start double precision,
    gas_m3_start double precision,
    import_kwh_now double precision,
    export_kwh_now double precision,
    gas_m3_now double precision,
    elec_cost double precision,
    gas_cost double precision,
    total_cost double precision,
    updated_at timestamptz DEFAULT now()
);
ALTER TABLE public.daily_cost ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select daily_cost" ON public.daily_cost FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert daily_cost" ON public.daily_cost FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update daily_cost" ON public.daily_cost FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: fault_log
-- Storingsmeldingen (type + aantal per periode)
-- ----------------------------------------------------------------------------
CREATE TABLE public.fault_log (
    id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    event_time timestamptz,
    type text,
    count integer,
    created_at timestamptz DEFAULT now()
);
CREATE INDEX idx_fault_log_event_time ON public.fault_log USING btree (event_time);
ALTER TABLE public.fault_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select fault_log" ON public.fault_log FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert fault_log" ON public.fault_log FOR INSERT TO authenticated WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: overload_event_log
-- Log van overbelasting-acties (welke fase, welk apparaat uitgeschakeld, mail)
-- ----------------------------------------------------------------------------
CREATE TABLE public.overload_event_log (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_time timestamptz NOT NULL,
    phase text NOT NULL,
    watt numeric NOT NULL,
    threshold numeric NOT NULL,
    source text NOT NULL,
    action text NOT NULL,
    created_at timestamptz DEFAULT now()
);
ALTER TABLE public.overload_event_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select overload_event_log" ON public.overload_event_log FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert overload_event_log" ON public.overload_event_log FOR INSERT TO authenticated WITH CHECK (true);

-- ----------------------------------------------------------------------------
-- Tabel: email_send_log
-- Log van verstuurde waarschuwingsmails (anti-spam / geschiedenis)
-- ----------------------------------------------------------------------------
CREATE TABLE public.email_send_log (
    id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    kind text NOT NULL CHECK (kind = ANY (ARRAY['overload'::text, 'storage'::text])),
    sent_at timestamptz DEFAULT now()
);
CREATE INDEX email_send_log_sent_at_idx ON public.email_send_log USING btree (sent_at);
ALTER TABLE public.email_send_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select email_send_log" ON public.email_send_log FOR SELECT TO authenticated USING (true);

-- ----------------------------------------------------------------------------
-- Tabel: photo_meta
-- Metadata (volgorde, bijschrift, datum) bij foto's in de meterkast-fotogalerij
-- ----------------------------------------------------------------------------
CREATE TABLE public.photo_meta (
    name text PRIMARY KEY,
    sort_order integer DEFAULT 0 NOT NULL,
    caption text,
    updated_at timestamptz DEFAULT now() NOT NULL,
    taken_at timestamptz
);
ALTER TABLE public.photo_meta ENABLE ROW LEVEL SECURITY;
CREATE POLICY "authenticated can select photo_meta" ON public.photo_meta FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated can insert photo_meta" ON public.photo_meta FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated can update photo_meta" ON public.photo_meta FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "authenticated can delete photo_meta" ON public.photo_meta FOR DELETE TO authenticated USING (true);

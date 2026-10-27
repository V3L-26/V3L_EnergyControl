# Supabase backup (database-backup/)

Backup van de Supabase-database "V3L HomeWizard" die achter de V3L EnergyControl-app
zit. Niet de levende database zelf (die blijft in Supabase) - dit is een fallback
zodat je de structuur en de belangrijkste instellingen kunt teruglezen/terugzetten
als er ooit iets misgaat met het Supabase-project.

Gegenereerd: 27 oktober 2026, rechtstreeks uit de live database.

## Bestanden

- **schema.sql** - alle tabellen in het `public`-schema, inclusief kolommen,
  primary keys, indexen, Row Level Security en policies. Dit zet een leeg
  Supabase-project weer in dezelfde structuur.
- **data-backup.sql** - de inhoud van de kleine instellingen- en logtabellen:
  `app_settings`, `email_settings`, `field_locks`, `photo_meta`, `daily_cost`,
  `overload_event_log`, `email_send_log` en de laatste rij van `latest_status`.
  Voer dit pas uit **na** `schema.sql`.

## Wat er bewust NIET in zit

- **minute_log** - de per-minuut vermogenslog. Op het moment van backuppen al
  43.000+ rijen en groeit continu; niet nodig om op terug te vallen (bouwt na
  een restore gewoon weer op uit Home Assistant) en te omslachtig om als
  statisch bestand bij te houden.
- **fault_log** - had op het moment van backuppen 0 rijen.

## Terugzetten (bij een crash/leeg Supabase-project)

1. Maak een nieuw Supabase-project (of leeg het bestaande `public`-schema).
2. Voer `schema.sql` uit in de SQL-editor.
3. Voer daarna `data-backup.sql` uit.
4. Zet de API-URL en de publishable key van het (nieuwe) project in de app
   (`app_settings`/configuratie in de app zelf) en in de Home Assistant
   automatiseringen die naar Supabase pushen.

## Let op

`data-backup.sql` bevat de EmailJS-configuratie uit `email_settings`
(service-ID, template-ID en een EmailJS *public* key - bedoeld om
client-side gebruikt te worden, dus geen geheime server-sleutel). Dit is
bewust meegenomen omdat de mail-notificaties er anders na een restore niet
meer werken, maar behandel dit bestand niet als volledig publiek materiaal.

Deze backup wordt niet automatisch bijgehouden - vraag opnieuw om een
verversing als de tabelstructuur of de instellingen wezenlijk veranderen.

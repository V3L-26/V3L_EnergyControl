# V3L EnergyControl

Eigen Android-app (Capacitor/WebView) voor een HomeWizard P1-meter, met
Supabase als backend en Home Assistant als bron voor tarieven, kosten,
storingslogboek en overbelastingswaarschuwingen. Oorspronkelijk een
gerepackte versie van de V3L EnergyControl-app (`nl.v3l.homewizardclient`)
met automatische login toegevoegd; sindsdien flink uitgebreid.

> **Update (27 oktober 2026):** deze repository is gereorganiseerd tot
> alleen-app-repo (`V3L_EnergyControl`). De mappen `home-assistant/` en
> `supabase/` zijn verwijderd - de Home Assistant-automatiseringen en het
> Supabase-schema leven alleen nog in Home Assistant/Supabase zelf (en
> in de V3L EnergyControl-projectchat), niet langer als kopie in een
> GitHub-repo.

## Structuur

- `app/` - de webinhoud van de APK (`index.html`), met de changelog van de
  huidige versie

Dit is geen deploy-pipeline: wijzigingen maak je direct in `app/index.html`
en push je naar deze repo.

## Hoe de app werkt

De app (`app/index.html`) praat rechtstreeks met de P1-meter als hij op
hetzelfde netwerk zit, en valt anders terug op Supabase
(`latest_status`/`get_daily_totals`/`daily_cost`). Tarieven zijn
alleen-lezen in de app; de vaste overbelastingsdrempel staat op 5250 W.
Sinds versie 3.67 doet de app zelf geen overbelastingsmail of
storingslogboek meer - dat is uitsluitend Home Assistant, om dubbele
meldingen te voorkomen. De achtergrondlogica (Home Assistant-automatiseringen,
Supabase-schema en -functies) staat niet langer in deze repo - zie de
projectchat voor de actuele stand van zaken daarover.

## Een nieuwe APK bouwen

Er is geen geautomatiseerd buildscript in deze repository; de APK is tot nu
toe telkens handmatig gerepackt:

1. Pas `app/index.html` aan en verhoog `APP_VERSION`/`APP_UPDATED`.
2. Pak een eerdere, werkende APK uit (zip), vervang
   `assets/public/index.html`, en verwijder de oude
   handtekeningbestanden (`META-INF/*.SF`, `*.RSA`/`*.DSA`/`*.EC`,
   `MANIFEST.MF`).
3. Zip de APK opnieuw met dezelfde compressiemethoden.
4. Zipalign en onderteken met `uber-apk-signer`
   (https://github.com/patrickfav/uber-apk-signer), met een debug-keystore
   zodat de handtekening gelijk blijft aan eerdere builds - anders moet de
   vorige versie eerst van het toestel verwijderd worden voor installatie.

# OuDayas - OD_Vehiclesforjobs

<div style="margin: auto;  width: 60%; border: 3px solid #73AD21; padding: 10px;">
<a href="http://www.invite.gg/OuDayas"><img src="http://45.14.185.249/img/discordlogo.png" alt="Server discord" title="server discord" style="margin: auto; border: 30px solid #73AD21; padding: 100px; width: 10%;"></a>
</div>


## **Requirements**
 - [es_extended](https://github.com/mitlight/es_extended)

## **Installazione:**
1. Crea una cartella chiamata `[oudayas]` nella directory `resources` del tuo server
2. Scarica ed estrai il file .zip nella cartella appena creata e rimuovi dal nome `-main`
3. Inserisci nel file di avvio (solitamente un file .cfg) degli script la riga `OD_Vehiclesforjobs`

## **Guida all'utilizzo**

1. Apri il file `config.lua`
   Lì ci sono già dei preset per i lavori base già presenti come "vanilla", "bahamamas" e "tequilala"
2. Aggiungi il lavoro desiderato nella lista `Config.Joblist` come nei preset
3. Nella sezione `Misc` Configura se eliminare il veicolo tramite riconoscimento della targa con `DeleteVehByPlate` e in `Plate` configura la targa personalizzata desiderata
4. Nella sezione sottostante `Menu` configura le coordinate in `Take` dove il giocatore troverà il menu per scegliere i veicoli da prendere
5. Sempre in `Menu` configura la voce `Delete` le coordinate dove il giocatore potrà "eliminare" il veicolo
6. Nella sezione `Config.Vehicles` come nei preset configura come nell'esempio qui sotto

```
        {
            VehModel = "modello del veicolo",
            Name = "nome visualizzato nel menu",
            Pos = vector3(coordinate x, y, z),
            PrimaryColor = vector3(codice rgb colore primario),
            SecondaryColor = vector3(codice rgb colore secondario),
            Heading = "Angolo di spawn 0.0~360.0",
            Livery = numero id livrea
        }
```

## Note
Nel file `config.lua` troverai un'impostazione chiamata `Config.Debug` servirà per controllare il veicolo appena preso tramite notifica in gioco notificando:
- La quantità delle livree disponibili per il veicolo
- Il numero dell'ID della livrea configurata

Nello script viene usato il menu **RageUI** che vi è già incluso

# Synthesis

0. Entra dentro scripts
1. Modifica syn.tcl con il nome del modulo da sintetizzare
2. Lancia lo script syn.sh

Dentro la cartella syn ci sarà
1. File di log che contengono tutte le operazioni svolte (controlla qui eventuali errori)
2. una cartella results, che contiene una cartella del nome del modulo, che contiente tutti i risultati della sintesi. I più "importanti" sono la netlist, timing, area


# Switching activity

## Script "switch.sh"

1. Compili tutti i sorgenti per simulare la **netlist**
   1. Script "switch.sh" da riga 1 a riga 13
2. Fai il link della libreria (riga 16)
3. Fai il link del delay file (riga 19)
4. crei un file vcd che poi questaSim userà (riga 23)
5. Aggiungi tutti i segnali della simulazione al file appena creato
6. Converti il file vcd in file saif (che userà design compiler)

## Script "switch.tcl"

1. Leggi la netlist (riga 10)
2. Gli dici quale modulo (dovrebbero essercene due se applichi clock gating) (riga 12)
3. leggi il file dello script precedente (riga 14)
4. Clock e reports


# Clock Gating

0. Entra dentro scripts
1. Modifica syn_cg.tcl con il nome del modulo da sintetizzare
1. Lancia syn.sh con parametro "cg"
```bash
./syn.sh cg   
```



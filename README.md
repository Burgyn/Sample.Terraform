# Rozdiely Bicep vs. Terraform

…alebo čo v Bicep sa robí/funguje inak.

## Stav infraštruktúry

Terraform musí mať niekde uložený stav čo spravil a podľa neho zisťuje rozdiely.
Bicep žiaden stav nemá – pre neho je stav samotný Azure. Z toho vyplýva:

- Netreba sa o stav starať. V stave sú uložené aj citlivé veci (heslá, connection string-y atď.), takže musí byť uložený bezpečne.
- Je jednoduché dostať aktuálny stav do Bicep-u. V prípade Terraform je potrebné aktuálny stav nejak importovať do uloženého
  stavu, čo je dosť komplikované, takže v prípade veľkej existujúcej infraštruktúry sa to nerobí.
  - V prípade Bicep sa stiahne ARM šablóna, [konvertuje do Bicep](https://bicepdemo.z22.web.core.windows.net) a doladia sa detaily.
Takto je možné existujúcu infraštruktúru do zdrojov prenášať postupne.

## Deploy

Terraform používame tak, že vytvára aj samotnú resource group-u a stará sa aj o zmazanie infraštruktúry (podľa uloženého
aktuálneho stavu).

Bicep štandardne nasadzuje do existujúcej resource group-y. Je možné to asi robiť aj Terraform spôsobom, ale to by sme zrejme
ani nechceli. Keďže bokom nikde nemá uložený stav, vymazanie infraštruktúry znamená vymazanie danej resource group-y.

## Súbory, moduly

Terraform nemá žiadny *hlavný vstupný* súbor, s ktorým začína, takže berie všetky `.tf` súbory v danom adresári a spracuje ich.
Moduly sa robia ako podadresáre a opäť všetky `.tf` súbory v podadresári sú ten modul. Bicep funguje na úrovni súborov. Tzn.
má nejaký hlavný súbor, ktorým sa robí deploy. Ak to človek potrebuje rozdeliť na menšie celky, tak modul je len iný konkrétny
`.bicep` súbor. Každý súbor má svoj vlatný kontext, takže je potrebné z jedného do druhého si cez parametre prenášať dáta.

## Iné drobnosti o ktorých vieme

### Key Vault

Key vault sa *na prvú* nedá vymazať natvrdo, ale má automatický soft delete. Takže ak si človek zmaže infra a potom ju opäť
bude vytvárať, spadne mu to, že Key Vault s daným názvom už existuje (aj keď je vymazaný). Key vault sa dá vymazať natvrdo
(purge) priamo v portáli a predpokladám, že aj príkazom cez CLI (neoverené). Terraform umožňuje spraviť _purge_ pri vymazávaní
infraštruktúry, alebo obnoviť existujúci vymazaný key vault pri jej vytváraní. V Bicep o takejto možnosti (zatiaľ) nevieme.

#### Riešenie

V rámci destroy pipeline mať krok, ktorý daný key vault vymaže natvrdo.

---

### Cykly v Bicep

Cykly v Bicep neumožňujú použiť podmienku. V Terraform využívame to, že je napríklad definovaný zoznam objektov.
Tento zoznam sa prechádza takým spôsobom, že na základe podmienky sú vybraté iba niektoré prvky z neho. Bicep toto neumožňuje
(možno v budúcnosti bude), tzn. zoznam sa v cykle vždy prechádza celý taký aký je.

#### Riešenie

- Definovať si viacero zoznamov priamo v zdrojoch infraštruktúry podľa potreby.
- V rámci pipeline mať pre-proces krok. Tzn. budeme mať veci definované nejakým jednotným spôsobom a v rámci pre-proces
  kroku sa vygenerujú veci tak, aby boli dobré pre Bicep a jeho nasadenie infraštruktúry.

---

### Zapojenie do pipeline

V prípade Terraformu používame oficiálny task `TerraformTaskV1` (ale zrejme nič by nám nebránilo používať priamo CLI).
Bicep sa pužíva priamo buď cez [Azure CLI](docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows),
alebo [Azure Powershell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-5.8.0).

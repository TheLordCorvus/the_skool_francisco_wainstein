# the_skool_francisco_wainstein
SQL lab repository

# The Skool

Detta arbete gör en analys av MYH:s ansökningsresultat för att hjälpa The Skool att få en idé 
över vilka utbildningar och utbildningsområden som är värda att ansöka och bedriva.

## Innehåll
Mappar / Directories:

sql_scripts: 
Innehåller de scripter skapade för att få filtrera och få fram data

Docs: 
Innehåller textfil med de relevanta filtreringar som kan vara mer intressanta 
för stakeholders av The Skool.

Images:
Screenshots över arbetet som assets

## Uppgift 0
Setup av Repo, .gitignore, uppladdning av xlsx till csv, och skapelse av sql script mapp. CSV filen finns i script mappen.

:link:[Github Repository](https://github.com/TheLordCorvus/the_skool_francisco_wainstein)

:file_folder:[SQL script Directory](/sql_scripts)


## Uppgift 1

Grundläggande EDA för att svara på frågor a-i om bl.a. ansökingar per beslut, område, län

:scroll:[fundamental_EDA.sql](sql_scripts/1_fundamental_EDA.sql)

## Uppgift 2

Under intervju med stakeholders The Skool togs antekningar för att få fram listan med det som intressenten söker efter och därmed skapa en stakeholder requirements. 
Mapp med listan finns i :file_folder:[Documents](/Documents)

:memo:[Stakeholder Requirements](/Documents/02_stakeholder_requirements.md)

## Uppgift 3

Utifrån stakeholder intervju skapas en ny script med 3-6 nya frågor. Valt att använda från stakeholder requirements för dessa.

:scroll:[datadriven decision](sql_scripts/3_datadrivna_beslut)

## Uppgift 4

Till uppgift 4 skapades tre nya sql scripter.

- Create_table :scroll:[4a_create_table.sql](sql_scripts/4a_create_tables.sql)
- Insert_data ;scroll:[4b_Insert_data.sql](sql_scripts/4b_insert_data.sql)
- Queries :scroll:[4c_queries.sql](sql_scripts/4c_queries.sql)

Efter skapandet och inläggning av data från application_round --> nya datamodellen, testades
scripten med samma frågor från uppgift 1 och gav ut samma resultat.


## Uppgift 5

All dokumentation finns tillgänglit här, men med detta följer en mapp med screenshots på arbetets gång som visar både query och resultat.

:file_folder:[Screenshots](/Images)


Uppgift 6

:link:[Youtube video presentation](https://youtu.be/HyP2knccc0c)

:bar_chart:[PowerPoint presentation](DBAD26-SQL1-Francisco_Wainstein_Labb_The_Skool.pdf)


## LLM
- Användning av LLM - Claude AI för att fixa några problem som uppstod vid setup.
- Användning av LLM - Claude AI för felsökning och justering av scripts.

## Källor

:link:[Myh - resultat för senaste ansökningsomgång](https://www.myh.se/yrkeshogskolan/resultat-ansokningsomgangar/resultat-for-program)

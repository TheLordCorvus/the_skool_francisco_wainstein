import csv

cols = ["utbildningsomrade", "sun5_inriktning", "sun5_inriktning_namn", "utbildningsnamn", "beslut", "diarienummer", "flera_kommuner", "antal_kommuner", "lan", "kommun", "yh_poang","studieform", "studietakt_procent", "examenstyp", "seqf_niva", "smalt_yrkesomrade", "anordnare_admin_enhet", "huvudmannatyp", "sokta_omgangar", "beviljade_omgangar", "sokta_platser_per_omgang", "sokta_platser_totalt", "beviljade_platser_omgang1", "beviljade_platser_omgang2", "beviljade_platser_omgang3", "beviljade_platser_omgang4", "beviljade_platser_omgang5", "beviljade_platser_totalt"]

with open("resultat-ansokningsomgang-2025.csv", encoding="utf-8-sig", newline="") as f:
    rows = list(csv.reader(f, delimiter=";"))

start = next(i for i, r in enumerate(rows) if r and r[0].strip() == "Utbildningsområde")
data = [r[:28] for r in rows[start + 1:] if r and r[0].strip()]

with open("Ansokningar.csv", "w", encoding="utf-8", newline="") as f:
    w = csv.writer(f)
    w.writerow(cols)
    w.writerows(data)

print(len(data), "Datafiles")

import csv

cols = ["utbildningsomrade", "sun5_kod", "sun5_namn", "utbildningsnamn", "beslut",
        "diarienummer", "flera_kommuner", "antal_kommuner", "lan", "kommun", "yh_poang",
        "studieform", "studietakt_procent", "examenstyp", "seqf_niva", "smalt_yrkesomrade",
        "anordnare", "huvudmannatyp", "sokta_omgangar", "beviljade_omgangar",
        "sokta_platser_per_omgang", "sokta_platser_totalt", "bev_platser_omgang1",
        "bev_platser_omgang2", "bev_platser_omgang3", "bev_platser_omgang4",
        "bev_platser_omgang5", "bev_platser_totalt"]

with open("resultat-ansokningsomgang-2025.csv", encoding="utf-8-sig", newline="") as f:
    rows = list(csv.reader(f, delimiter=";"))

start = next(i for i, r in enumerate(rows) if r and r[0].strip() == "Utbildningsområde")
data = [r[:28] for r in rows[start + 1:] if r and r[0].strip()]

with open("Ansokningar.csv", "w", encoding="utf-8", newline="") as f:
    w = csv.writer(f)
    w.writerow(cols)
    w.writerows(data)

print(len(data), "filas de datos")

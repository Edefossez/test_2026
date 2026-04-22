# ============================================================
# SCRIPT COMPLET DE DEPLOIEMENT SUR shinyapps.io
# ------------------------------------------------------------
# AVANT DE LANCER CE SCRIPT :
# 1) créer un compte sur https://www.shinyapps.io/
# 2) récupérer name / token / secret
# 3) remplacer les valeurs ci-dessous
# 4) adapter APP_DIR au dossier contenant app.R
# ============================================================

if (!requireNamespace("rsconnect", quietly = TRUE)) {
  install.packages("rsconnect")
}

library(rsconnect)

# ------------------------------------------------------------
# 1) PARAMETRES A REMPLIR
# ------------------------------------------------------------
ACCOUNT_NAME <- "VOTRE_NOM_DE_COMPTE"
ACCOUNT_TOKEN <- "VOTRE_TOKEN"
ACCOUNT_SECRET <- "VOTRE_SECRET"

# Dossier qui contient app.R
APP_DIR <- "."

# Nom public de l'application sur shinyapps.io
APP_NAME <- "biodiversite-locale"

# ------------------------------------------------------------
# 2) ENREGISTRER LE COMPTE
# ------------------------------------------------------------
rsconnect::setAccountInfo(
  name = ACCOUNT_NAME,
  token = ACCOUNT_TOKEN,
  secret = ACCOUNT_SECRET
)

# ------------------------------------------------------------
# 3) VERIFICATION RAPIDE
# ------------------------------------------------------------
if (!file.exists(file.path(APP_DIR, "app.R"))) {
  stop("Le fichier app.R est introuvable dans APP_DIR.")
}

message("Compte enregistré.")
message("Dossier de l'app : ", normalizePath(APP_DIR))
message("Nom de l'app : ", APP_NAME)

# ------------------------------------------------------------
# 4) DEPLOIEMENT
# ------------------------------------------------------------
rsconnect::deployApp(
  appDir = APP_DIR,
  appName = APP_NAME,
  launch.browser = TRUE,
  forceUpdate = TRUE
)

# ------------------------------------------------------------
# 5) NOTE
# ------------------------------------------------------------
# Pour mettre à jour l'app plus tard, relancez simplement ce script.

Hvordan bruke løsningen
Forutsetninger
Azure Konto: Sørg for at du har en Azure-konto og at du har konfigurert nødvendige tillatelser.
Terraform: Terraform er nødvendig for å administrere infrastrukturen. Versjon 4.3.0 brukes i dette prosjektet.
GitHub Secrets: Du må konfigurere flere hemmeligheter i GitHub for å kunne bruke Azure API-et sikkert i CI/CD-pipeline:
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
GitHub Actions Arbeidsflyt
Løsningen bruker GitHub Actions til å kjøre Terraform-kommandoene på skyen. Den er konfigurert til å kjøre på push til main-grenen og implementerer en arbeidsflyt som består av tre miljøer:

Dev: Distribuerer infrastrukturen til utviklingsmiljøet.
Staging: Distribuerer infrastrukturen til staging-miljøet.
Prod: Distribuerer infrastrukturen til produksjonsmiljøet etter at en godkjenning er utført.
Terraform Workspaces
Terraform workspaces brukes til å isolere ulike miljøer (Dev, Staging, Prod). Workspaces gjør det mulig å bruke én Terraform-konfigurasjon for å administrere flere miljøer.

GitHub Secrets
Sørg for at du har konfigurert nødvendige secrets i GitHub for å sikre at Terraform kan autentisere mot Azure:

AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
Disse legges til i GitHub under prosjektets Settings -> Secrets.
Trinn-for-trinn Bruk
Oppsett:

Legg til terraform.tfvars.dev, terraform.tfvars.staging, og terraform.tfvars.prod filer i deployments-mappen. Hver av disse filene inneholder miljøspesifikke variabler, for eksempel ressursgrupper, nettverksinnstillinger, eller andre spesifikasjoner.
Opprett en Pull Request (PR):

Når du gjør endringer i Terraform-konfigurasjonene, opprett en PR til main-grenen. Dette vil trigge GitHub Actions arbeidsflyten for å distribuere til de respektive miljøene.
GitHub Actions Arbeidsflyt:

Arbeidsflyten er delt inn i tre jobber:
Deploy to Dev: Kjør terraform apply i dev workspace, med verdiene fra terraform.tfvars.dev.
Deploy to Staging: Kjør terraform apply i staging workspace, med verdiene fra terraform.tfvars.staging.
Deploy to Prod: Kjør terraform apply i prod workspace, med verdiene fra terraform.tfvars.prod. Denne jobben krever manuell godkjenning før den utføres.
Arbeidsflyten:

Når du pusher til main-grenen, vil GitHub Actions automatisk starte arbeidsflyten for å distribuere til de forskjellige miljøene.
Prod-miljøet krever en godkjenning via GitHub, som kan gjøres av en ansvarlig person før infrastrukturen blir distribuert.
Slik fungerer arbeidsflyten:
Dev & Staging: Når du pusher endringer til main, vil Terraform automatisk distribuere til dev og staging-miljøene.
Prod: Før produksjonsdistribusjonen kan gjennomføres, må endringen godkjennes via GitHub-PR-godkjenning. Etter godkjenning vil Terraform distribuere til prod.


Når du kjører terraform apply kan du velge hvilket workspace du vil arbeide i med kommandoene under.
terraform apply -var-file="terraform.tfvars.dev"
terraform apply -var-file="terraform.tfvars.prod"
terraform apply -var-file="terraform.tfvars.staging"

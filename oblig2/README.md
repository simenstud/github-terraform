# Azure Terraform Infrastructure Deployment

Dette prosjektet bruker Terraform til å automatisere distribusjonen av infrastruktur på Microsoft Azure, med integrasjon i GitHub Actions for kontinuerlig distribusjon (CD). Arbeidsflytene sørger for at infrastrukturen rulles ut til ulike miljøer som `dev`, `staging`, og `prod`, med passende arbeidsområder (workspaces) og konfigurasjoner.

## Forutsetninger

1. **Azure Konto**  
   Sørg for at du har en Azure-konto og at du har konfigurert nødvendige tillatelser.

2. **Terraform**  
   Terraform er nødvendig for å administrere infrastrukturen. Versjon 4.3.0 brukes i dette prosjektet.

3. **GitHub Secrets**  
   Du må konfigurere flere hemmeligheter i GitHub for å kunne bruke Azure API-et sikkert i CI/CD-pipeline:

   - `AZURE_CLIENT_ID`
   - `AZURE_CLIENT_SECRET`
   - `AZURE_SUBSCRIPTION_ID`
   - `AZURE_TENANT_ID`

   Disse legges til i GitHub under prosjektets **Settings** -> **Secrets**.

## GitHub Actions Arbeidsflyt

Løsningen bruker GitHub Actions til å kjøre Terraform-kommandoene på skyen. Den er konfigurert til å kjøre på `push` til `main`-grenen og implementerer en arbeidsflyt som består av tre miljøer:

- **Dev**: Distribuerer infrastrukturen til utviklingsmiljøet.
- **Staging**: Distribuerer infrastrukturen til staging-miljøet.
- **Prod**: Distribuerer infrastrukturen til produksjonsmiljøet etter at en godkjenning er utført.

## Terraform Workspaces

Terraform workspaces brukes til å isolere ulike miljøer (Dev, Staging, Prod). Workspaces gjør det mulig å bruke én Terraform-konfigurasjon for å administrere flere miljøer.

## Trinn-for-trinn Bruk

### Oppsett

1. Legg til `terraform.tfvars.dev`, `terraform.tfvars.staging`, og `terraform.tfvars.prod` filer i `deployments`-mappen. Hver av disse filene inneholder miljøspesifikke variabler, for eksempel ressursgrupper, nettverksinnstillinger, eller andre spesifikasjoner.

### Opprett en Pull Request (PR)

1. Når du gjør endringer i Terraform-konfigurasjonene, opprett en PR til `main`-grenen. Dette vil trigge GitHub Actions arbeidsflyten for å distribuere til de respektive miljøene.

### GitHub Actions Arbeidsflyt

Arbeidsflyten er delt inn i tre jobber:

- **Deploy to Dev**: Kjør `terraform apply` i `dev` workspace, med verdiene fra `terraform.tfvars.dev`.
- **Deploy to Staging**: Kjør `terraform apply` i `staging` workspace, med verdiene fra `terraform.tfvars.staging`.
- **Deploy to Prod**: Kjør `terraform apply` i `prod` workspace, med verdiene fra `terraform.tfvars.prod`. Denne jobben krever manuell godkjenning før den utføres.

### Arbeidsflyten

1. Når du pusher til `main`-grenen, vil GitHub Actions automatisk starte arbeidsflyten for å distribuere til de forskjellige miljøene.
2. **Prod-miljøet** krever en godkjenning via GitHub, som kan gjøres av en ansvarlig person før infrastrukturen blir distribuert.

### Slik fungerer arbeidsflyten

1. **Dev & Staging**: Når du pusher endringer til `main`, vil Terraform automatisk distribuere til `dev` og `staging`-miljøene.
2. **Prod**: Før produksjonsdistribusjonen kan gjennomføres, må endringen godkjennes via GitHub-PR-godkjenning. Etter godkjenning vil Terraform distribuere til `prod`.

## Hvordan velge Workspace

Når du kjører `terraform apply`, kan du velge hvilket workspace du vil arbeide i med kommandoene under:

```bash
terraform apply -var-file="terraform.tfvars.dev"
terraform apply -var-file="terraform.tfvars.prod"
terraform apply -var-file="terraform.tfvars.staging"

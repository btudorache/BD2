Instructiuni de deployment local. Setup-ul foloseste o imagine de docker de Oracle Database Enterprise Edition

1. Login la registry-ul Docker Oracle
docker login container-registry.oracle.com

2. Descarcati imaginea:
docker pull container-registry.oracle.com/database/express:latest

3. Rulati container-ul pe baza imagini (din folder-ul cu proiectul):
docker run -d --name my-oracle-db -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=pass1234 -v $PWD/scripts:/docker-entrypoint-initdb.d container-registry.oracle.com/database/express:latest

4. Daca nu se ruleaza script-urile initiale, trebuie incarcate de mana:
docker exec -it my-oracle-db sqlplus system/pass1234@XE
dupa care:
@/opt/oracle/scripts/01_tables.sql
@/opt/oracle/scripts/02_reports.sql
mkdir -p /fmp
cp -rf ../fmp-web /fmp/
cp -rf ../fmp-pmc /fmp/
cp -rf ./*.yml /fmp/
cd /fmp
docker-compose -f /fmp/docker-compose-dsc.yml up -d
docker-compose -f /fmp/docker-compose-msa.yml up -d
docker-compose -f /fmp/docker-compose-pmc.yml up -d
docker-compose -f /fmp/docker-compose-web.yml up -d

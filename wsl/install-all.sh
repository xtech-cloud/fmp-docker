mkdir -p /fmp
cp -rf ../fmp-web /fmp/
cp -rf ../fmp-pmc /fmp/
docker-compose -f ./docker-compose-dsc.yml -p fmp up -d
docker-compose -f ./docker-compose-msa.yml -p fmp up -d
docker-compose -f ./docker-compose-pmc.yml -p fmp up -d
docker-compose -f ./docker-compose-web.yml -p fmp up -d

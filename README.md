# platanus-challenge

## Instrucciones

* `touch .env`
* `docker-compose build`
* `docker-compose run --rm web bundle install`
* `docker-compose run --rm web yarn install`
* `docker-compose run --rm web rails db:create db:schema:load`
* `docker-compose up -d`
* Abrir `localhost:3000` en cualquier navegador

## Notas

* El monto de la transacción se calculó como el precio pagado independiente de la cantidad de divisa comprada
* Mediante la ruta `https://www.buda.com/api/v2/markets/<market_id>/trades` solo se pueden conseguir 100 transacciones como máximo, por lo que la transacción de mayor monto se hace entre las 100 transacciones más recientes que se hayan realizado hace menos de 24hrs
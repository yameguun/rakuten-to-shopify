# README

Move the three files output from Rakuten

`dl-item-cat.csv` `dl-item.csv` `dl-select.csv`

move to `/db/csv/`

```
docker-compose run web rake item:import
docker-compose run web rake option:import
docker-compose run web rake category:import
docker-compose run web rake create_csv:export
```
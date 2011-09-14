#TERC parser

Gem składa się praktycznie z jednej metody: `parse_terc`. Po jej wywołaniu, opcjonalnie podając jako argument ścieźkę do pliku `TERC.xml`, zwróci ona hash zawierający cztery klucze:

* **:stan_na** - zawiera datę (jako string) utworzenia pliku `TERC.xml`
* **:wojewodztwa** - zawiera tablice hashy, każdy hash zawiera informacje o jednym województwie
* **:powiaty** - jw. ale dane o powiatach
* **:gminy** - jw. ale dane o gminach

Aktualny plik `TERC.xml` można pobrać ze strony GUSu:
http://www.stat.gov.pl/broker/access/prefile/listPreFiles.jspa

Plik `TERC.xml` jest cyfrową wersją [rejestru identyfikatorów i nazw jednostek podziału administracyjnego Polski](http://pl.wikipedia.org/wiki/TERC) udostępnionym przez [GUS](http://pl.wikipedia.org/wiki/GUS) i jest częścią rejestru [TERYT](http://pl.wikipedia.org/wiki/TERYT).

## Instalacja

``` bash
gem install terc_parser
```

## Przykład

Wynik działania:

``` bash
STAN NA: 2011-01-01
-------- WOJEWODZTWA (16) ---------
2 - dolnośląskie
4 - kujawsko-pomorskie
6 - lubelskie
8 - lubuskie
10 - łódzkie
12 - małopolskie
14 - mazowieckie
16 - opolskie
18 - podkarpackie
20 - podlaskie
22 - pomorskie
24 - śląskie
26 - świętokrzyskie
28 - warmińsko-mazurskie
30 - wielkopolskie
32 - zachodniopomorskie
-------- POWIATY (379) -------------
-------- GMINY (2479) -------------
```

Kod:

``` ruby
#encoding: utf-8
require "terc_parser"

terc = parse_terc

puts "STAN NA: #{terc[:stan_na]}"

puts "-------- WOJEWODZTWA (#{terc[:wojewodztwa].count}) ---------"
terc[:wojewodztwa].each do |w|
	puts "#{w[:id]} - #{w[:name]}"
end

puts "-------- POWIATY (#{terc[:powiaty].count}) -------------"
terc[:powiaty].each do |p|
	#puts "#{p[:id]} - #{p[:woj_id]} - #{p[:name]}"
end

puts "-------- GMINY (#{terc[:gminy].count}) -------------"
terc[:gminy].each do |g|
	#puts "#{g[:id]} - #{g[:woj_id]} - #{g[:pow_id]} - #{g[:name]}"
end

```

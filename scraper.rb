#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
names = WikiData::Category.new( 'Категорија:Пратенички состав 2011-2014', 'mk').member_titles |
        WikiData::Category.new( 'Категорија:Пратенички состав 2014-2016', 'mk').member_titles

sparq = 'SELECT ?item WHERE { ?item wdt:P39 wd:Q20015949 . }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { mk: names })

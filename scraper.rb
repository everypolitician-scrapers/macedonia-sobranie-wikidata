#!/bin/env ruby
# frozen_string_literal: true

require 'wikidata/fetcher'
mk_names = WikiData::Category.new('Категорија:Пратенички состав 2011-2014', 'mk').member_titles |
           WikiData::Category.new('Категорија:Пратенички состав 2014-2016', 'mk').member_titles |
           WikiData::Category.new('Категорија:Пратенички состав 2016-2020', 'mk').member_titles

sq_names = WikiData::Category.new('Kategoria:Anëtarë të Kuvendit të Republikës së Maqedonisë', 'sq').member_titles

sparq = 'SELECT ?item WHERE { ?item wdt:P39 wd:Q20015949 }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { mk: mk_names, sq: sq_names })

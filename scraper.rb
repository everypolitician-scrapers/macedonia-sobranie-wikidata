#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
names = WikiData::Category.new( 'Категорија:Пратенички состав 2011-2015', 'mk').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { mk: names }, output: false)


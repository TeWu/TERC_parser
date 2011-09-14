#encoding: utf-8
require "nokogiri"
require 'active_support/all'

def process_xml(file_name, &block)
  f   = File.open(file_name)
  doc = Nokogiri::XML(f) { |config| config.strict }
  yield doc
  f.close
end

def parse_terc(terc_file_name = "TERC.xml")
  stan_na = wojewodztwa = powiaty = gminy = nil

  process_xml "TERC.xml" do |doc|
    stan_na             = doc.xpath("/teryt/catalog/@date")

    ### WOJEWODZTWA ## ----------------------------------
    wojewodztwa_nodeset = doc.xpath("//col[@name='NAZDOD' and text()='województwo']/..")

    wojewodztwa     = wojewodztwa_nodeset.map do |woj|
      id   = woj.xpath("col[@name = 'WOJ']").text.to_i
      name = woj.xpath("col[@name = 'NAZWA']/text()").text.mb_chars.downcase
      {id: id, name: name}
    end

    ### POWIATY ## --------------------------------------
    powiaty_nodeset = doc.xpath("//col[@name='NAZDOD' and contains(text(),'powiat')]/..")

    powiaty       = powiaty_nodeset.map do |woj|
      id     = woj.xpath("col[@name = 'POW']").text.to_i
      woj_id = woj.xpath("col[@name = 'WOJ']").text.to_i
      name   = woj.xpath("col[@name = 'NAZWA']/text()").text.mb_chars.downcase
      {id: id, woj_id: woj_id, name: name}
    end

    ### GMINY ## --------------------------------------
    gminy_nodeset = doc.xpath("//col[@name='NAZDOD' and contains(text(),'gmina')]/..")

    gminy = gminy_nodeset.map do |woj|
      id     = woj.xpath("col[@name = 'GMI']").text.to_i
      woj_id = woj.xpath("col[@name = 'WOJ']").text.to_i
      pow_id = woj.xpath("col[@name = 'POW']").text.to_i
      name   = woj.xpath("col[@name = 'NAZWA']/text()").text.mb_chars.downcase
      {id: id, woj_id: woj_id, pow_id: pow_id, name: name}
    end
  end

  return {stan_na: stan_na, wojewodztwa: wojewodztwa, powiaty: powiaty, gminy: gminy}
end


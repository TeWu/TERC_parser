#encoding: utf-8
require 'spec_helper'

TERC_XML_FILE_PATH = File.expand_path('../../../vendor/TERC.xml', __FILE__)

describe TercParser do
  let(:terc) { TercParser::parse_terc TERC_XML_FILE_PATH }

  it "should collect correct amount of województwo, powiat and gmina" do
    terc[:wojewodztwa].count.should == 16
    terc[:powiaty].count.should == 379
    terc[:gminy].count.should == 2479
  end
end

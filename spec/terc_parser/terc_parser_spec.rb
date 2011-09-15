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

  it "should collect data that are correct type" do
    terc.class.should == Hash
    terc[:stan_na].class.should == String

    terc[:wojewodztwa].class.should == Array
    terc[:wojewodztwa][0][:id].class.should == Fixnum
    terc[:wojewodztwa][0][:name].class.should == String

    terc[:powiaty].class.should == Array
    terc[:powiaty][0][:id].class.should == Fixnum
    terc[:powiaty][0][:woj_id].class.should == Fixnum
    terc[:powiaty][0][:name].class.should == String

    terc[:gminy].class.should == Array
    terc[:gminy][0][:id].class.should == Fixnum
    terc[:gminy][0][:woj_id].class.should == Fixnum
    terc[:gminy][0][:pow_id].class.should == Fixnum
    terc[:gminy][0][:name].class.should == String
  end
end

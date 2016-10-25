#encoding: utf-8
require 'spec_helper'

TERC_XML_FILE_PATH = File.expand_path('../../../vendor/TERC.xml', __FILE__)

describe TercParser do
  let(:terc) { TercParser::parse_terc TERC_XML_FILE_PATH }

  it "should collect data that are correct type" do
    terc.should be_instance_of Hash
    terc[:stan_na].class.should == String

    terc[:wojewodztwa].should be_instance_of Array
    terc[:wojewodztwa][0][:id].should be_instance_of Fixnum
    terc[:wojewodztwa][0][:name].should be_instance_of String

    terc[:powiaty].should be_instance_of Array
    terc[:powiaty][0][:id].should be_instance_of Fixnum
    terc[:powiaty][0][:woj_id].should be_instance_of Fixnum
    terc[:powiaty][0][:name].should be_instance_of String

    terc[:gminy].should be_instance_of Array
    terc[:gminy][0][:id].should be_instance_of Fixnum
    terc[:gminy][0][:woj_id].should be_instance_of Fixnum
    terc[:gminy][0][:pow_id].should be_instance_of Fixnum
    terc[:gminy][0][:name].should be_instance_of String
  end
end

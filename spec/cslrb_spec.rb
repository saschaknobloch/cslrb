# frozen_string_literal: true

require 'cslrb'
require 'json'

RSpec.describe Cslrb do
  describe '.from_hex' do
    context 'given a valid hex string' do
      let(:expected_result) do
        {
          "inputs" => [{
            "transaction_id" => "f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c3476e9cc",
            "index" => 1
          }],
          "outputs" => [
            {
              "address" => "addr1qy98hjpf8tjsm462uwvmyc2yd2llyw8203ty44f22gtguzuvve3lrkxpnwspfnmn2us8j3k4gucly566apeqcenumw7q0j692c",
              "amount" => {
                "coin" => "1000000",
                "multiasset" => nil
              },
              "plutus_data" => nil,
              "script_ref" => nil
            },
            {
              "address" => "addr1q9mejt48u26rf02t4yhrkty4jtqgqkj92tsa9wm606w8y66t8lmxqnjcxgxcgx4r4ak54j54sw7nws0vjdgcm9e6fx8qv8utpq",
              "amount" => {
                "coin" => "35940531",
                "multiasset" => nil
              },
              "plutus_data" => nil,
              "script_ref" => nil
            }
          ],
          "fee" => "168317",
          "ttl" => "97670964",
          "certs" => nil,
          "withdrawals" => nil,
          "update" => nil,
          "auxiliary_data_hash" => nil,
          "validity_start_interval" => nil,
          "mint" => nil,
          "script_data_hash" => nil,
          "collateral" => nil,
          "required_signers" => nil,
          "network_id" => nil,
          "collateral_return" => nil,
          "total_collateral" => nil,
          "reference_inputs" => nil,
          "voting_procedures" => nil,
          "voting_proposals" => nil,
          "donation" => nil,
          "current_treasury_value" => nil
        }
      end

      let(:cbor_hex) do
        [
          "84a40081825820f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c",
          "3476e9cc010182825839010a7bc8293ae50dd74ae399b261446abff238ea7c564ad52a",
          "52168e0b8c6663f1d8c19ba014cf7357207946d54731f2535ae8720c667cdbbc1a000f",
          "42408258390177992ea7e2b434bd4ba92e3b2c9592c0805a4552e1d2bb7a7e9c726b4b",
          "3ff6604e58320d841aa3af6d4aca9583bd3741ec93518d973a498e1a022468b3021a00",
          "02917d031a05d25734a10081825820e41c3c43e11599b056d0de12a55ef49346bb941f",
          "cafef7aad08a7b3361b4ccf55840b1fb566bacc3c5f97748dd281f65abec51c64814c2",
          "89ddcd2792e094091750755542ef4cea7d423a09066486fb2ce185da6fef380dbf65fc",
          "adb9bda6c697d701f5f6"
        ].join
      end

      it 'returns the transaction body as JSON' do
        json = Cslrb.tx_body_from_hex(cbor_hex)
        expect(JSON.parse(json)).to eq(expected_result)
      end
    end

    context 'given an invalid hex string' do
      let(:cbor_hex) { 'invalid' }

      it 'raises an error' do
        skip 'TODO: implement this test'
      end
    end
  end

  describe '.metadata_from_output_datum' do
    context 'given a valid hex string' do
      let(:expected_result) do
        { 'constructor' => 0,
          'fields' =>
         [{ 'image' => 'ipfs://bafkreiex4kveev4y6czhdza5vpwz4sud7azluksqegufpvn7bax6offlle',
            'name' => 'SpaceBud #7243',
            'sha256' => '0x97e2aa425798f0b271e41dabed9e4a83f832ba2a5021a857d5bf082fe714ab59',
            'traits' => ['Star Suit', 'Belt', 'Wool Boots', 'Jo-Jo'],
            'type' => 'Tiger' },
          1,
          { 'constructor' => 0, 'fields' => [] }] }
      end

      let(:cbor_hex) do
        [
          "d8799fac444261636b4653706972616c44426f6479484e6f726d616c5f32446e616d65",
          "51546970737920547572746c657320233130454d6f7574684b4472756e6b5f64726f6f",
          "6c4566696c65739fa3437372635835697066733a2f2f516d57353959364e6a4d55484a",
          "39716932454a3139664c3370624c335268636b426f4c6b324a415a51355646356f446e",
          "616d6551546970737920547572746c657320233130496d656469615479706549696d61",
          "67652f706e67ff45696d6167655835697066733a2f2f516d57353959364e6a4d55484a",
          "39716932454a3139664c3370624c335268636b426f4c6b324a415a51355646356f4743",
          "6c6f74686573464a756d70657247457965776561724c556e696e746572657374656447",
          "4a6577656c72794a4e6f5f4a6577656c7279484865616477656172464e6f726d616c49",
          "6d656469615479706549696d6167652f706e674a4261636b67726f756e644659656c6c",
          "6f7701d8799f581cf4a5f8885e9a8f1ead1577c4364ece1c177ead58b9bb7ebb41fe8",
          "af74e5469707379547572746c65733130d87a9fffd87a9fffffff"
        ].join
      end

      it 'returns the metadata JSON' do
        json = Cslrb.metadata_from_output_datum(cbor_hex)
        puts JSON.parse(json)
        expect(JSON.parse(json)).to eq(expected_result)
      end
    end

    context 'given an invalid hex string' do
      let(:cbor_hex) { 'invalid' }

      it 'raises an error' do
        skip 'TODO: implement this test'
      end
    end
  end
end

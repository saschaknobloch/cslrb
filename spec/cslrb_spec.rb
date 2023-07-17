# frozen_string_literal: true

require 'cslrb'
require 'json'

RSpec.describe Cslrb do
  describe '.from_hex' do
    context 'given a valid hex string' do
      let(:expected_result) do
        { 'inputs' => [{ 'transaction_id' => 'f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c3476e9cc', 'index' => 1 }],
          'outputs' =>
         [{ 'address' => 'addr1qy98hjpf8tjsm462uwvmyc2yd2llyw8203ty44f22gtguzuvve3lrkxpnwspfnmn2us8j3k4gucly566apeqcenumw7q0j692c',
            'amount' => { 'coin' => '1000000', 'multiasset' => nil },
            'plutus_data' => nil,
            'script_ref' => nil },
          { 'address' => 'addr1q9mejt48u26rf02t4yhrkty4jtqgqkj92tsa9wm606w8y66t8lmxqnjcxgxcgx4r4ak54j54sw7nws0vjdgcm9e6fx8qv8utpq',
            'amount' => { 'coin' => '35940531', 'multiasset' => nil },
            'plutus_data' => nil,
            'script_ref' => nil }],
          'fee' => '168317',
          'ttl' => '97670964',
          'certs' => nil,
          'withdrawals' => nil,
          'update' => nil,
          'auxiliary_data_hash' => nil,
          'validity_start_interval' => nil,
          'mint' => nil,
          'script_data_hash' => nil,
          'collateral' => nil,
          'required_signers' => nil,
          'network_id' => nil,
          'collateral_return' => nil,
          'total_collateral' => nil,
          'reference_inputs' => nil }
      end

      let(:cbor_hex) do
        '84a40081825820f97da637cc2e8b5b970b1952bcdc62422e82873bb0503a75ab70ed3c3476e9cc' \
        '010182825839010a7bc8293ae50dd74ae399b261446abff238ea7c564ad52a52168e0b8c6663f1' \
        'd8c19ba014cf7357207946d54731f2535ae8720c667cdbbc1a000f42408258390177992ea7e2b4' \
        '34bd4ba92e3b2c9592c0805a4552e1d2bb7a7e9c726b4b3ff6604e58320d841aa3af6d4aca9583' \
        'bd3741ec93518d973a498e1a022468b3021a0002917d031a05d25734a10081825820e41c3c43e1' \
        '1599b056d0de12a55ef49346bb941fcafef7aad08a7b3361b4ccf55840b1fb566bacc3c5f97748' \
        'dd281f65abec51c64814c289ddcd2792e094091750755542ef4cea7d423a09066486fb2ce185da' \
        '6fef380dbf65fcadb9bda6c697d701f5f6'
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
end

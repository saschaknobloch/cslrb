#[macro_use]
extern crate rutie;

use cardano_serialization_lib::{Transaction};
use cardano_serialization_lib::plutus::{PlutusData, PlutusDatumSchema};
use rutie::{Module, Object, RString, VM};

module!(Cslrb);

methods!(
    Cslrb,
    _itself,
    fn tx_body_from_hex(cbor_hex: RString) -> RString {
        let ruby_string = cbor_hex.map_err(|e| VM::raise_ex(e) ).unwrap();
        let transaction = Transaction::from_hex(&ruby_string.to_string()).unwrap();
        let transaction_body = transaction.body();

        match transaction_body.to_json() {
            Ok(json_string) => return RString::new_utf8(&json_string),
            Err(err) => return RString::new_utf8(&format!("Error: {}", err)),
        }
    },
    fn metadata_from_output_datum(cbor_hex: RString) -> RString {
        let ruby_string = cbor_hex.map_err(|e| VM::raise_ex(e) ).unwrap();
        let metadata = PlutusData::from_hex(&ruby_string.to_string()).unwrap();
        let schema = PlutusDatumSchema::BasicConversions;

        match metadata.to_json(schema) {
            Ok(json_string) => return RString::new_utf8(&json_string),
            Err(err) => return RString::new_utf8(&format!("Error: {}", err)),
        }
    }
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_cslrb() {
    Module::from_existing("Cslrb").define(|itself| {
        itself.def_self("tx_body_from_hex", tx_body_from_hex);
        itself.def_self("metadata_from_output_datum", metadata_from_output_datum);
    });
}

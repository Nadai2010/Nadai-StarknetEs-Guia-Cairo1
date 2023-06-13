use starknet::ContractAddress;

#[abi]
trait IPragmaOracle {
    fn get_spot_median(pair_id: felt252) -> (felt252, felt252, felt252, felt252);
}

#[contract]
mod PriceFeed {
    use starknet::ContractAddress;
    use super::IPragmaOracleDispatcher;
    use super::IPragmaOracleDispatcherTrait;

    struct Storage {
        _pragma_address: ContractAddress,
        _key_pair: felt252
    }

    #[constructor]
    fn constructor(pragma_address: ContractAddress, key_pair: felt252) {
        _pragma_address::write(pragma_address);
        _key_pair::write(key_pair);
    }

    #[view]
    fn view_price_btc_usd() -> felt252 {
        let _pragma_oracle = IPragmaOracleDispatcher { contract_address: _pragma_address::read() };
        let (eth_price, decimals, timestamp, num_sources) = _pragma_oracle.get_spot_median(
            _key_pair::read()
        );

        eth_price
    }
}
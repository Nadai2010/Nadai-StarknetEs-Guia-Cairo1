#[contract]

mod ENS {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    struct Storage {
        names: LegacyMap::<ContractAddress, felt252>,
    }

    #[event]
    fn NombreAlmacenado(caller: ContractAddress, name: felt252) {}

    #[constructor]
    fn constructor(_name: felt252) {
        let caller = get_caller_address();
        names::write(caller, _name);
        NombreAlmacenado(caller, _name);
        return ();
    }

    #[external]
    fn almacenar_nombre(_name: felt252) {
        let caller = get_caller_address();
        names::write(caller, _name);
        NombreAlmacenado(caller, _name);
        return ();
    }

    #[view]
    fn obtener_nombre(_address: ContractAddress) -> felt252 {
        names::read(_address)
    }
}

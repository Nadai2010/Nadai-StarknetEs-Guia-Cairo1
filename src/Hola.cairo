#[contract]
mod HolaStarknet {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    #[event]
    fn Hola(from:ContractAddress, value:felt252) {}

    #[external]
    fn Hola_Starknianos_Dice(message:felt252) {
        let caller=get_caller_address();
        Hola(caller, message);
    }

    #[event]
    fn Evento_Starknet_Es(from:ContractAddress, value:felt252) {}
}
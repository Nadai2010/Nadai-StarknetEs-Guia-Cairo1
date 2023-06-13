#[contract]
mod Voto {
    // Importación de bibliotecas principales
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use array::ArrayTrait;

    struct Storage {
        votos_si: u8,
        votos_no: u8,
        puede_votar: LegacyMap::<ContractAddress, u8>,
        votante_registrado: LegacyMap::<ContractAddress, u8>,
    }

    // @dev constructor con un número fijo de votantes registrados (3)
    // @param votante_1 (ContractAddress): dirección del primer votante registrado
    // @param votante_2 (ContractAddress): dirección del segundo votante registrado
    // @param votante_3 (ContractAddress): dirección del tercer votante registrado

    #[constructor]
    fn constructor(votante_1: ContractAddress, votante_2: ContractAddress, votante_3: ContractAddress) {
        // Registrar a todos los votantes llamando a la función _register_voters
        _register_voters(votante_1, votante_2, votante_3);

        // Inicializar el recuento de votos en 0
        votos_si::write(0_u8);
        votos_no::write(0_u8);
    }

    // @dev Devuelve el número de votos sí y votos no
    // @return estado (u8, u8): estado actual de la votación (votos sí, votos no)

    #[view]
    fn obtener_estado_votos() -> (u8, u8) {
        // Leer el número de votos sí y votos no del almacenamiento
        let n_si = votos_si::read();
        let n_no = votos_no::read();

        // Devolver el estado de votación actual
        return (n_si, n_no);
    }

    // @dev Devuelve si un votante puede votar o no
    // @param user_address (ContractAddress): dirección del votante
    // @return estado (u8): true si el votante puede votar, false en caso contrario

    #[view]
    fn votante_puede_votar(user_address: ContractAddress) -> u8 {
        // Leer el estado de votación del usuario del almacenamiento
        puede_votar::read(user_address)
    }

    // @dev Devuelve si una dirección es un votante o no (registrado o no)
    // @param address (ContractAddress): dirección del posible votante
    // @return es_votante (u8): true si la dirección es un votante registrado, false en caso contrario

    #[view]
    fn votante_esta_registrado(address: ContractAddress) -> u8 {
        // Leer el estado de registro de la dirección del almacenamiento
        votante_registrado::read(address)
    }


// @dev Envía un voto (0 para No y 1 para Sí)
// @param voto (u8): valor del voto, 0 para No y 1 para Sí
// @return (): actualiza el almacenamiento con el recuento de votos y marca al votante como no permitido para votar nuevamente

#[external]
fn votar(voto: u8) {
    // Verificar si el voto es válido (0 o 1)
    assert(voto == 0_u8 | voto == 1_u8, 'VOTO_0_O_1');

    // Conocer si un votante ya ha votado y continuar si no ha votado
    let caller: ContractAddress = get_caller_address();
    assert_permitido(caller);

    // Marcar que el votante ya ha votado y actualizar en el almacenamiento
    puede_votar::write(caller, 0_u8);

    // Actualizar el recuento de votos en el almacenamiento según el valor del voto (0 o 1)
    if (voto == 0_u8) {
        votos_no::write(votos_no::read() + 1_u8);
    }
    if (voto == 1_u8) {
        votos_si::write(votos_si::read() + 1_u8);
    }
}


// @dev Verifica si una dirección tiene permitido votar o no
// @param direccion (ContractAddress): dirección del usuario
// @return (): si el usuario puede votar; de lo contrario, muestra un mensaje de error y revierte la transacción

fn assert_permitido(address: ContractAddress) {
    // Leer el estado de votación del usuario del almacenamiento
    let es_votante: u8 = votante_registrado::read(address);
    let puede_votar: u8 = puede_votar::read(address);

    // Verificar si el usuario puede votar; de lo contrario, mostrar un mensaje de error y revertir la transacción
    assert(es_votante == 1_u8, 'USUARIO_NO_REGISTRADO');
    assert(puede_votar == 1_u8, 'USUARIO_YA_VOTADO');
}

// @dev Función interna para preparar la lista de votantes. El índice puede ser la longitud del array.
// @param direcciones_registradas (Array<ContractAddress>): array con las direcciones de los votantes registrados
// @param indice (usize): índice del votante actual que se procesará

fn _register_voters(
    votante_1: ContractAddress, votante_2: ContractAddress, votante_3: ContractAddress
    ) {
    // Registrar el primer votante
    votante_registrado::write(votante_1, 1_u8);
    puede_votar::write(votante_1, 1_u8);

    // Registrar el segundo votante
    votante_registrado::write(votante_2, 1_u8);
    puede_votar::write(votante_2, 1_u8);

    // Registrar el tercer votante
    votante_registrado::write(votante_3, 1_u8);
    puede_votar::write(votante_3, 1_u8);
    }
}
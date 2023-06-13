#[contract]
mod Vote {
    // Core Library Imports (Kütüphanelerin indirilmesi)
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use array::ArrayTrait;

    // ------
    // Storage 
    // ------
    struct Storage {
        yes_votes: u8,
        no_votes: u8,
        can_vote: LegacyMap::<ContractAddress, u8>,
        registered_voter: LegacyMap::<ContractAddress, u8>,
    }

    // ------
    // Constructor
    // ------

    // @dev constructor with a fixed number of registered voters (3)
    // @param voter_1 (ContractAddress): address of the first registered voter
    // @param voter_2 (ContractAddress): address of the second registered voter
    // @param voter_3 (ContractAddress): address of the third registered voter
    #[constructor]
    fn constructor(voter_1: ContractAddress, voter_2: ContractAddress, voter_3: ContractAddress) {
        // Register all voters by calling the _register_voters function
        _register_voters(voter_1, voter_2, voter_3);

        // Initialize the vote count to 0
        yes_votes::write(0_u8);
        no_votes::write(0_u8);
    }

    // ------
    // Getter functions with view 
    // ------

    // @dev Return the number of yes and no votes
    // @return status (u8, u8): current status of the vote (yes votes, no votes)

    #[view]
    fn get_vote_status() -> (u8, u8) {
        // Read the number of yes votes and no votes from storage
        let n_yes = yes_votes::read();
        let n_no = no_votes::read();

        // Return the current voting status
        return (n_yes, n_no);
    }

    // @dev Returns if a voter can vote or not
    // @param user_address (ContractAddress): address of the voter
    // @return status (u8): true if the voter can vote, false otherwise
    #[view]
    fn voter_can_vote(user_address: ContractAddress) -> u8 {
        // Read the voting status of the user from storage
        can_vote::read(user_address)
    }

    // @dev Return if an address is a voter or not (registered or not)
    // @param address (ContractAddress): address of possible voter
    // @return is_voter (u8): true if the address is a registered voter, false otherwise

    #[view]
    fn is_voter_registered(address: ContractAddress) -> u8 {
        // Read the registration status of the address from storage
        registered_voter::read(address)
    }

    // ------
    // External functions 
    // ------

    // @dev Submit a vote (0 for No and 1 for Yes)
    // @param vote (u8): vote value, 0 for No and 1 for Yes
    // @return () : updates the storage with the vote count and marks the voter as not allowed to vote again

    #[external]
    fn vote(vote: u8) {
        // Check if the vote is valid (0 or 1)
        assert(vote == 0_u8 | vote == 1_u8, 'VOTE_0_OR_1');

        // Know if a voter has already voted and continue if they have not voted
        let caller : ContractAddress = get_caller_address();
        assert_allowed(caller);

        // Mark that the voter has already voted and update in the storage
        can_vote::write(caller, 0_u8);

        // Update the vote count in the storage depending on the vote value (0 or 1)
        if (vote == 0_u8) {
            no_votes::write(no_votes::read() + 1_u8);
        }
        if (vote == 1_u8) {
            yes_votes::write(yes_votes::read() + 1_u8);
        }
    }

    // ------
    // Internal Functions
    // ------

    // @dev Assert if an address is allowed to vote or not
    // @param address (ContractAddress): address of the user
    // @return () : if the user can vote; otherwise, throw an error message and revert the transaction

    fn assert_allowed(address: ContractAddress) {
        // Read the voting status of the user from storage
        let is_voter: u8 = registered_voter::read(address);
        let can_vote: u8 = can_vote::read(address);

        // Check if the user can vote otherwise throw an error message and revert the transaction
        assert(is_voter == 1_u8, 'USER_NOT_REGISTERED');
        assert(can_vote == 1_u8, 'USER_ALREADY_VOTED');
    }

    // @dev Internal function to prepare the list of voters. Index can be the length of the array.
    // @param registered_addresses (Array<ContractAddress>): array with the addresses of registered voters
    // @param index (usize): index of the current voter to be processed
    
    fn _register_voters(
        voter_1: ContractAddress, voter_2: ContractAddress, voter_3: ContractAddress
        ) {
        // Register the first voter
        registered_voter::write(voter_1, 1_u8);
        can_vote::write(voter_1, 1_u8);

        // Register the second voter
        registered_voter::write(voter_2, 1_u8);
        can_vote::write(voter_2, 1_u8);

        // Register the third voter
        registered_voter::write(voter_3, 1_u8);
        can_vote::write(voter_3, 1_u8);
    }
}
package managers;

typedef CardData = {
    final id;
}

typedef State = {
    final hand: ds.ImmutableArray<CardData>;
    final reserve: ds.ImmutableArray<CardData>;
    final discard: ds.ImmutableArray<CardData>;
}

class StateManager {
	public static var instance(default, null):GameManager = new GameManager();

    public var state(get, set):State;

    function get_state() {
        return state;
    }

	private function new() {
		state = new DeepState<State>({
            reserve: [
                { id: 0 },
                { id: 1 },
                { id: 2 },
                { id: 0 },
                { id: 1 },
                { id: 2 },
                { id: 0 },
                { id: 1 },
                { id: 2 },
            ],
            hand: [],
            discard: []
        });
	}

    public static function DrawCard() {}
}

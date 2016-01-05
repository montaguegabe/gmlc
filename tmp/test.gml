// Define bob: he's pretty boring isn't he
object bob {
}

// Susy
object susy {
    import {
        with(global.__bob) {
            instance_destroy();
        }
    }
}

// Greg is derived from susy
object greg : susy {
    properties {
        depth: 2
    }
}

// The main room of the game
room main_room {
    import {
        show_message("MAIN /*ROOM*/ IMPORT// EVENT");
    }
    bob, susy, greg
}

room next_room {
    bob
}
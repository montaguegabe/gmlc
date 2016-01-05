object bob {
}

object susy {
    import {
        with(global.__bob) {
            instance_destroy();
        }
    }
}

object greg : susy {
    properties {
        depth: 2
    }
}

room main_room {
    import {
        show_message("MAIN ROOM IMPORT EVENT");
    }
    bob, susy, greg
}

room next_room {
    bob
}
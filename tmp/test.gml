object bob {
}

object susy {
    import {
        with(global.__bob) {
            instance_destroy();
        }
    }
}

object greg {
    properties {
        depth: 2
    }
}

room main_room {
    import {
        show_message("MAIN ROOM IMPORT EVENT 1");
    }
    bob, susy, greg
}

room next_room {
    bob
}
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
    
}

room main_room {
    bob, susy, greg
    import {
        show_message("MAIN ROOM IMPORT EVENT");
    }
}

room next_room {
bob
}
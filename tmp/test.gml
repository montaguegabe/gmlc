// Define bob: he's pretty boring isn't he
object bob {
}

// Susy
object susy {
    import {
        with(global.__bob) {
            instance_destroy();
        }
        object_set_depth(this_resource, 2);
    }
}

// Greg is derived from susy
object greg : susy {
    properties {
        depth: 2
    }

    event keypress(up) {
        var text;
        text = greeting("Gabe", true);
        show_message(text);
    }
}

// A script to greet people
script greeting(name, excited) {
    
    var punc;
    if (excited) punc = "!";
    else punc = ".";
    return "Hello " + name + punc;
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
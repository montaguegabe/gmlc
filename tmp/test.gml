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
        var text = greeting("Gabe", true);
        show_message(text);
    }
    event keypress(down) {
      var d = Dist(0, 0, 1, 1);
      show_message(string(d));
    }
}

// A script to greet people
script greeting(name, excited) {

    var punc = ".";
    if (excited) punc = "!";
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

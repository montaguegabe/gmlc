// Define bob: he's pretty boring isn't he
object bob {
}

// Susy
object susy {
    event create() {
        with(bob) {
            instance_destroy();
        }
        object_set_depth(this_resource, 2);
    }
    event keypress(down) {
      //var d = Dist(0, 0, 1, 1);
      var d = 3.14159;
      show_message(string(d));
    }
}

// Greg is derived from susy
object greg : susy {
    properties {
        depth: 2
    }

    event keypress("w") {
        var text = greeting();
        show_message(text);
    }
}

// A script to greet people
script greeting(name) {

    var punc = ".";
    var name = "Gabe";
    //if (excited) punc = "!";
    return "Hello " + name + punc;
}

// The main room of the game
room main_room {
    import {
        show_message("MAIN /*ROOM*/ IMPORT// EVENT");
    }
    bob, greg
}

room next_room {
    bob
}

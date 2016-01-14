# gmlc
A command line compiler for GML

GMLC compiles files written in the Game Maker Language (GML) to windows executables, without the need for the standard Game Maker IDE. It is written in Python and based on Game Maker 7.

#### GMLC vs. GM7 Pro
GMLC is not a viable replacement for GM7 Pro. The GML code ends up being interpreted without optimization by the executable, meaning that the running speed is not even close to GM's compiled executables. GMLC runs in the command line, so it cannot replace GM7's resource creation tools either. It is created as an experiment for learning purposes and for easier development with Unix-based systems running Wine.

#### How it works
- GML files are written in an extended syntax that facilitates the creation of GM objects, events, rooms, and scripts.
- Upon compilation, the extended syntax is condensed into pure GML contained between special directive lines starting with the `@` symbol.
- The directive form of the original file is then passed through basic encryption and appended to the game executable.
- When the game executable is run, the interpreter (interpreter.gmk), decrypts and  parses the directive lines and their accompanying pure GML code to set up the game. This final step uses GM's resource-modification functionality to set up resources as if they had been created with the IDE.

### Using the command line program
See the "build" bash scripts in the "simple" and "music" example directories for an example of how to use the compiler program. Specify source files as globs such as "source1/*.gml source2/*.gml" in the order that you want them compiled and interpreted.

Additional flag options are as follows:

  - "-o" or "--output": Output file path, not including extension.
  - "-se" or "--script-export": Allow parsing of exported scripts from Game Maker.
  - "-r" or "--release": Minify GML code. Runtime errors will be illegible. Still under development and not advised at the moment.
  - "-el" or "--errorlim": Maximum number of errors before aborting.
  - "-dne" or "--dbg-no-encrypt": Will break the executable but make directive code output human-readable.

### The extended GML syntax
If you prefer to learn by example skip this section and take a look at the example .gml files in the "simple" directory.
```
  /*
   * The extended GML Syntax
   * Outer comments work exactly the same as in GML.
   */
  
  // Script declaration:
  // Scripts can have named arguments, as shown the below example
  script my_script_name(prefix, number, suffix) {

    show_message(prefix + string(number) + suffix);
  }
  
  // Object declaration:
  object my_object_name {
  
    // Object events:
    // Event names automatically prefixed with ev_, so keypress -> ev_keypress event)
    // Event numbers automatically prefixed with vk_ or ev_ as necessary
    event keypress(enter) {
      my_script_name("This is the number ", 1, "!");
    }
    
    // Keycodes for keyboard events are automatically translated
    event keyboard("w") {
      // Other GML code...
    }
  }
  
  // As a shortcut for object inheritance you can write:
  object my_derived_object : my_base_object {
    // ...
  }
  
  // Room declaration:
  // Objects listed here must be already declared above
  room my_room_name {
    my_object_name, my_derived_object, other_object, etc...
  }
```

### Language deviations
GML code is for the most part the same as it is in the GM context. You can reference any room, script, or object at any point regardless of declaration order. However, it deviates from IDE GML in the following ways:

1. You can declare scope-level variables with values in one line e.g. `var example = "this"`
2. If you name global variables starting with "__" (double underscore), you may encounter namespace collisions with the runtime interpreter. In addition `this_resource` is an added special keyword.
3. Game start events may not fire as expected, as resources are being added after the very outset of the game.

### Import blocks
Import blocks allow GML code to be run when the interpreter loads a resource. The purpose of them is to call GML's resource modification functions to further configure the object or room before it is used (they can also be used with scripts). The `this_resource` keyword can be used import blocks (as well as other events) to reference the GML resource being created for configuration. For example, the following two are equivalent:
```
  object my_derived_object : my_base_object {
    // ...
  }
```
is shorthand for:
```
  object my_derived_object {
    import {
      object_set_parent(this_resource, my_base_object)
    }
  }
```

Like in room declarations, import events can only access resources that have already been declared, so in the above example for both cases the declaration for `my_base_object` would need to preceed the derived object declaration. This is different from object events, which can reference any object, room, or script no matter what the declaration order.

#### Properties
Properties are shorthand for calling `object_set_xyz(this_resource, value)` or `room_set_xyz(this_resource, value)`. Simply declare a `properties` dictionary in a room or object declaration like in the following example:
```
object example_object {
  // No need for an import block with "object_set_depth" or "object_set_persistant"
  properties {
    depth: 2,
    persistant: true
  }
}
```


object light_directional {

    properties {
        solid: false,
        visible: false,
        depth: 0,
    }

    event create() {
        rotx = 60;
        roty = 20;

        r = 128;
        g = 128;
        b = 128;

        LightDirectional( );
    }

    event destroy() {
        Destroy( );
    }

    event step() {
        Step( );
    }
}

object sound_dropper {

    event create() {
        scalx = 0.5;
        scaly = 0.5;
        scalz = 0.5;
        x = 0;
        y = 0;
        z = 128;
        file = "Media/SoundDropper.u3d";
        LoadMesh( );
        Step( );

        // Sound dropper variables
        createwait = 200;
        alarm[0] = createwait;
    }

    event destroy() {
        Destroy( );
    }

    event alarm(0) {
        instance_create( id, 0, sphere );
        scalz = 1.00001;
        alarm[0] = createwait;
    }

    event step() {
        scalz += ( 0.5 - scalz ) / 16;
        Step( );
    }
}

object raycast_plane {

    properties {
        solid: false,
        visible: true,
        depth: 0
    }

    event create() {
        width = 100000;
        height = 100000;
        rotx = -90;
        x = -50000;
        y = 0;
        z = -50000;
        CreateFloor( );
        SetMaterial( 0, 255, 255, 0 );
        Step( );
    }

    event step() {
        x = camera.x;
        y = camera.y;
        z = camera.z;
        rotx = -90;
        roty = 0;
        Move( rotx, roty,  );
    }
}

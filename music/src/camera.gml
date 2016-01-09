object camera {

    properties {
        solid: false,
        visible: false,
        depth: -1
    }

    event create() {
        x = 0;
        y = -200;
        z = 70;
        roty = 0;
        view = 90;
        height = 0;
        follow = false;
        perspective = 0;
        mouse_speed = 0.1;
        speed2 = 1;
        scrollspeed = 8;

        MoveCamera( );
    }

    event step() {
        MoveCamera( );
    }

    event keyboard(97) {
        Move( 0, roty - 90, speed2 );
    }

    event keyboard(100) {
        Move( 0, roty + 90, speed2 );
    }

    event keyboard(115) {
        z -= speed2;
    }

    event keyboard(119) {
        z += speed2;
    }

    event mouse_wheel_up() {
        Move( rotx, roty, speed2 * scrollspeed );
        scrollspeed -= 0.2;
    }

    event mouse_wheel_down() {
        Move( rotx, roty, -speed2 * scrollspeed );
        scrollspeed += 0.2;
    }
}

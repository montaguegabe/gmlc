object control {

    properties {
        depth: 0,
        persistent: true
    }

    event create() {

        // Init MIDI
        midi_dll_init();
        midi_init(window_handle());

        BG_r = 255;
        BG_g = 255;
        BG_b = 255;
        show_cursor = false;

        Init();
        GMBULLET_Init();

        global.lmb = 0;
        global.rmb = 0;
        global.mmb = 0;

        // Create the physics world
        GMBULLET_CreateBulletWorld(-1000, -1000, -1000, 1000, 1000, 1000, 16);
        GMBULLET_SetAngleProperties(true, true);

        // 16 Pixels is a meter
        global.scale = 16;
        GMBULLET_SetWorldScale(global.scale);

        // Gravity
        GMBULLET_SetWorldGravity(0, 0, -9.8 / global.scale);

        // Load textures
        inst = 11;

        // Load Shapes
        global.shape_ground = GMBULLET_CreateBoxShape(1, 16, 4);
        global.shape_sphere = GMBULLET_CreateSphereShape(4);
    }

    event destroy() {
        external_call(global.u3d_cleanup);
    }

    event step(step_normal) {
        var num, i;

        // Update the physics
        GMBULLET_StepSimulationTime(1, 4, 1 / max(fps, 10));

        // Play collision sounds
        num = GMBULLET_GetNumOldCollisionPair();

        for(i = 0; i < num; i += 1) {

            var gmId1;

            gmId1 = GMBULLET_GetOldCollisionPairBodyID(i, false, 1);
            gmId2 = GMBULLET_GetOldCollisionPairBodyID(i, true, 1);

            if (gmId1.object_index == platform) {

              // Channel, pan, instrument, pitch, volume, duration
              midi_note_play_timed(0, 128, gmId1.inst, gmId1.pitch, 128, 500);
              gmId1.scaly *= 1.25;
              gmId1.scalz = 0.25;
            }
            if (gmId2.object_index == platform) {
              midi_note_play_timed(0, 128, gmId2.inst, gmId2.pitch, 128, 500);
              gmId2.scaly *= 2.25;
              gmId2.scalz = 0.25;
            }
        }
    }

    event step(step_begin) {
        external_call(global.u3d_present);

        if(MouseCheckButton(mb_left)) global.lmb += 1;
        else global.lmb = 0;

        if(MouseCheckButton(mb_right)) global.rmb += 1;
        else global.rmb = 0;

        if(MouseCheckButton(mb_middle)) global.mmb += 1;
        else global.mmb = 0;
    }


    event step(step_end) {
        external_call(global.u3d_transmit_controller_information, BG_r, BG_g, BG_b, show_cursor);
        external_call(global.u3d_render);
    }

    event other(game_end) {
        GMBULLET_DeleteAllShapes();
        GMBULLET_DestroyBulletWorld();
        external_call(global.u3d_cleanup);

        midi_exit();
        midi_dll_free();
    }

    event keypress(enter) {
        inst = round(random(100));
    }
}

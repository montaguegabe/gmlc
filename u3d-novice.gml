#define Step
// Step()
// This function has to be called in the step event of every primitive
// object, model object and light object!
if(u3d_type==1){
    if(textureprevious!=texture
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rotzprevious!=rotz
     ||scalxprevious!=scalx
     ||scalyprevious!=scaly
     ||scalzprevious!=scalz){
        external_call(global.u3d_model_step,u3d_index,x,y,z,rotx,roty,rotz,scalx,scaly,scalz,texture);
        textureprevious=texture;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rotzprevious=rotz;
        scalxprevious=scalx;
        scalyprevious=scaly;
        scalzprevious=scalz;
    }
    if(frameprevious!=frame
     ||first_frameprevious!=first_frame
     ||last_frameprevious!=last_frame){
        external_call(global.u3d_model_set_frame,u3d_index,frame,first_frame,last_frame);
        frameprevious=frame;
        first_frameprevious=first_frame;
        last_frameprevious=last_frame;
    }
}
else if(u3d_type>=2 && u3d_type<=4){
    if(rprevious!=r
     ||gprevious!=g
     ||bprevious!=b
     ||spec_rprevious!=spec_r
     ||spec_gprevious!=spec_g
     ||spec_bprevious!=spec_b
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rangeprevious!=range
     ||degprevious!=deg){
        external_call(global.u3d_transmit_doubles,spec_r,spec_g,spec_b,0,0,0,0,0,0,0,0);
        external_call(global.u3d_light_step,u3d_index,r,g,b,x,y,z,rotx,roty,range,deg);
        rprevious=r;
        gprevious=g;
        bprevious=b;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rangeprevious=range;
        degprevious=deg;
    }
}
else if(u3d_type>=7){
    if(textureprevious!=texture
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rotzprevious!=rotz
     ||scalxprevious!=scalx
     ||scalyprevious!=scaly
     ||scalzprevious!=scalz){
        external_call(global.u3d_transform_primitive,u3d_index,texture,x,y,z,rotx,roty,rotz,scalx,scaly,scalz);
        textureprevious=texture;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rotzprevious=rotz;
        scalxprevious=scalx;
        scalyprevious=scaly;
        scalzprevious=scalz;
    }
}


#define Destroy
// Destroy()
// This function has to be called in the destroy event of every primitive
// object, model object and light object!
if(u3d_type==1){
    external_call(global.u3d_destroy_model,u3d_index);
}
if(u3d_type>=2 && u3d_type<=4){
    external_call(global.u3d_destroy_light_source,u3d_index);
}
if(u3d_type==5){
    external_call(global.u3d_destroy_terrain,u3d_index);
}
if(u3d_type==6){
    external_call(global.u3d_destroy_particle_system,u3d_index);
}
if(u3d_type>=7 && u3d_type<=13){
    external_call(global.u3d_destroy_primitive,u3d_index);
}
if(u3d_type==14){
    external_call(global.u3d_destroy_post_screen_shader,u3d_index);
}
if(u3d_type==15){
    external_call(global.u3d_destroy_camera,number);
}
u3d_index=0;
u3d_type=0;

#define LoadTexture
// LoadTexture(SourceFile,TextureIndex,Width,Height)
// This function loads a texture from the given file and uses the given
// index to manage it. Width and Height are optional arguments to scale the
// texture while loading.
return external_call(global.u3d_load_texture,argument1,argument0,argument2,argument3);

#define SetFog
// SetFog(FogColorRed,FogColorGreen,FogColorBlue,FogStart,FogEnd)
// This function sets up the fog with the given parameters.
// FogColorRed/Green/Blue give the fog color. Everything that's father away
// from the camera than FogEnd will have this color. Everything closer to
// the camera than FogEnd will be normal. Inbetween a linear interpolation
// is performed.
Init();
return external_call(global.u3d_set_fog,argument0,argument1,argument2,argument3,argument4);

#define DisableFog
// DisableFog()
// This function disables the fog.
return external_call(global.u3d_set_fog,0,0,0,0,0);

#define SetAmbient
// SetAmbient(R,G,B)
// Sets the ambient lighting to the given color. R, G and B should be in
// the range from 0 to 255.
return external_call(global.u3d_set_ambient_light,argument0,argument1,argument2,-1);

#define LoadBackground
// LoadBackground(File)
// This function loads a background from the given file. If the string
// contains a * it will be replaced by Front, Back, Left, Right, Top and
// Bottom to load a sky cube texture. Else it loads a sky sphere texture.
Init();
return external_call(global.u3d_load_background,argument0);

#define UnloadBackground
// UnloadBackground()
// This function disables the current background and uses the solid color.
Init();
return external_call(global.u3d_load_background,"");

#define CreateWall
// CreateWall()
// This function creates a wall object and associates it with the object
// the function is called by. Before you can call this function you have
// to set the variables x2 and y2 which define where the wall goes to
// from it's origin, the variable height which defines the height of the
// wall and the variable texture which gives the index of the texture that
// is to be used for the wall. For information on optional variables and
// more information on how to use primitive objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("x2",0);
InitializeVariable("y2",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_wall,x2,y2,height,texture,texx1,texy1,texx2,texy2,partsx,partsy);
if(u3d_index){
    u3d_type=7;
}
return u3d_index!=0;

#define CreateFloor
// CreateFloor()
// This function creates a floor object and associates it with the object
// the function is called by. Before you can call this function you
// have to set the variables width and height which define the dimensions
// of the floor object and the variable texture which gives the index of
// the texture that is to be used for the wall. For information on
// optional variables and more information on how to use primitive
// objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("width",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_floor,width,height,texture,texx1,texy1,texx2,texy2,partsx,partsy);
if(u3d_index){
    u3d_type=8;
}
return u3d_index!=0;

#define CreateCube
// CreateCube()
// This function creates a cube object and associates it with the object
// the function is called by. Before you can call this function you
// have to set the variables width, height and depth_2 to define the
// dimensions of the cube and the variable texture which gives the index of
// the texture that is to be used for the cube. For information on
// optional variables and more information on how to use primitive
// objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("width",0);
InitializeVariable("height",0);
InitializeVariable("depth2",0);
InitializeVariable("texz1",0);
InitializeVariable("texz2",1);
InitializeVariable("partsz",1);
InitializeVariable("originx",0);
InitializeVariable("originy",0);
InitializeVariable("originz",0);
InitializeVariable("subdivide_texture",false);
external_call(global.u3d_transmit_doubles,partsx,partsy,partsz,originx,originy,originz,0,0,0,0,0);
u3d_index=external_call(global.u3d_create_cube,width,height,depth2,texture,texx1,texy1,texz1,texx2,texy2,texz2,subdivide_texture);
if(u3d_index){
    u3d_type=9;
}
return u3d_index!=0;

#define Create2D
// Create2D()
// This function creates a billboard object and associates it with the
// object that has called it. Before you can call this function you have
// to set the variables width, height and texture. For more information
// about billboard objects and information about optional variables have a
// look at the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("originx",0);
InitializeVariable("originy",0);
InitializeVariable("width",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_billboard,width,height,originx,1-originy,partsx,partsy,texture,texx1,texy1,texx2,texy2);
if(u3d_index){
    u3d_type=11;
}
return u3d_index!=0;

#define BeginPolygon
// BeginPolygon(VertexCount)
// This function will prepare everything for creating a polygon with the
// given number of vertices. It has to be called before AddVertex and
// CreatePolygon. Then AddVertex has to be called as often as declared by
// the parameter VertexCount. Finally you have to call CreatePolygon.
Init();
return external_call(global.u3d_begin_polygon,argument0);

#define AddVertex
// AddVertex(X,Y,Z,U,V)
// Adds a vertex to the polygon that has been begun using BeginPolygon. The
// parameters X, Y and Z define the position of the vertex. U and V define
// the texture coordinate that will define which part of the texture will
// be used at this vertex.
return external_call(global.u3d_add_vertex,argument0,argument1,argument2,argument3,argument4);

#define CreatePolygon
// CreatePolygon()
// This function creates a polygon object and associates it with the object
// it has been called by. Before it can be called BeginPolygon and AddVertex
// must have been called correctly.
InitializePrimitiveVariables();
u3d_index=external_call(global.u3d_create_polygon);
if(u3d_index){
    u3d_type=10;
}
return u3d_index!=0;

#define LightDirectional
// LightDirectional()
// This function initializes a new directional light source using the
// values of the member variables r, g, b, rotx and roty.
Init();
InitializeLightVariables();
u3d_index=external_call(global.u3d_create_directional_light,r,g,b,spec_r,spec_g,spec_b,rotx,roty);
if(u3d_index){
    u3d_type=2;
}
return u3d_index!=0;

#define LightPoint
// LightPoint()
// This function initializes a new point light source using the values of
// the member variables r, g, b, x, y, z and range.
Init();
InitializeLightVariables();
u3d_index=external_call(global.u3d_create_point_light,r,g,b,spec_r,spec_g,spec_b,x,y,z,range);
if(u3d_index){
    u3d_type=3;
}
return u3d_index!=0;

#define LightSpot
// LightSpot()
// This function initializes a new spot light source using the values of
// the member variables r, g, b, x, y, z, rotx, roty, range and deg.
Init();
InitializeLightVariables();
external_call(global.u3d_transmit_doubles,spec_r,spec_g,spec_b,0,0,0,0,0,0,0,0);
u3d_index=external_call(global.u3d_create_spot_light,r,g,b,x,y,z,rotx,roty,range,deg);
if(u3d_index){
    u3d_type=4;
}
return u3d_index!=0;

#define LoadMesh
// LoadMesh()
// This function loads a model from the file given by the variable file.
// The name isn't current. In the first versions it could load only simple
// meshs, but now it's also able to load different animated model file
// formats.
Init();
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",-123);
InitializeVariable("scalx",1);
InitializeVariable("scalxprevious",-123);
InitializeVariable("scaly",1);
InitializeVariable("scalyprevious",-123);
InitializeVariable("scalz",1);
InitializeVariable("scalzprevious",-123);
InitializeVariable("texture",0);
InitializeVariable("textureprevious",-123);
InitializeVariable("frame",-1);
InitializeVariable("frameprevious",-123);
InitializeVariable("first_frame",0);
InitializeVariable("first_frameprevious",-123);
InitializeVariable("last_frame",0);
InitializeVariable("last_frameprevious",-123);
InitializeVariable("password","");
if(scalx==0 && scaly==0 && scalz==0){
    scalx=1;
    scaly=1;
    scalz=1;
}
u3d_index=external_call(global.u3d_load_mesh,file,password);
if(u3d_index){
    u3d_type=1;
}
else{
    u3d_type=0;
}
return u3d_index!=0;

#define SetVertex
// SetVertex(VertexIndex,X,Y,Z,U,V)
// This function works almost in the same way as AddVertex. But it has to
// be called after CreatePolygon and you can define which vertex you want
// to be changed by passing it's vertex index (the vertex that gets defined
// first using AddVertex has the index 0).
xprevious2+=1;
return external_call(global.u3d_set_vertex,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define GetVertex
// GetVertex(VertexIndex,ElementIndex)
// This function retrieves the element with the given index of the vertex
// with the given index. It can be called after CreatePolygon. The vertex
// that gets defined first using AddVertex has the index 0. The elment
// indices are defined in the following way:
// 0 -> X
// 1 -> Y
// 2 -> Z
// 3 -> U
// 4 -> V
return external_call(global.u3d_get_vertex,u3d_index,argument0,argument1);

#define SetMaterial
// SetMaterial(ColorR,ColorG,ColorB,ColorA)
// This function changes the color of the material that's used by the
// primitive object that's associated with the object that has called this
// function. ColorR/G/B give the colour and the brightness of the material.
// ColorA gives the alpha of the material. All parameters should lie in
// the range from 0 to 255. Please note that the object will completely
// invisible if you use an alpha of zero!
return external_call(global.u3d_set_material,u3d_index,argument0,argument1,argument2,argument3);

#define SetMaterialEmissive
// SetMaterialEmissive(ColorR,ColorG,ColorB)
// This function defines how many light the material of the object it is
// called by emits. ColorR/G/B define the color and the intensity of the
// emited light. They should lie in the range from 0 to 255. For more
// information about what exactly emissive materials mean have a look at
// the help file.
return external_call(global.u3d_set_material_emissive,u3d_index,argument0,argument1,argument2);

#define RecreatePrimitive
// RecreatePrimitive()
// This function recreates the primitive that's associated with the object
// that calls this function. You have to use it if you want to change the
// values of the parameters of an primitive object that have to be set
// before calling it's create-function after calling this function. For
// example you could create a floor object with a paticular size given by
// the variables width and height. When you change the values of the
// variables width and height after calling CreateFloor that won't effect
// the size of the floor. But when calling RecreatePrimitive this change
// will take effect. Note that the material information gets set back to
// the default values when calling this function.
if(u3d_type>=7){
    if(u3d_type==7){
        Destroy();
        CreateWall();
    }
    if(u3d_type==8){
        Destroy();
        CreateFloor();
    }
    if(u3d_type==9){
        Destroy();
        CreateCube();
    }
    if(u3d_type==10){
        Destroy();
        CreatePolygon();
    }
    if(u3d_type==11){
        Destroy();
        Create2D();
    }
    external_call(global.u3d_transform_primitive,u3d_index,texture,x,y,z,rotx,roty,rotz,scalx,scaly,scalz);
}


#define DrawTex
// DrawTex(TextureIndex,X,Y,Scaling,Rotation,Alpha)
// This function draws the texture with the given index at the given
// position. If scaling is equal to one the size it's drawed in will match
// the size of the texture as it's loaded (note that textures have to use
// dimensions made up of powers of two). If scaling has another value this
// value will be used as factor for the size. The rotation argument takes
// degrees and rotates the drawed texture counter-clockwise. Alpha can be
// a value in the range from 0 to 255 where 255 means full opacity and 1
// means full transparency. If you pass 0 Ultimate 3D will assume that you
// have forgotten to pass a correct value and will use full opacity.
return external_call(global.u3d_draw_texture,argument0,argument1,argument2,argument3,argument4,argument5+255*(argument5==0));

#define DrawTexEx
// DrawTexEx(TextureIndex,TextureLeft,TextureTop,TextureRight,TextureBottom,X,Y,ScalingX,ScalingY,Rotation,ColorR,ColorG,ColorB,ColorA,CameraIndex)
// This function is a more complex version of DrawTex. It also draws the
// given texture at the position given by X and Y. TextureLeft/Top/Right/
// Bottom define the part of the texture that is to be used. These
// variables are usually in the range from 0 to 1 where 0|0 refers to the
// left top of the textue and 1|1 refers to the right bottom (see also:
// texture coordinates in the help file). ScalingX and ScalingY can be
// used to scale the texture. Despite the fact that there are two scaling
// factors now it works in the same way as for DrawTex. Rotation takes
// degrees and rotates the texture counter-clockwise. ColorR/G/B/A have to
// lie in the range from 0 to 255. If you pass 255 to all color arguments
// it won't change the texture at all. Finally CameraIndex is required if
// you want to draw a texture to another texture that is being used as
// render target for a camera. For more informaiton on textures, texture
// coordinates and render targets have a look at the help file.
external_call(global.u3d_transmit_doubles,argument10,argument11,argument12,argument13+255*(argument13==0),0,0,0,0,0,0,0);
return external_call(global.u3d_draw_texture_ex,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument14);

#define SetFont
// SetFont(FontName,FontIndex,FontSize,FontStyle,FontColorR,FontColorG,FontColorB,FontColorA)
// This function sets up a font using the given index. If the font is
// already in use the font gets overwritten. FontName is the name of the
// file that contains the font in the font folder of the operating system
// (e.g. "Times New Roman"). FontSize is the size of the font as known from
// office programs. FontStyle can be zero for a normal font, one for a fat
// font or two for a italic font. FontColorR/G/B/A give the color that's
// used for the font. Proper values are in the range from 0 to 255.
// It can be changed lateron using SetFontColor(...).
Init();
if(argument7==0){
    argument7=255;
}
external_call(global.u3d_set_font,argument1,argument0,argument2,argument3);
external_call(global.u3d_set_font_color,argument1,argument4,argument5,argument6,argument7);
return true;


#define SetFontColor
// SetFontColor(FontIndex,FontColorR,FontColorG,FontColorB,FontColorA)
// This function changes the color of the font with the given index. The
// color values have to lie in the range from 0 to 255.
return external_call(global.u3d_set_font_color,argument0,argument1,argument2,argument3,argument4);

#define DrawText
// DrawText(FontIndex,PositionX,PositionY,TextString,CameraIndex)
// This function draws the given text string at the given position using
// the font that has been associated with the given FontIndex. CameraIndex
// can be used to make Ultimate 3D draw the text to the texture render
// target of the camera with the given index (the value of the number
// variable of the camera).
external_call(global.u3d_transmit_doubles,argument4,0,0,0,0,0,0,0,0,0,0);
return external_call(global.u3d_draw_text,argument0,argument1,argument2,argument3);

#define Draw3DText
// DrawText3D(Text,FontIndex,X,Y,Z,RotationX,RotationY,RotationZ,ScalingX,ScalingY,ScalingZ)
// This function draws the given text using the font with the given index.
// The transformation given by X/Y/Z, RotationX/Y/Z and ScalingX/Y/Z will
// be used to transform the text.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,0,0);
return external_call(global.u3d_draw_text_3d,argument1,argument0);

#define Move
// Move(rotx,roty,speed)
// This function moves the object that calls it speed steps into the given
// direction.
x+=sin(degtorad(argument1))*cos(degtorad(argument0))*argument2;
y+=cos(degtorad(argument1))*cos(degtorad(argument0))*argument2;
z-=sin(degtorad(argument0))*argument2;

#define MouseCheckButton
// MouseCheckButton(MouseButton)
// mouse_check_button doesn't work correctly when Ultimate 3D is being
// used. For that reason you have to use this function instead.
return keyboard_check_direct(argument0);

#define GetMousePos
// GetMousePos()
// This function retrieves the position of the mouse cursor in screen space
// and saves it to the variables global.mouse_x and global.mouse_y
global.mouse_x=external_call(global.u3d_get_mouse_position_x);
global.mouse_y=external_call(global.u3d_get_mouse_position_y);
return true;

#define SetMousePos
// SetMousePos(MousePositionX,MousePositionY)
// This function sets the mouse cursor to the given coordinates in screen
// space.
return external_call(global.u3d_set_mouse_position,argument0,argument1);

#define TakeScreenshot
// TakeScreenshot(BMPFile)
// This function will take a screenshot and save it to the given *.bmp file.
return external_call(global.u3d_take_screenshot,argument0);

#define TakeScreenshotEx
// TakeScreenshotEx(BMPFile,Unused,Left,Top,Right,Bottom)
// This function will take a screenshot of the defined part of the screen
// and save it to the given *.bmp file. The second argument has been in use
// by a previous version of Ultimate 3D but is now unused.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument5,0,0,0,0,0,0,0);
return external_call(global.u3d_take_screenshot_ex,argument0);

#define CollisionH
// CollisionH()
// This function may be called in the collision event of a horizontal wall
// object with the camera to implement simple collision detection.
if(other.z<height+z && other.z+height>z){
    other.y-=((other.y<y)*2-1)*abs(other.y-other.yprevious);
}

#define CollisionV
// CollisionV()
// This function may be called in the collision event of a vertical wall
// object with the camera to implement simple collision detection.
if(other.z<height+z &&  other.z+height>z){
    other.x-=((other.x<x)*2-1)*abs(other.x-other.xprevious);
}

#define CollisionZ
// CollisionZ()
// This function may be called in the collision event of a cube or floor
// object with the camera to implement simple collision detection.
if(other.z>z+height*(u3d_type==9)){
    other.falling=true;
}
else if(other.z+other.height>z+height*(u3d_type==9)){
    other.z=z+height*(u3d_type==9);
    other.falling=false;
    other.falling_speed=0;
}

#define CollisionTerrainModel
// CollisionModelTerrain()
// This function may be called in the collision event of a terrain model
// with the camera to achieve simple collision detection.
terrain_height=-external_call(global.u3d_get_distance_to_model,u3d_index,other.x,other.y,10000,90,0)+10000;

if(terrain_height==-90000){
    other.falling=false;
    other.falling_speed=0;
    return false;
}

// Collision detection along the z-axis
if((other.z>=terrain_height-other.height/4 && other.z<terrain_height+other.height/4)||(other.zprevious>terrain_height && other.z<terrain_height)){
    // Collision detection along the x and the y-axis (Dependent on the
    // degree of the terrain)
    if(terrain_height-other.z>other.height/2){
        other.x=other.xprevious;
        other.y=other.yprevious;
    }
    other.falling=false;
    other.falling_speed=0;
    other.z=terrain_height;
}
if(other.z+other.height<terrain_height || other.z>terrain_height+other.height/4){
    other.falling=true;
}
return true;

#define Dist
var dx = argument0 - argument2;
var dy = argument1 - argument3;
return sqrt(dx * dx + dy * dy);

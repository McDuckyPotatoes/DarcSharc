if !("hue" in self) hue = 0
if get_player_color(player) == 19 {
    //remember rivals starts with 0
	hue+=1 
    if hue>255 hue-=255;
    //make hue shift every step + loop around
    
    color_rgb = make_color_rgb(225, 50, 50);
    color_rgb2 = make_color_rgb(191, 194, 194);
    //make a gamemaker color variable using kirby's default color (body)
    hue2=(color_get_hue(color_rgb)+hue) mod 255;
    //shift that colour by Hue, make sure it also loops
    color_hsv=make_color_hsv(hue2,color_get_saturation(color_rgb),color_get_value(color_rgb));
    color_hsv2=make_color_hsv(hue2,color_get_saturation(color_rgb2),color_get_value(color_rgb2)); 
    //make a gamemaker color variable using the new hue
    set_color_profile_slot(19, 0,color_get_red(color_hsv2),color_get_green(color_hsv2),color_get_blue(color_hsv2));
    set_color_profile_slot(19, 2,color_get_red(color_hsv),color_get_green(color_hsv),color_get_blue(color_hsv));
    set_color_profile_slot(19, 5,color_get_red(color_hsv)+200,color_get_green(color_hsv)+200,color_get_blue(color_hsv)+200);
    //set the new color using rgb values from the gamemaker color
    init_shader();
}

if (get_player_color( player ) == 7) {
    for(i = 0; i < 9; i++){
        set_character_color_shading(i, 0);
    }
}

//Fancy CSS template by Muno
//Put in css_draw.gml

var temp_x = x + 8;
var temp_y = y + 8;

patch_ver = "1.0";
patch_day = "";
patch_month = "";

var drawAlpha = 1;
var num_alts = 28;
var alt_cur = get_player_color(player);

var doNotInitShader = "alt_name" in self; // check if running for the first time

if(!variable_instance_exists(id,"timerSelect")) //init variables.
{
    timerSelect = 0;
    altSelected = 0;
}

timerSelect ++;
if(altSelected != alt_cur)
{
    timerSelect = 0;
    drawAlpha = 1;
    sound_play(sound_get("DS_csscardswipe"));
    altSelected = alt_cur;
}
/*if(timerSelect > 50)
{
    drawAlpha = (1-(timerSelect - 50)/30);
}*/

//Alt name init. var doesn't work with arrays lol
alt_name[0]  = "Unorthodox Magician";
alt_name[1]  = "Blue Ocean";
alt_name[2]  = "Serena Hat";
alt_name[3]  = "Mint Chompo";
alt_name[4]  = "Great White";
alt_name[5]  = "Banana's Foster";
alt_name[6]  = "Dark Shark";
alt_name[7]  = "8-Bite";
alt_name[8]  = "Spooky Trickster";
alt_name[9]  = "Santa Jaws";
alt_name[10]  = "Love Bites";
alt_name[11] = "Cards of Fame";
alt_name[12] = "Antique";
alt_name[13] = "Neo-Shark";
alt_name[14] = "Trans Bites";
alt_name[15] = "Nombinary";
alt_name[16] = "Neapolitan";
alt_name[17] = "Hot Coals";
alt_name[18]  = "Loan Shark";
alt_name[19]  = "Deal the Rainbow";
alt_name[20]  = "Devilspade";
alt_name[21] = "Chaos King";
alt_name[22] = "MC Ballyhoo";
alt_name[23] = "Don Pianta";
alt_name[24] = "Card cZard";
alt_name[25] = "Steal the Deal";
alt_name[26]  = "Fungus Amogus";
alt_name[27]  = "Sharkshooter";
alt_name[28]  = "We live in a society";

if(!doNotInitShader){
    init_shader(); // makes the shader update when you return to the CSS (don't know why the game is coded so that this necessary)
}


//Patch
draw_set_halign(fa_left);

//textDraw(temp_x + 2, temp_y + 30, "medFont", c_white, 0, 1000, 1, true, 1, "VER. " + patch_ver);

// textDraw(temp_x + 2, temp_y + 50, "fName", c_white, 0, 1000, 1, true, 1, patch_day + " " + patch_month);
draw_sprite(sprite_get("css_bg"), 0, temp_x, temp_y);
sprite_change_offset("charselect", 102, 0);
draw_sprite_ext(sprite_get("charselect"), 0, temp_x+102, temp_y, clamp((-1+(timerSelect)/8*2),-1, 1), 1, 0, c_white, 1);
// //Alt
// draw_set_alpha((1-(timerSelect)/16));
// rectDraw(temp_x, temp_y, temp_x + 201, temp_y + 143, c_white);
// // rectDraw(temp_x, temp_y + 130, temp_x + 201, temp_y + 142, c_black);

// // for(i = 0; i < num_alts; i++){
// //     if(i > 15)
// //         y_layer = 0;
// //     else
// //         y_layer = 6;

// // 	var draw_color = (i == alt_cur) ? c_yellow : c_gray;
// // 	var draw_x = temp_x + 2 + 10 * (y_layer != 0 ? i : (i - 16));
// // 	rectDraw(draw_x, temp_y + 138 - y_layer, draw_x + 7, temp_y + 141 - y_layer, draw_color);
// // }

// draw_set_halign(fa_left);
// draw_set_alpha(1);

//include alt. name
// textDraw(temp_x + 2, temp_y + 116, "fName", c_white, 0, 1000, 1, true, drawAlpha, alt_name[alt_cur]);
textDraw(temp_x + 2, temp_y + 130, "fName", c_white, 0, 1000, 1, true, drawAlpha, "Alt " + string(alt_cur+1) + ": " + alt_name[alt_cur]);

//exclude alt. name
//textDraw(temp_x + 2, temp_y + 124, "fName", $EBFFFF, 0, 1000, 1, true, 1, "Alt. " + (alt_cur < 9 ? "0" : "") + string(alt_cur + 1));


#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol
    for (i = -1; i < 2; i++){
        for (j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, alpha);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);



#define rectDraw(x1, y1, x2, y2, color)

draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[4], argument[4], argument[4], argument[4], false);
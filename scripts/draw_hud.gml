//Hud stuff show cards

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
    init_shader();
}
shader_start();
draw_sprite_ext(sprite_get("cardUI"), 0, temp_x+144, temp_y-38, 0.5, 0.5, 0, c_white, 1);
for(i = 4; i > 0; i--)
{
    if((curCard+i) > 52) //go back to the start of the deck
        hudCard = cardDeck[curCard+4-i-52];
    else
        hudCard = cardDeck[curCard+4-i];

    draw_sprite_ext(sprite_get("cards"), 3+baseCards[hudCard], temp_x+145+i*(i == 4 ? 16 : 13), temp_y, (i == 4 ? 1 : 0.5), (i == 4 ? 1 : 0.5), 0, c_white, 1);
    if(i == 0)
        print_debug(string(baseNumber[hudCard]));
}
shader_end();
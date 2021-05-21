if (get_player_color( player ) == 19) {
    hue_offset += hue_speed;
	hue_offset = hue_offset mod 255; //keeps hue_offset within the 0-255 range

	color_rgb = make_color_rgb(225, 50, 50); //input rgb values here, uses rgb to create a gamemaker colour variable
	color_rgb2 = make_color_rgb(191, 194, 194);
	hue = (color_get_hue(color_rgb) + hue_offset) mod 255; //finds the hue and shifts it
	color_hsv = make_color_hsv(hue, color_get_saturation(color_rgb), color_get_value(color_rgb)); //creates a new gamemaker colour variable using the shifted hue
	color_hsv2 = make_color_hsv(hue, color_get_saturation(color_rgb2), color_get_value(color_rgb2));
	set_color_profile_slot(19, 0, color_get_red(color_hsv2), color_get_green(color_hsv2), color_get_blue(color_hsv2)); //uses that variable to set the slot's new colours
	set_color_profile_slot(19, 2, color_get_red(color_hsv), color_get_green(color_hsv), color_get_blue(color_hsv)); //uses that variable to set the slot's new colours
	set_color_profile_slot(19, 5, color_get_red(color_hsv)+225, color_get_green(color_hsv)+225, color_get_blue(color_hsv)+225); //uses that variable to set the slot's new colours
	set_article_color_slot(0, color_get_red(color_hsv2), color_get_green(color_hsv2), color_get_blue(color_hsv2), 1); //uses that variable to set the slot's new colours
	set_article_color_slot(2, color_get_red(color_hsv), color_get_green(color_hsv), color_get_blue(color_hsv), 1); //uses that variable to set the slot's new colours
	set_article_color_slot(5, color_get_red(color_hsv)+225, color_get_green(color_hsv)+225, color_get_blue(color_hsv)+225, 1); //uses that variable to set the slot's new colours
	init_shader();
}
if(!invertMode)
	outline_color = [0,0,0];
else
	outline_color = [255,255,255];
init_shader();

//Shuffle the card
if(cardsSpawned != 52)
{
    cardDeck[cardsSpawned] = random_func((seed + cardsSpawned * seed2) % 24,52,true);
	cardsSpawned ++;
}
//

tempCard = cardDeck[curCard];
// // //Check card deck
// if(get_gameplay_time() % 2 == 0)
// {
//     debugCount++;
//     if(debugCount == 52)
//         debugCount = 0;
// 	print_debug("Cur Card #" + string(debugCount) + "=" + string(cardDeck[debugCount]));
// }
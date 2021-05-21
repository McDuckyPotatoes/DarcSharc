if object_index != oPlayer exit;

if (get_player_color( player ) == 7) {
    for(i = 0; i < 9; i++){
        set_character_color_shading(i, 0);
    }
}
if(invertMode)
{
    outline_color = [255,255,255];
    //InvertColors
    for(i = 0; i < 7; i++)
    {
        set_character_color_slot(i, 255-get_color_profile_slot_r( get_player_color(player), i), 
        255-get_color_profile_slot_g( get_player_color(player), i), 255-get_color_profile_slot_b( get_player_color(player), i), 1);
        set_article_color_slot(i, 255-get_color_profile_slot_r( get_player_color(player), i), 
        255-get_color_profile_slot_g( get_player_color(player), i), 255-get_color_profile_slot_b( get_player_color(player), i), 1);
    }
}

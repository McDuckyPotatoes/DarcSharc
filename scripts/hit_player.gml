//Make sure that you are not a multihit move, if you are make it the last hit.
if(!moveMulti || moveMulti && my_hitboxID.hbox_num == get_num_hitboxes(attack))
{
    if(cardChosen > 10 && cardChosen < 14)
        sound_play(asset_get("sfx_flare_razer"))
    switch(cardChosen)
    {
        case 3:
            sound_play(asset_get("sfx_blow_medium2"))
            break;
        case 4:
            sound_play(asset_get("sfx_shovel_hit_light1"))
            break;
        case 5:
            sound_play(asset_get("sfx_poison_blow_weak"))
            break;
        case 6:
            sound_play(asset_get("sfx_zetter_fireball_fire"))
            break;
        case 7:
            sound_play(asset_get("mfx_hp_spawn"))
            set_player_damage( player, clamp(get_player_damage(player)-5,0,999));
            break;
        case 9:
            sound_play(asset_get("sfx_kragg_spike"))
            break;
        case 10:
            sound_play(asset_get("sfx_fishing_rod_catch"))
            break;
        case 1:
            sound_play(sound_get("DS_acecrit"))
            break;
    }

    //Go to the next card.
    if(curCard == 52)
        curCard = 0;
    else
        curCard++;
}
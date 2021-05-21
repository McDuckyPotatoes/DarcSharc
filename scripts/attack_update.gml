//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

if (attack == AT_NSPECIAL){
    if (window == 3){
        if (special_pressed){
            window = 1;
            window_timer = 0;
        }
    }
}

if (attack == AT_FSPECIAL){
    if (window == 2){
        if (special_pressed){
            window = 3;
            window_timer = 0;
            destroy_hitboxes();
        }
    }
    can_fast_fall = false;
}

if (attack == AT_USPECIAL){
    if (window == 1 && window_timer == 1){
        times_through = 0;
    }
    if (window == 2){
        if (window_timer == get_window_value(attack, 2, AG_WINDOW_LENGTH)){
            if (times_through < 10){
                times_through++;
                window_timer = 0;
            }
        }
        if (!joy_pad_idle){
            hsp += lengthdir_x(1, joy_dir);
            vsp += lengthdir_y(1, joy_dir);
        } else {
            hsp *= .6;
            vsp *= .6;
        }
        var fly_dir = point_direction(0,0,hsp,vsp);
        var fly_dist = point_distance(0,0,hsp,vsp);
        var max_speed = 12;
        if (fly_dist > max_speed){
            hsp = lengthdir_x(max_speed, fly_dir);
            vsp = lengthdir_y(max_speed, fly_dir);
        }
        if (special_pressed && times_through > 0){
            window = 4;
            window_timer = 0;
        }
        if (shield_pressed){
            window = 3;
            window_timer = 0;
        }
    }
    if (window > 3 && window < 6 && window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)){
        window++;
        window_timer = 0;
    }
}

if (attack == AT_DSPECIAL && state_timer == 1){
    if(invertMode)
    {
        for(i = 0; i < 7; i++)
        set_article_color_slot(i, get_color_profile_slot_r( get_player_color(player), i), 
        get_color_profile_slot_g( get_player_color(player), i), get_color_profile_slot_b( get_player_color(player), i), 1);
    }
    invertMode = !invertMode;
}

if (attack == AT_JAB){
    if (has_hit && window == 3 && window_timer >= 4){
        can_jump = true;
    }
}

//list multihit moves here
if(attack == AT_FTILT)
    moveMulti = true;
else
    moveMulti = false;

#region Do your card effects :)
if(state_timer = 1)
{
    cardChosen = (!invertMode ? baseNumber[tempCard] : 13-baseNumber[tempCard]);
    lastHit = get_num_hitboxes(attack);
    //Show what card hit em
    // print_debug("Card Strength: " + string(cardChosen) + "/ Cur Card #" + string(tempCard));
    //Make sure that you are not a multihit move, if you are make it the last hit.
    for(i = (moveMulti ? lastHit : 1); i < lastHit+1; i++)
    {
        //Reset stats.
        reset_hitbox_value(attack, i, HG_DAMAGE);
        reset_hitbox_value(attack, i, HG_BASE_KNOCKBACK);
        reset_hitbox_value(attack, i, HG_KNOCKBACK_SCALING);
        reset_hitbox_value(attack, i, HG_EXTRA_HITPAUSE);
        reset_hitbox_value(attack, i, HG_BASE_HITPAUSE);
        reset_hitbox_value(attack, i, HG_HITPAUSE_SCALING);
        reset_hitbox_value(attack, i, HG_EFFECT);
        reset_hitbox_value(attack, i, HG_ANGLE);
        //Do the effect when it hits >:)
        switch(cardChosen)
        {
            case 1:
                set_hitbox_value(attack, i, HG_DAMAGE, get_hitbox_value(attack, i, HG_DAMAGE)+15);
                set_hitbox_value(attack, i, HG_BASE_KNOCKBACK, get_hitbox_value(attack, i, HG_BASE_KNOCKBACK)*1.5);
                set_hitbox_value(attack, i, HG_KNOCKBACK_SCALING, get_hitbox_value(attack, i, HG_KNOCKBACK_SCALING)*1.5);
                break;
            case 3:
                set_hitbox_value(attack, i, HG_DAMAGE, get_hitbox_value(attack, i, HG_DAMAGE)+3);
                break;
            case 4:
                set_hitbox_value(attack, i, HG_BASE_KNOCKBACK, get_hitbox_value(attack, i, HG_BASE_KNOCKBACK)*1.2);
                set_hitbox_value(attack, i, HG_KNOCKBACK_SCALING, get_hitbox_value(attack, i, HG_KNOCKBACK_SCALING)*1.2);
                break;
            case 5:
                set_hitbox_value(attack, i, HG_EFFECT, 10);
                break;
            case 6:
                set_hitbox_value(attack, i, HG_EFFECT, 1);
                break;
            case 8:
                set_hitbox_value(attack, i, HG_EFFECT, 11);
                set_hitbox_value(attack, i, HG_DAMAGE, get_hitbox_value(attack, i, HG_DAMAGE)+3);
                set_hitbox_value(attack, i, HG_EXTRA_HITPAUSE, get_hitbox_value(attack, i, HG_EXTRA_HITPAUSE)+20);
                break;
            case 9:
                set_hitbox_value(attack, i, HG_ANGLE, 280);
                break;
            case 10:
                set_hitbox_value(attack, i, HG_DAMAGE, get_hitbox_value(attack, i, HG_DAMAGE)+5);
                set_hitbox_value(attack, i, HG_ANGLE, get_hitbox_value(attack, i, HG_ANGLE)+180);
                break;
            default:
                if(cardChosen > 10)
                {
                    set_hitbox_value(attack, i, HG_DAMAGE, get_hitbox_value(attack, i, HG_DAMAGE)+7);
                    set_hitbox_value(attack, i, HG_BASE_KNOCKBACK, get_hitbox_value(attack, i, HG_BASE_KNOCKBACK)*1.2);
                    set_hitbox_value(attack, i, HG_KNOCKBACK_SCALING, get_hitbox_value(attack, i, HG_KNOCKBACK_SCALING)*1.2);
                }
                set_hitbox_value(attack, i, HG_BASE_HITPAUSE, get_hitbox_value(attack, i, HG_BASE_KNOCKBACK)*2);
                set_hitbox_value(attack, i, HG_HITPAUSE_SCALING, get_hitbox_value(attack, i, HG_KNOCKBACK_SCALING)*1.4);
                break;
        }
    }   
}
#endregion